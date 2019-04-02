
Pod::Spec.new do |s|

  s.name         = "libwebp"
  s.version      = "1.0.2"
  s.summary      = "Library to encode and decode images in WebP format."

  s.source       = { :git => "https://github.com/Lidalu/libwebp.git", :branch=> s.version.to_s}

  s.compiler_flags = '-D_THREAD_SAFE'

  s.subspec 'webp' do |webp|
    webp.header_dir   = "webp"
    webp.source_files = "src/webp/*.h"
  end

  s.subspec 'core' do |core|
    core.source_files = [ "src/utils/*.{h,c}", "src/dsp/*.{h,c}", "src/enc/*.{h,c}", "src/dec/*.{h,c}"]
    core.dependency 'libwebp/webp'
  end

  s.subspec 'utils' do |utils|
    utils.dependency 'libwebp/core'
  end

  s.subspec 'dsp' do |dsp|
    dsp.dependency 'libwebp/core'
  end

  s.subspec 'enc' do |enc|
    enc.dependency 'libwebp/enc'
  end

  s.subspec 'dec' do |dec|
    dec.dependency 'libwebp/enc'
  end

  s.subspec "demux" do |demux|
    demux.dependency 'libwebp/enc'
    demux.source_files = "src/demux/*.{h,c}"
  end

  s.subspec 'mux' do |mux|
    mux.dependency 'libwebp/enc'
    mux.source_files = "src/mux/*.{h,c}"
  end

end


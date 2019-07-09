From: Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH 0/5]Add support for mt2701 JPEG ENC support
Date: Tue, 9 Jul 2019 11:20:58 +0800
Message-ID: <20190709032103.10291-1-xia.jiang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patchset add support for mt2701 JPEG ENC support.

This is the compliance test result for jpeg dec and enc.

The JPEG dec log:
------------------------------------------------------------
v4l2-compliance -d /dev/video0
v4l2-compliance SHA: 08fed4d0edb1492b91d9d1054c36fed95c372eaa, 32 bits

Compliance test for mtk-jpeg device /dev/video0:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg decoder
        Bus info         : platform:15004000.jpegdec
        Driver version   : 5.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected JPEG Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
                fail: v4l2-test-buffers.cpp(713): q.create_bufs(node, 1, &fmt) != EINVAL
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-jpeg device /dev/video0: 44, Succeeded: 43, Failed: 1, Warnings: 0
------------------------------------------------------------

The JPEG enc log:

------------------------------------------------------------
v4l2-compliance -d /dev/video1 
v4l2-compliance SHA: 08fed4d0edb1492b91d9d1054c36fed95c372eaa, 32 bits

Compliance test for mtk-jpeg device /dev/video1:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg encoder
        Bus info         : platform:1500a000.jpegenc
        Driver version   : 5.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected JPEG Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 4 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
                fail: v4l2-test-buffers.cpp(713): q.create_bufs(node, 1, &fmt) != EINVAL
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-jpeg device /dev/video1: 44, Succeeded: 43, Failed: 1, Warnings: 0
------------------------------------------------------------

Xia Jiang (5):
  media: dt-bindings: Add JPEG ENC device tree node document
  media: platform: Rename jpeg dec file name
  media: platform: Add jpeg enc feature
  media: platform: change GPLv2 license to SPDX
  arm: dts: add jpeg enc device tree node

 .../bindings/media/mediatek-jpeg-encoder.txt       |  33 +
 arch/arm/boot/dts/mt2701.dtsi                      |  12 +
 arch/arm/configs/multi_v7_defconfig                |  14 +-
 drivers/media/platform/mtk-jpeg/Makefile           |   5 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 746 ++++++++++++++++-----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    | 123 +++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  | 410 +++++++++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |  85 +++
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c   | 153 +++++
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h   |  18 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h |  51 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 175 +++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h  |  60 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h |  49 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c      | 417 ------------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h      |  91 ---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c   | 160 -----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h   |  25 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h     |  58 --
 drivers/media/v4l2-core/v4l2-ctrls.c               |   1 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 21 files changed, 1754 insertions(+), 934 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
 delete mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
 delete mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
 delete mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
 delete mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h
 delete mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h

-- 
1.9.1 

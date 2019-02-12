Return-Path: <SRS0=W7gm=QT=pengutronix.de=mfe@kernel.org>
Date: Tue, 12 Feb 2019 17:10:24 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 0/3] media: add Toshiba TC358746 Bridge support
Message-ID: <20190212161024.tvbibqgodlwctlao@pengutronix.de>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
 <20190123125403.xshgoj4wrmpnol43@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123125403.xshgoj4wrmpnol43@pengutronix.de>
To: hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, graphics@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

gentle ping..

On 19-01-23 13:54, Marco Felsch wrote:
> Hi,
> 
> Just a ping.
> 
> The kbuilder reports some warning which I will fix in a v2 but I still
> waiting for feedback from you.
> 
> Regards,
> Marco
> 
> On 18-12-18 15:12, Marco Felsch wrote:
> > Hi,
> > 
> > this patch set adds the support for the Toshiba TC358746 Parallel
> > MIPI-CSI2 bridge device.
> > 
> > The last patch ("media: tc358746: update MAINTAINERS file") is optional,
> > due to Hans answer to Michael [1]. We can drop this patch if it isn't
> > needed.
> > 
> > I added the v4l2-compliance test in relation to [1], I used v4l2-compliance
> > version 1.16.0. Unfortunately the VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT test
> > failed, but the device don't support events at all, as described in the
> > commit message of the 2nd patch.
> > 
> > The patche set was succefully rebased on top of media_tree/master and
> > compile tested.
> > 
> > [1] https://marc.info/?l=linux-kernel&m=154330540418714&w=2
> > 
> > Regards,
> > Marco
> > 
> > 8<----------------------------------------------------------
> > 
> > root@samx6i:~# v4l2-compliance -s -u /dev/v4l-subdev12
> > v4l2-compliance SHA: not available, 32 bits
> > 
> > Compliance test for device /dev/v4l-subdev12:
> > 
> > Media Driver Info:
> >         Driver name      : imx-media
> >         Model            : imx-media
> >         Serial           : 
> >         Bus info         : 
> >         Media version    : 4.20.0
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 4.20.0
> > Interface Info:
> >         ID               : 0x030000a6
> >         Type             : V4L Sub-Device
> > Entity Info:
> >         ID               : 0x00000056 (86)
> >         Name             : tc358746 6-000e
> >         Function         : Video Interface Bridge
> >         Pad 0x01000057   : 0: Sink
> >           Link 0x0200008c: from remote pad 0x100005a of entity 'mt9m111 6-0048': Data, Enabled
> >         Pad 0x01000058   : 1: Source
> >           Link 0x0200008a: to remote pad 0x1000051 of entity 'imx6-mipi-csi2': Data, Enabled
> > 
> > Required ioctls:
> >         test MC information (see 'Media Driver Info' above): OK
> > 
> > Allow for multiple opens:
> >         test second /dev/v4l-subdev12 open: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_LOG_STATUS: OK
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 0):
> >         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Try VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Active VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 1):
> >         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Try VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Active VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >                 fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-controls.cpp(816): subscribe event for control 'Image Processing Controls' failed
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 3 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK (Not Supported)
> >         test VIDIOC_TRY_FMT: OK (Not Supported)
> >         test VIDIOC_S_FMT: OK (Not Supported)
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> > 
> > Total: 54, Succeeded: 53, Failed: 1, Warnings: 0
> > 
> > 8<----------------------------------------------------------
> > 
> > Marco Felsch (3):
> >   media: dt-bindings: add bindings for Toshiba TC358746
> >   media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
> >   media: tc358746: update MAINTAINERS file
> > 
> >  .../bindings/media/i2c/toshiba,tc358746.txt   |   80 +
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/i2c/Kconfig                     |   12 +
> >  drivers/media/i2c/Makefile                    |    1 +
> >  drivers/media/i2c/tc358746.c                  | 1847 +++++++++++++++++
> >  drivers/media/i2c/tc358746_regs.h             |  208 ++
> >  6 files changed, 2155 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> >  create mode 100644 drivers/media/i2c/tc358746.c
> >  create mode 100644 drivers/media/i2c/tc358746_regs.h
> > 
> > -- 
> > 2.19.1
> > 
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

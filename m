From: "Wu, Songjun" <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v6 0/2] [media] atmel-isc: add driver for Atmel ISC
Date: Fri, 22 Jul 2016 13:21:09 +0800
Message-ID: <4e2bb244-42ad-3d20-0325-0a35991fae58@microchip.com>
References: <1469088900-23935-1-git-send-email-songjun.wu@microchip.com>
 <e0592f57-f679-fcde-7446-e3259ad9825b@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e0592f57-f679-fcde-7446-e3259ad9825b-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=83=c2=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kamil Debski <kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Richard_R=c3=b6jfors?= <richard-hy+oXTTr619xRVliYXHCzg@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms+renesas@v>
List-Id: devicetree@vger.kernel.org



On 7/21/2016 16:41, Hans Verkuil wrote:
>
>
> On 07/21/2016 10:14 AM, Songjun Wu wrote:
>> The Image Sensor Controller driver includes two parts.
>> 1) Driver code to implement the ISC function.
>> 2) Device tree binding documentation, it describes how
>>    to add the ISC in device tree.
>>
>> Test result with v4l-utils 1.10.1
>
> Please compile from the v4l-utils repository. The version you used here is out-of-date.
> I continually add new tests, so always compile the latest version from the repo.
>
OK, I will compile the latest version from the v4l-utils repository.
Thank you.

> Regards,
>
> 	Hans
>
>> Driver Info:
>>         Driver name   : atmel_isc
>>         Card type     : Atmel Image Sensor Controller
>>         Bus info      : platform:atmel_isc f0008000.isc
>>         Driver version: 4.7.0
>>         Capabilities  : 0x84200001
>>                 Video Capture
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps   : 0x04200001
>>                 Video Capture
>>                 Streaming
>>                 Extended Pix Format
>>
>> Compliance test for device /dev/video0 (not using libv4l2):
>>
>> Required ioctls:
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second video open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Test input 0:
>>
>>         Control ioctls:
>>                 test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>                 test VIDIOC_QUERYCTRL: OK (Not Supported)
>>                 test VIDIOC_G/S_CTRL: OK (Not Supported)
>>                 test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>                 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>                 test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>                 Standard Controls: 0 Private Controls: 0
>>
>>         Format ioctls:
>>                 test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>                 test VIDIOC_G/S_PARM: OK
>>                 test VIDIOC_G_FBUF: OK (Not Supported)
>>                 test VIDIOC_G_FMT: OK
>>                 test VIDIOC_TRY_FMT: OK
>>                 test VIDIOC_S_FMT: OK
>>                 test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>                 test Cropping: OK (Not Supported)
>>                 test Composing: OK (Not Supported)
>>                 test Scaling: OK (Not Supported)
>>
>>         Codec ioctls:
>>                 test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>                 test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>                 test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>>         Buffer ioctls:
>>                 test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>                 test VIDIOC_EXPBUF: OK
>>
>> Test input 0:
>>
>> Stream using all formats:
>>         test MMAP for Format BA81, Frame Size 640x480:
>>                 Stride 640, Field None: OK
>>         test MMAP for Format YUYV, Frame Size 640x480:
>>                 Stride 1280, Field None: OK
>>
>> Total: 44, Succeeded: 44, Failed: 0, Warnings: 0
>>
>> Changes in v6:
>> - Add "iscck" and "gck" to clock-names.
>>
>> Changes in v5:
>> - Modify the macro definition and the related code.
>> - Add clock-output-names.
>>
>> Changes in v4:
>> - Modify the isc clock code since the dt is changed.
>> - Remove the isc clock nodes.
>>
>> Changes in v3:
>> - Add pm runtime feature.
>> - Modify the isc clock code since the dt is changed.
>> - Remove the 'atmel,sensor-preferred'.
>> - Modify the isc clock node according to the Rob's remarks.
>>
>> Changes in v2:
>> - Add "depends on COMMON_CLK" and "VIDEO_V4L2_SUBDEV_API"
>>   in Kconfig file.
>> - Correct typos and coding style according to Laurent's remarks
>> - Delete the loop while in 'isc_clk_enable' function.
>> - Replace 'hsync_active', 'vsync_active' and 'pclk_sample'
>>   with 'pfe_cfg0' in struct isc_subdev_entity.
>> - Add the code to support VIDIOC_CREATE_BUFS in
>>   'isc_queue_setup' function.
>> - Invoke isc_config to configure register in
>>   'isc_start_streaming' function.
>> - Add the struct completion 'comp' to synchronize with
>>   the frame end interrupt in 'isc_stop_streaming' function.
>> - Check the return value of the clk_prepare_enable
>>   in 'isc_open' function.
>> - Set the default format in 'isc_open' function.
>> - Add an exit condition in the loop while in 'isc_config'.
>> - Delete the hardware setup operation in 'isc_set_format'.
>> - Refuse format modification during streaming
>>   in 'isc_s_fmt_vid_cap' function.
>> - Invoke v4l2_subdev_alloc_pad_config to allocate and
>>   initialize the pad config in 'isc_async_complete' function.
>> - Remove the '.owner  = THIS_MODULE,' in atmel_isc_driver.
>> - Replace the module_platform_driver_probe() with
>>   module_platform_driver().
>> - Remove the unit address of the endpoint.
>> - Add the unit address to the clock node.
>> - Avoid using underscores in node names.
>> - Drop the "0x" in the unit address of the i2c node.
>> - Modify the description of 'atmel,sensor-preferred'.
>> - Add the description for the ISC internal clock.
>>
>> Songjun Wu (2):
>>   [media] atmel-isc: add the Image Sensor Controller code
>>   [media] atmel-isc: DT binding for Image Sensor Controller driver
>>
>>  .../devicetree/bindings/media/atmel-isc.txt        |   65 +
>>  drivers/media/platform/Kconfig                     |    1 +
>>  drivers/media/platform/Makefile                    |    2 +
>>  drivers/media/platform/atmel/Kconfig               |    9 +
>>  drivers/media/platform/atmel/Makefile              |    1 +
>>  drivers/media/platform/atmel/atmel-isc-regs.h      |  165 +++
>>  drivers/media/platform/atmel/atmel-isc.c           | 1554 ++++++++++++++++++++
>>  7 files changed, 1797 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
>>  create mode 100644 drivers/media/platform/atmel/Kconfig
>>  create mode 100644 drivers/media/platform/atmel/Makefile
>>  create mode 100644 drivers/media/platform/atmel/atmel-isc-regs.h
>>  create mode 100644 drivers/media/platform/atmel/atmel-isc.c
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

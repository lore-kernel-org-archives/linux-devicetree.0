From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 00/34] i.MX Media Driver
Date: Mon, 29 May 2017 10:23:25 -0700
Message-ID: <85c134d0-80f1-4313-2028-61bdad37903e@gmail.com>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <dd82968a-4c0b-12a4-f43b-7e63a255812d@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dd82968a-4c0b-12a4-f43b-7e63a255812d-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans, thanks for the reply...


On 05/29/2017 06:46 AM, Hans Verkuil wrote:
> Hi Steve,
>
> On 05/25/2017 02:29 AM, Steve Longerbeam wrote:
>> In version 7:
>>
>>
>
> What is the status as of v7?
>
> From what I can tell patch 2/34 needs an Ack from Rob Herring,


Yes still missing that Ack. I think the issue is likely the Synopsys DW
mipi csi-2 bindings. Someone earlier noted that there is another driver
under devel for this Synopsys core, with another set of bindings.
But it was determined that in fact this is a different device with a
different register set.

 From what I remember of dealing with Synopsys cores in the past,
these cores are highly configurable using their coreBuilder tools. So
while the other device might stem from the same initial core from
Synopsys, it was probably built with different design parameters
compared to the core that exists in the i.MX6. So in essence it is a
different device.


> patches
> 4-14 are out of scope for the media subsystem,

Ok. I did submit patches 4-14 to the right set of folks. Should I just
drop this set in the next submission if they have not changed?

> patches 20-25 and 27-34
> are all staging (so fine to be merged from my point of view).
>
> I'm not sure if patch 26 (defconfig) should be applied while the imx
> driver is in staging. I would suggest that this patch is moved to the end
> of the series.

Ok.

>
> That leaves patches 15-19. I replied to patch 15 with a comment, patches
> 16-18 look good to me, although patches 17 and 18 should be combined 
> to one
> patch since patch 17 won't compile otherwise. Any idea when the 
> multiplexer is
> expected to be merged? (just curious)

Philipp replied separately.

>
> I would really like to get this merged for 4.13, so did I miss anything?
> From what I can tell it is really just an Ack for patch 2/34.

Agreed.

Steve


>
>
>>
>>
>> Marek Vasut (1):
>>    media: imx: Drop warning upon multiple S_STREAM disable calls
>>
>> Philipp Zabel (9):
>>    dt-bindings: Add bindings for video-multiplexer device
>>    ARM: dts: imx6qdl: add multiplexer controls
>>    ARM: dts: imx6qdl: Add video multiplexers, mipi_csi, and their
>>      connections
>>    add mux and video interface bridge entity functions
>>    platform: add video-multiplexer subdevice driver
>>    platform: video-mux: include temporary mmio-mux support
>>    media: imx: csi: increase burst size for YUV formats
>>    media: imx: csi: add frame skipping support
>>    media: imx: csi: add sink selection rectangles
>>
>> Russell King (3):
>>    media: imx: csi: add support for bayer formats
>>    media: imx: csi: add frame size/interval enumeration
>>    media: imx: capture: add frame sizes/interval enumeration
>>
>> Steve Longerbeam (21):
>>    [media] dt-bindings: Add bindings for i.MX media driver
>>    [media] dt/bindings: Add bindings for OV5640
>>    ARM: dts: imx6qdl: Add compatible, clocks, irqs to MIPI CSI-2 node
>>    ARM: dts: imx6qdl: add capture-subsystem device
>>    ARM: dts: imx6qdl-sabrelite: remove erratum ERR006687 workaround
>>    ARM: dts: imx6-sabrelite: add OV5642 and OV5640 camera sensors
>>    ARM: dts: imx6-sabresd: add OV5642 and OV5640 camera sensors
>>    ARM: dts: imx6-sabreauto: create i2cmux for i2c3
>>    ARM: dts: imx6-sabreauto: add reset-gpios property for max7310_b
>>    ARM: dts: imx6-sabreauto: add pinctrl for gpt input capture
>>    ARM: dts: imx6-sabreauto: add the ADV7180 video decoder
>>    [media] add Omnivision OV5640 sensor driver
>>    media: Add userspace header file for i.MX
>>    media: Add i.MX media core driver
>>    media: imx: Add Capture Device Interface
>>    media: imx: Add CSI subdev driver
>>    media: imx: Add VDIC subdev driver
>>    media: imx: Add IC subdev drivers
>>    media: imx: Add MIPI CSI-2 Receiver subdev driver
>>    ARM: imx_v6_v7_defconfig: Enable staging video4linux drivers
>>    media: imx: set and propagate default field, colorimetry
>>
>>   .../devicetree/bindings/media/i2c/ov5640.txt       |   45 +
>>   Documentation/devicetree/bindings/media/imx.txt    |   74 +
>>   .../devicetree/bindings/media/video-mux.txt        |   60 +
>>   Documentation/media/uapi/mediactl/media-types.rst  |   22 +
>>   Documentation/media/v4l-drivers/imx.rst            |  590 ++++++
>>   arch/arm/boot/dts/imx6dl-sabrelite.dts             |    5 +
>>   arch/arm/boot/dts/imx6dl-sabresd.dts               |    5 +
>>   arch/arm/boot/dts/imx6dl.dtsi                      |  189 ++
>>   arch/arm/boot/dts/imx6q-sabrelite.dts              |    5 +
>>   arch/arm/boot/dts/imx6q-sabresd.dts                |    5 +
>>   arch/arm/boot/dts/imx6q.dtsi                       |  125 ++
>>   arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |  144 +-
>>   arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |  152 +-
>>   arch/arm/boot/dts/imx6qdl-sabresd.dtsi             |  114 +-
>>   arch/arm/boot/dts/imx6qdl.dtsi                     |   20 +-
>>   arch/arm/configs/imx_v6_v7_defconfig               |   11 +
>>   drivers/media/i2c/Kconfig                          |    9 +
>>   drivers/media/i2c/Makefile                         |    1 +
>>   drivers/media/i2c/ov5640.c                         | 2224 
>> ++++++++++++++++++++
>>   drivers/media/platform/Kconfig                     |    6 +
>>   drivers/media/platform/Makefile                    |    2 +
>>   drivers/media/platform/video-mux.c                 |  357 ++++
>>   drivers/staging/media/Kconfig                      |    2 +
>>   drivers/staging/media/Makefile                     |    1 +
>>   drivers/staging/media/imx/Kconfig                  |   20 +
>>   drivers/staging/media/imx/Makefile                 |   12 +
>>   drivers/staging/media/imx/TODO                     |   15 +
>>   drivers/staging/media/imx/imx-ic-common.c          |  113 +
>>   drivers/staging/media/imx/imx-ic-prp.c             |  514 +++++
>>   drivers/staging/media/imx/imx-ic-prpencvf.c        | 1309 ++++++++++++
>>   drivers/staging/media/imx/imx-ic.h                 |   38 +
>>   drivers/staging/media/imx/imx-media-capture.c      |  775 +++++++
>>   drivers/staging/media/imx/imx-media-csi.c          | 1842 
>> ++++++++++++++++
>>   drivers/staging/media/imx/imx-media-dev.c          |  665 ++++++
>>   drivers/staging/media/imx/imx-media-fim.c          |  463 ++++
>>   drivers/staging/media/imx/imx-media-internal-sd.c  |  349 +++
>>   drivers/staging/media/imx/imx-media-of.c           |  268 +++
>>   drivers/staging/media/imx/imx-media-utils.c        |  896 ++++++++
>>   drivers/staging/media/imx/imx-media-vdic.c         | 1009 +++++++++
>>   drivers/staging/media/imx/imx-media.h              |  326 +++
>>   drivers/staging/media/imx/imx6-mipi-csi2.c         |  697 ++++++
>>   include/linux/imx-media.h                          |   27 +
>>   include/media/imx.h                                |   15 +
>>   include/uapi/linux/media.h                         |    6 +
>>   include/uapi/linux/v4l2-controls.h                 |    4 +
>>   45 files changed, 13504 insertions(+), 27 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/media/i2c/ov5640.txt
>>   create mode 100644 Documentation/devicetree/bindings/media/imx.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/media/video-mux.txt
>>   create mode 100644 Documentation/media/v4l-drivers/imx.rst
>>   create mode 100644 drivers/media/i2c/ov5640.c
>>   create mode 100644 drivers/media/platform/video-mux.c
>>   create mode 100644 drivers/staging/media/imx/Kconfig
>>   create mode 100644 drivers/staging/media/imx/Makefile
>>   create mode 100644 drivers/staging/media/imx/TODO
>>   create mode 100644 drivers/staging/media/imx/imx-ic-common.c
>>   create mode 100644 drivers/staging/media/imx/imx-ic-prp.c
>>   create mode 100644 drivers/staging/media/imx/imx-ic-prpencvf.c
>>   create mode 100644 drivers/staging/media/imx/imx-ic.h
>>   create mode 100644 drivers/staging/media/imx/imx-media-capture.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-csi.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-dev.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-fim.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-internal-sd.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-of.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-utils.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-vdic.c
>>   create mode 100644 drivers/staging/media/imx/imx-media.h
>>   create mode 100644 drivers/staging/media/imx/imx6-mipi-csi2.c
>>   create mode 100644 include/linux/imx-media.h
>>   create mode 100644 include/media/imx.h
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <SRS0=kABI=YS=mentor.com=Steve_Longerbeam@kernel.org>
From: Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH 11/20] media: Add i.MX media core driver
References: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
 <1483050455-10683-12-git-send-email-steve_longerbeam@mentor.com>
 <20170103211755.a3a3g5woi272cexe@rob-hp-laptop>
Message-ID: <5a263ef7-13bd-5aaa-8e34-93f5defa3604@mentor.com>
Date: Tue, 3 Jan 2017 21:23:17 -0800
MIME-Version: 1.0
In-Reply-To: <20170103211755.a3a3g5woi272cexe@rob-hp-laptop>
Content-Type: multipart/alternative;
	boundary="------------B5447C6B0BF182E03F80A287"
To: Rob Herring <robh@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, gnurou@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
List-ID: <devicetree@vger.kernel.org>

--------------B5447C6B0BF182E03F80A287
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,


On 01/03/2017 01:17 PM, Rob Herring wrote:
> On Thu, Dec 29, 2016 at 02:27:26PM -0800, Steve Longerbeam wrote:
>> Add the core media driver for i.MX SOC.
>>
>> Signed-off-by: Steve Longerbeam<steve_longerbeam@mentor.com>
>> ---
>>   Documentation/devicetree/bindings/media/imx.txt   | 205 +++++
>>   Documentation/media/v4l-drivers/imx.rst           | 429 ++++++++++
>>   drivers/staging/media/Kconfig                     |   2 +
>>   drivers/staging/media/Makefile                    |   1 +
>>   drivers/staging/media/imx/Kconfig                 |   8 +
>>   drivers/staging/media/imx/Makefile                |   6 +
>>   drivers/staging/media/imx/TODO                    |  18 +
>>   drivers/staging/media/imx/imx-media-common.c      | 981 ++++++++++++++++++++++
>>   drivers/staging/media/imx/imx-media-dev.c         | 479 +++++++++++
>>   drivers/staging/media/imx/imx-media-fim.c         | 508 +++++++++++
>>   drivers/staging/media/imx/imx-media-internal-sd.c | 456 ++++++++++
>>   drivers/staging/media/imx/imx-media-of.c          | 291 +++++++
>>   drivers/staging/media/imx/imx-media-of.h          |  25 +
>>   drivers/staging/media/imx/imx-media.h             | 290 +++++++
>>   include/media/imx.h                               |  15 +
>>   include/uapi/Kbuild                               |   1 +
>>   include/uapi/linux/v4l2-controls.h                |   4 +
>>   include/uapi/media/Kbuild                         |   2 +
>>   include/uapi/media/imx.h                          |  30 +
>>   19 files changed, 3751 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/imx.txt
>>   create mode 100644 Documentation/media/v4l-drivers/imx.rst
>>   create mode 100644 drivers/staging/media/imx/Kconfig
>>   create mode 100644 drivers/staging/media/imx/Makefile
>>   create mode 100644 drivers/staging/media/imx/TODO
>>   create mode 100644 drivers/staging/media/imx/imx-media-common.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-dev.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-fim.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-internal-sd.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-of.c
>>   create mode 100644 drivers/staging/media/imx/imx-media-of.h
>>   create mode 100644 drivers/staging/media/imx/imx-media.h
>>   create mode 100644 include/media/imx.h
>>   create mode 100644 include/uapi/media/Kbuild
>>   create mode 100644 include/uapi/media/imx.h
>>
>> diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
>> new file mode 100644
>> index 0000000..3593354
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/imx.txt
>> @@ -0,0 +1,205 @@
>> +Freescale i.MX Media Video Devices
>> +
>> +Video Media Controller node
>> +---------------------------
>> +
>> +This is the parent media controller node for video capture support.
>> +
>> +Required properties:
>> +- compatible : "fsl,imx-media";
>> +- ports      : Should contain a list of phandles pointing to camera
>> +  	       sensor interface ports of IPU devices
>> +
>> +
>> +fim child node
>> +--------------
>> +
>> +This is an optional child node of the ipu_csi port nodes. It can be used
>> +to modify the default control values for the video capture Frame
>> +Interval Monitor. Refer to Documentation/media/v4l-drivers/imx.rst for
>> +more info on the Frame Interval Monitor.
>> +
>> +Optional properties:
>> +- enable          : enable (1) or disable (0) the FIM;
> "status" property doesn't work for you?

The use of the status property could make sense in this case, i.e.
status = "disabled" would mean the FIM is disabled permanently (can
never be enabled at run-time). But the "enable" property, and all the
other FIM properties, are meant to override the v4l2 control default
values. So "enable = <0>" means the FIM is disabled by default but
can be enabled using the v4l2 control.

>> +- num-avg         : how many frame intervals the FIM will average;
>> +- num-skip        : how many frames the FIM will skip after a video
>> +		    capture restart before beginning to sample frame
>> +		    intervals;
>> +- tolerance-range : a range of tolerances for the averaged frame
>> +		    interval error, specified as <min max>, in usec.
>> +		    The FIM will signal a frame interval error if
>> +		    min < error < max. If the max is <= min, then
>> +		    tolerance range is disabled (interval error if
>> +		    error > min).
> Needs a unit suffix (see property-units.txt).

right, thanks.

>> +- input-capture-channel: an input capture channel and channel flags,
> These all need vendor prefix.

Ok.

>> +			 specified as <chan flags>. The channel number
>> +			 must be 0 or 1. The flags can be
>> +			 IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, or
>> +			 IRQ_TYPE_EDGE_BOTH, and specify which input
>> +			 capture signal edge will trigger the event. If
>> +			 an input capture channel is specified, the FIM
>> +			 will use this method to measure frame intervals
>> +			 instead of via the EOF interrupt. The input capture
>> +			 method is much preferred over EOF as it is not
>> +			 subject to interrupt latency errors. However it
>> +			 requires routing the VSYNC or FIELD output
>> +			 signals of the camera sensor to one of the
>> +			 i.MX input capture pads (SD1_DAT0, SD1_DAT1),
>> +			 which also gives up support for SD1.
>> +
>> +
>> +mipi_csi2 node
>> +--------------
>> +
>> +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
>> +CSI-2 sensors.
>> +
>> +Required properties:
>> +- compatible	: "fsl,imx-mipi-csi2";
> This needs to be an SoC specific compatible string.

changed to "fsl,imx6-mipi-csi2".

>> +- reg           : physical base address and length of the register set;
>> +- clocks	: the MIPI CSI-2 receiver requires three clocks: hsi_tx
>> +                  (the DPHY clock), video_27m, and eim_sel;
>> +- clock-names	: must contain "dphy_clk", "cfg_clk", "pix_clk";
> "_clk" is redundant.

fixed.

>> +
>> +Optional properties:
>> +- interrupts	: must contain two level-triggered interrupts,
>> +                  in order: 100 and 101;
>> +
>> +
>> +video mux node
>> +--------------
>> +
>> +This is the device node for the video multiplexer. It can control
>> +either the i.MX internal video mux that selects between parallel image
>> +sensors and MIPI CSI-2 virtual channels, or an external mux controlled
>> +by a GPIO. It must be a child device of the syscon GPR device.
> These sound like 2 completely separate things and should not both be
> "imx-video-mux".

I ended up bringing in Philipp Zabel's patch that adds the OF graph for
video capture. In his version, the video mux device is a child of the
gpr device, and the gpr device is made a multi-function device 
("simple-mfd").
I had my own version of an OF graph for imx video capture that did not 
do this
but referred to the controlling gpr device by phandle. To clear things 
up I could
simply restate that it is "a child device of the syscon GPR 
multi-function device".
Or go back to referring to the gpr by phandle. Or maybe I misunderstood your
comment.


>> +
>> +Required properties:
>> +- compatible	: "imx-video-mux";
> Needs to be SoC specific.

Actually, the video mux subdev has no imx specifics. It uses generic
syscon regmap or gpio to do its work. The video mux subdev driver
from Philipp that I brought in is an old one. He just posted a new one
that explicitly makes the video mux driver a generic subdev, which
I agree makes sense and will bring in.

>
> <snip>
>> +- mux-gpios	: if reg is not specified, this must exist to define
>> +    		  a GPIO to control an external mux;
>> +
>> +
>> +SabreLite Quad with OV5642 and OV5640
>> +-------------------------------------
> Don't put board specifics in here. I assume these sensors are already
> documented?

The adv7180 is documented already at
Documentation/devicetree/bindings/media/i2c/adv7180.txt, so I'll add
some missing properties to that.

There is no binding docs yet for the OV564x. Part of work to be done
is to combine, clean up, and move the ov5640/ov5642 subdevs in
drivers/media/i2c. Once that is done the binding docs for ov564x
can be created under Documentation/devicetree/bindings/media/i2c.

Steve



--------------B5447C6B0BF182E03F80A287
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Rob,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/03/2017 01:17 PM, Rob Herring
      wrote:<br>
    </div>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">On Thu, Dec 29, 2016 at 02:27:26PM -0800, Steve Longerbeam wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Add the core media driver for i.MX SOC.

Signed-off-by: Steve Longerbeam <a class="moz-txt-link-rfc2396E" href="mailto:steve_longerbeam@mentor.com">&lt;steve_longerbeam@mentor.com&gt;</a>
---
 Documentation/devicetree/bindings/media/imx.txt   | 205 +++++
 Documentation/media/v4l-drivers/imx.rst           | 429 ++++++++++
 drivers/staging/media/Kconfig                     |   2 +
 drivers/staging/media/Makefile                    |   1 +
 drivers/staging/media/imx/Kconfig                 |   8 +
 drivers/staging/media/imx/Makefile                |   6 +
 drivers/staging/media/imx/TODO                    |  18 +
 drivers/staging/media/imx/imx-media-common.c      | 981 ++++++++++++++++++++++
 drivers/staging/media/imx/imx-media-dev.c         | 479 +++++++++++
 drivers/staging/media/imx/imx-media-fim.c         | 508 +++++++++++
 drivers/staging/media/imx/imx-media-internal-sd.c | 456 ++++++++++
 drivers/staging/media/imx/imx-media-of.c          | 291 +++++++
 drivers/staging/media/imx/imx-media-of.h          |  25 +
 drivers/staging/media/imx/imx-media.h             | 290 +++++++
 include/media/imx.h                               |  15 +
 include/uapi/Kbuild                               |   1 +
 include/uapi/linux/v4l2-controls.h                |   4 +
 include/uapi/media/Kbuild                         |   2 +
 include/uapi/media/imx.h                          |  30 +
 19 files changed, 3751 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/imx.txt
 create mode 100644 Documentation/media/v4l-drivers/imx.rst
 create mode 100644 drivers/staging/media/imx/Kconfig
 create mode 100644 drivers/staging/media/imx/Makefile
 create mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 drivers/staging/media/imx/imx-media-common.c
 create mode 100644 drivers/staging/media/imx/imx-media-dev.c
 create mode 100644 drivers/staging/media/imx/imx-media-fim.c
 create mode 100644 drivers/staging/media/imx/imx-media-internal-sd.c
 create mode 100644 drivers/staging/media/imx/imx-media-of.c
 create mode 100644 drivers/staging/media/imx/imx-media-of.h
 create mode 100644 drivers/staging/media/imx/imx-media.h
 create mode 100644 include/media/imx.h
 create mode 100644 include/uapi/media/Kbuild
 create mode 100644 include/uapi/media/imx.h

diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
new file mode 100644
index 0000000..3593354
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/imx.txt
@@ -0,0 +1,205 @@
+Freescale i.MX Media Video Devices
+
+Video Media Controller node
+---------------------------
+
+This is the parent media controller node for video capture support.
+
+Required properties:
+- compatible : "fsl,imx-media";
+- ports      : Should contain a list of phandles pointing to camera
+  	       sensor interface ports of IPU devices
+
+
+fim child node
+--------------
+
+This is an optional child node of the ipu_csi port nodes. It can be used
+to modify the default control values for the video capture Frame
+Interval Monitor. Refer to Documentation/media/v4l-drivers/imx.rst for
+more info on the Frame Interval Monitor.
+
+Optional properties:
+- enable          : enable (1) or disable (0) the FIM;
</pre>
      </blockquote>
      <pre wrap="">"status" property doesn't work for you?</pre>
    </blockquote>
    <br>
    The use of the status property could make sense in this case, i.e.<br>
    status = "disabled" would mean the FIM is disabled permanently (can<br>
    never be enabled at run-time). But the "enable" property, and all
    the<br>
    other FIM properties, are meant to override the v4l2 control default<br>
    values. So "enable = &lt;0&gt;" means the FIM is disabled by default
    but<br>
    can be enabled using the v4l2 control.<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+- num-avg         : how many frame intervals the FIM will average;
+- num-skip        : how many frames the FIM will skip after a video
+		    capture restart before beginning to sample frame
+		    intervals;
+- tolerance-range : a range of tolerances for the averaged frame
+		    interval error, specified as &lt;min max&gt;, in usec.
+		    The FIM will signal a frame interval error if
+		    min &lt; error &lt; max. If the max is &lt;= min, then
+		    tolerance range is disabled (interval error if
+		    error &gt; min).
</pre>
      </blockquote>
      <pre wrap="">Needs a unit suffix (see property-units.txt).</pre>
    </blockquote>
    <br>
    right, thanks.<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+- input-capture-channel: an input capture channel and channel flags,
</pre>
      </blockquote>
      <pre wrap="">These all need vendor prefix.</pre>
    </blockquote>
    <br>
    Ok.<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+			 specified as &lt;chan flags&gt;. The channel number
+			 must be 0 or 1. The flags can be
+			 IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, or
+			 IRQ_TYPE_EDGE_BOTH, and specify which input
+			 capture signal edge will trigger the event. If
+			 an input capture channel is specified, the FIM
+			 will use this method to measure frame intervals
+			 instead of via the EOF interrupt. The input capture
+			 method is much preferred over EOF as it is not
+			 subject to interrupt latency errors. However it
+			 requires routing the VSYNC or FIELD output
+			 signals of the camera sensor to one of the
+			 i.MX input capture pads (SD1_DAT0, SD1_DAT1),
+			 which also gives up support for SD1.
+
+
+mipi_csi2 node
+--------------
+
+This is the device node for the MIPI CSI-2 Receiver, required for MIPI
+CSI-2 sensors.
+
+Required properties:
+- compatible	: "fsl,imx-mipi-csi2";
</pre>
      </blockquote>
      <pre wrap="">This needs to be an SoC specific compatible string.</pre>
    </blockquote>
    <br>
    changed to "fsl,imx6-mipi-csi2".<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+- reg           : physical base address and length of the register set;
+- clocks	: the MIPI CSI-2 receiver requires three clocks: hsi_tx
+                  (the DPHY clock), video_27m, and eim_sel;
+- clock-names	: must contain "dphy_clk", "cfg_clk", "pix_clk";
</pre>
      </blockquote>
      <pre wrap="">"_clk" is redundant.</pre>
    </blockquote>
    <br>
    fixed.<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+Optional properties:
+- interrupts	: must contain two level-triggered interrupts,
+                  in order: 100 and 101;
+
+
+video mux node
+--------------
+
+This is the device node for the video multiplexer. It can control
+either the i.MX internal video mux that selects between parallel image
+sensors and MIPI CSI-2 virtual channels, or an external mux controlled
+by a GPIO. It must be a child device of the syscon GPR device.
</pre>
      </blockquote>
      <pre wrap="">These sound like 2 completely separate things and should not both be 
"imx-video-mux".</pre>
    </blockquote>
    <br>
    I ended up bringing in Philipp Zabel's patch that adds the OF graph
    for<br>
    video capture. In his version, the video mux device is a child of
    the<br>
    gpr device, and the gpr device is made a multi-function device
    ("simple-mfd").<br>
    I had my own version of an OF graph for imx video capture that did
    not do this<br>
    but referred to the controlling gpr device by phandle. To clear
    things up I could<br>
    simply restate that it is "a child device of the syscon GPR
    multi-function device".<br>
    Or go back to referring to the gpr by phandle. Or maybe I
    misunderstood your<br>
    comment.<br>
    <br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+Required properties:
+- compatible	: "imx-video-mux";
</pre>
      </blockquote>
      <pre wrap="">Needs to be SoC specific.</pre>
    </blockquote>
    <br>
    Actually, the video mux subdev has no imx specifics. It uses generic<br>
    syscon regmap or gpio to do its work. The video mux subdev driver<br>
    from Philipp that I brought in is an old one. He just posted a new
    one<br>
    that explicitly makes the video mux driver a generic subdev, which<br>
    I agree makes sense and will bring in.<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite">
      <pre wrap="">

</pre>
      &lt;snip&gt;<br>
      <blockquote type="cite">
        <pre wrap="">+- mux-gpios	: if reg is not specified, this must exist to define
+    		  a GPIO to control an external mux;
+
+
+SabreLite Quad with OV5642 and OV5640
+-------------------------------------
</pre>
      </blockquote>
      <pre wrap="">Don't put board specifics in here. I assume these sensors are already 
documented?</pre>
    </blockquote>
    <br>
    The adv7180 is documented already at <br>
    Documentation/devicetree/bindings/media/i2c/adv7180.txt, so I'll add<br>
    some missing properties to that.<br>
    <br>
    There is no binding docs yet for the OV564x. Part of work to be done<br>
    is to combine, clean up, and move the ov5640/ov5642 subdevs in<br>
    drivers/media/i2c. Once that is done the binding docs for ov564x<br>
    can be created under Documentation/devicetree/bindings/media/i2c.<br>
    <br>
    Steve<br>
    <br>
    <blockquote cite="mid:20170103211755.a3a3g5woi272cexe@rob-hp-laptop"
      type="cite"></blockquote>
    <br>
  </body>
</html>

--------------B5447C6B0BF182E03F80A287--

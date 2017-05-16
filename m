From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt: Add bindings documentation for DW
 MIPI CSI-2 Host
Date: Tue, 16 May 2017 18:55:01 +0100
Message-ID: <35afb18d-3e5b-55a3-fee8-4062e2a9aafb@synopsys.com>
References: <cover.1488885081.git.roliveir@synopsys.com>
 <3478bf7c84fd8c8bdcff4f0170ee0344eca13f60.1488885081.git.roliveir@synopsys.com>
 <20170315182644.silefj6xq47dzfmg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170315182644.silefj6xq47dzfmg@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your feedback and sorry for the late reply.

On 3/15/2017 6:26 PM, Rob Herring wrote:
> On Tue, Mar 07, 2017 at 02:37:48PM +0000, Ramiro Oliveira wrote:
>> Create device tree bindings documentation for the Synopsys DW MIPI CSI-2
>>  Host.
>>
>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/snps,dw-mipi-csi.txt | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt
>> new file mode 100644
>> index 000000000000..5b24eb43d760
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt
>> @@ -0,0 +1,37 @@
>> +Synopsys DesignWare CSI-2 Host controller
>> +
>> +Description
>> +-----------
>> +
>> +This HW block is used to receive image coming from an MIPI CSI-2 compatible
>> +camera.
>> +
>> +Required properties:
>> +- compatible: shall be "snps,dw-mipi-csi"
> 
> ... "and an SoC specific compatible string"
> 

I'm not sure what you mean by this.

>> +- reg		: physical base address and size of the device memory mapped
>> +  registers;
>> +- interrupts	: CSI-2 Host interrupt
>> +- output-type   : Core output to be used (IPI-> 0 or IDI->1 or BOTH->2) These
>> +  values choose which of the Core outputs will be used, it can be Image Data
>> +  Interface or Image Pixel Interface.
>> +- phys: List of one PHY specifier (as defined in
>> +  Documentation/devicetree/bindings/phy/phy-bindings.txt). This PHY is a MIPI
>> +  DPHY working in RX mode.
>> +- resets: Reference to a reset controller (optional)
>> +
>> +Optional properties(if in IPI mode):
>> +- ipi-mode 	: Mode to be used when in IPI(Camera -> 0 or Controller -> 1)
>> +  This property defines if the controller will use the video timings available
>> +  in the video stream or if it will use pre-defined ones.
> 
> This could be boolean instead. I'd expect the former to be the typical 
> mode, so name the property for the latter.
> 

Sure. I can do this.

>> +- ipi-color-mode: Bus depth to be used in IPI (48 bits -> 0 or 16 bits -> 1)
>> +  This property defines the width of the IPI bus.
> 
> Are these the only 2 modes that any h/w would ever have (not just your 
> controller)? Perhaps using the actual bits for the value would be 
> better. Also, if this is the bus width, then the property should be 
> named that as bus widths and pixel formats or color modes are not 
> necessarily the same.
> 

I'm not sure I understand what you mean, but I'll try to explain what this does.

Our controller, when in IPI mode, has a data bus that can be either 16 or 48
bits wide. However when in 48 bits mode some data types will not use the entire
bus width.

>> +- ipi-auto-flush: Data auto-flush (1 -> Yes or 0 -> No). This property defines
>> +  if the data is automatically flushed in each vsync or if this process is done
>> +  manually
> 
> This could be boolean.
> 

I'll change it.

>> +- virtual-channel: Virtual channel where data is present when in IPI mode. This
>> +  property chooses the virtual channel which IPI will use to retrieve the video
>> +  stream.
> 
> Again, some of these should probably be common properties (and therefore 
> documented in a common location). I'm looking for some feedback from 
> video/camera maintainers on this. I know I've seen some other similar 
> bindings for camera interfaces recently.
> 

You're right, Virtual channel is MIPI CSI-2 property, not a Synopsys one, so
this could be a common property, although I haven't found it anywhere.

> Rob
> 

-- 
Best Regards

Ramiro Oliveira
Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

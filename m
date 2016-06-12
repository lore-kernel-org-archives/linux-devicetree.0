From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] [media] atmel-isc: DT binding for Image Sensor
 Controller driver
Date: Sun, 12 Jun 2016 09:23:21 +0200
Message-ID: <20160612092321.60b55a81@bbrezillon>
References: <1465283513-30224-1-git-send-email-songjun.wu@atmel.com>
	<1465283513-30224-3-git-send-email-songjun.wu@atmel.com>
	<20160608235753.46e73078@bbrezillon>
	<6a878440-042f-c447-19cb-aa05b5dc535d@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6a878440-042f-c447-19cb-aa05b5dc535d-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wu, Songjun" <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 12 Jun 2016 11:04:27 +0800
"Wu, Songjun" <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> On 6/9/2016 05:57, Boris Brezillon wrote:
> > On Tue, 7 Jun 2016 15:11:53 +0800
> > Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> >  
> >> DT binding documentation for ISC driver.
> >>
> >> Signed-off-by: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >> ---
> >>
> >> Changes in v4:
> >> - Remove the isc clock nodes.
> >>
> >> Changes in v3:
> >> - Remove the 'atmel,sensor-preferred'.
> >> - Modify the isc clock node according to the Rob's remarks.
> >>
> >> Changes in v2:
> >> - Remove the unit address of the endpoint.
> >> - Add the unit address to the clock node.
> >> - Avoid using underscores in node names.
> >> - Drop the "0x" in the unit address of the i2c node.
> >> - Modify the description of 'atmel,sensor-preferred'.
> >> - Add the description for the ISC internal clock.
> >>
> >>  .../devicetree/bindings/media/atmel-isc.txt        | 69 ++++++++++++++++++++++
> >>  1 file changed, 69 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Documentation/devicetree/bindings/media/atmel-isc.txt
> >> new file mode 100644
> >> index 0000000..3f83524
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
> >> @@ -0,0 +1,69 @@
> >> +Atmel Image Sensor Controller (ISC)
> >> +----------------------------------------------
> >> +
> >> +Required properties for ISC:
> >> +- compatible
> >> +	Must be "atmel,sama5d2-isc".
> >> +- reg
> >> +	Physical base address and length of the registers set for the device.
> >> +- interrupts
> >> +	Should contain IRQ line for the ISC.
> >> +- clocks
> >> +	List of clock specifiers, corresponding to entries in
> >> +	the clock-names property;
> >> +	Please refer to clock-bindings.txt.
> >> +- clock-names
> >> +	Required elements: "hclock".
> >> +- #clock-cells
> >> +	Should be 0.
> >> +- clock-output-names
> >> +	Should contain the name of the clock driving the sensor master clock.
> >> +- pinctrl-names, pinctrl-0
> >> +	Please refer to pinctrl-bindings.txt.
> >> +
> >> +
> >> +ISC supports a single port node with parallel bus. It should contain one
> >> +'port' child node with child 'endpoint' node. Please refer to the bindings
> >> +defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >> +Example:
> >> +isc: isc@f0008000 {
> >> +	compatible = "atmel,sama5d2-isc";
> >> +	reg = <0xf0008000 0x4000>;
> >> +	interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
> >> +	clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
> >> +	clock-names = "hclock";  
> >
> > You have 3 clocks here and only one name. Are you sure this example is
> > actually working?
> >  
> The isc_clk is mandatory, but the other two clocks are optional, so I 
> did not give their name. This example is tested.
> Should I add the name for the other two clocks?

It only works here because you're using these clocks as the parents of
the ispck ismck clocks, but that's an implementation detail, and
consumer are usually referencing their clocks by name. So yes, I'd
recommend specifying names here, even if it's not strictly required by
your current implementation.

> 
> >> +	#clock-cells = <0>;
> >> +	clock-output-names = "isc-mck";
> >> +
> >> +	port {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		isc_0: endpoint {
> >> +			remote-endpoint = <&ov7740_0>;
> >> +			hsync-active = <1>;
> >> +			vsync-active = <0>;
> >> +			pclk-sample = <1>;
> >> +		};
> >> +	};
> >> +
> >> +
> >> +};
> >> +
> >> +i2c1: i2c@fc028000 {
> >> +	ov7740: camera@21 {
> >> +	compatible = "ovti,ov7740";
> >> +	reg = <0x21>;
> >> +
> >> +	clocks = <&isc>;
> >> +	clock-names = "xvclk";
> >> +	assigned-clocks = <&isc>;
> >> +	assigned-clock-rates = <24000000>;
> >> +
> >> +	port {
> >> +		ov7740_0: endpoint {
> >> +			remote-endpoint = <&isc_0>;
> >> +		};
> >> +	};
> >> +};  
> >
> >
> >  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

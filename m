From: "Peter Senna Tschudin" <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= V7 =?utf-8?q?1=2F4=5D?=
 =?utf-8?q?_Documentation=2Fdevicetree=2Fbindings=3A?=
 =?utf-8?q?_b850v3=5Flvds=5Fdp?=
Date: Tue, 03 Jan 2017 23:34:04 +0000
Message-ID: <529b-586c3500-5-5e05b080@98620974>
References: <20170103225127.jn36tatufdfz2k5q@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
in-reply-to: <20170103225127.jn36tatufdfz2k5q@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: jslaby-AlSwsSmVLrQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: devicetree@vger.kernel.org

 Hi Rob,

Thank you for the review.

On 03 January, 2017 23:51 CET, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote: 
 
> On Sun, Jan 01, 2017 at 09:24:29PM +0100, Peter Senna Tschudin wrote:
> > Devicetree bindings documentation for the GE B850v3 LVDS/DP++
> > display bridge.
> > 
> > Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> > Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
> > Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> > Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> > There was an Acked-by from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> for V6, but I changed
> > the bindings to use i2c_new_secondary_device() so I removed it from the commit
> > message.
> > 
> >  .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 39 ++++++++++++++++++++++
> 
> Generally, bindings are not organized by vendor. Put in 
> bindings/display/bridge/... instead.

Will change that.

> 
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> > new file mode 100644
> > index 0000000..1bc6ebf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> > @@ -0,0 +1,39 @@
> > +Driver for GE B850v3 LVDS/DP++ display bridge
> > +
> > +Required properties:
> > +  - compatible : should be "ge,b850v3-lvds-dp".
> 
> Isn't '-lvds-dp' redundant? The part# should be enough.

b850v3 is the name of the product, this is why the proposed name. What about, b850v3-dp2 dp2 indicating the second DP output?

> 
> > +  - reg : should contain the main address which is used to ack the
> > +    interrupts and address for edid.
> > +  - reg-names : comma separeted list of register names. Valid values
> 
> s/separeted/separated/

argh, sorry for this. Will fix it.

> 
> > +    are "main", and "edid".
> > +  - interrupt-parent : phandle of the interrupt controller that services
> > +    interrupts to the device
> > +  - interrupts : one interrupt should be described here, as in
> > +    <0 IRQ_TYPE_LEVEL_HIGH>.
> > +  - port : should describe the video signal connection between the host
> > +    and the bridge.
> > +
> > +Example:
> > +
> > +&mux2_i2c2 {
> > +	status = "okay";
> > +	clock-frequency = <100000>;
> > +
> > +	b850v3-lvds-dp-bridge@73  {
> > +		compatible = "ge,b850v3-lvds-dp";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		reg = <0x73 0x72>;
> > +		reg-names = "main", "edid";
> > +
> > +		interrupt-parent = <&gpio2>;
> > +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +		port {
> > +			b850v3_dp_bridge_in: endpoint {
> > +				remote-endpoint = <&lvds0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > -- 
> > 2.5.5
> > 
 
 
 
 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

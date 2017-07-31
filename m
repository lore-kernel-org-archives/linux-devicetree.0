From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 9/9] arm: dts: mt7623: add dts file for Bananapi R2
 (BPI-R2) board
Date: Mon, 31 Jul 2017 10:46:22 +0800
Message-ID: <1501469182.10930.3.camel@mtkswgap22>
References: <cover.1495683769.git.sean.wang@mediatek.com>
         <5cc5489b38fc2723c30c8cfe0d4353f967d100f3.1495683769.git.sean.wang@mediatek.com>
         <805ad5c4-db47-ef10-565d-b63e33a84bdf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <805ad5c4-db47-ef10-565d-b63e33a84bdf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-07-27 at 16:39 +0200, Matthias Brugger wrote:
> 
> On 05/25/2017 06:02 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Add support for the Bananapi R2 (BPI-R2) development board from
> > BIPAI KEJI. Detailed hardware information for BPI-R2 which could be
> > found on http://www.banana-pi.org/r2.html
> > 
> > The patch currently only adds Mediatek GMAC, MT7530 Switch, the crypto
> > engine, USB, IR, I2S, I2C, UART, SPI, PWM, GPIO keys, GPIO LEDs and
> > PMIC LEDs. As to the other missing hardware and peripherals, they would
> > be added and integrated continuously.
> > 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >   Documentation/devicetree/bindings/arm/mediatek.txt |   2 +
> >   arch/arm/boot/dts/Makefile                         |   1 +
> >   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      | 440 +++++++++++++++++++++
> >   3 files changed, 443 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> > 
> [...]
> > diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> > new file mode 100644
> > index 0000000..72c7984
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> [...]
> > +
> > +&eth {
> > +	status = "okay";
> > +	gmac0: mac@0 {
> > +		compatible = "mediatek,eth-mac";
> > +		reg = <0>;
> > +		phy-mode = "trgmii";
> > +		fixed-link {
> > +			speed = <1000>;
> > +			full-duplex;
> > +			pause;
> > +		};
> > +	};
> > +
> > +	mdio: mdio-bus {
> > +		switch@0 {
> > +			compatible = "mediatek,mt7530";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <0>;
> 
> What is this reg needed for? I can't find it neither in the code nor in the 
> bindings (mt7530 and general dsa bindings). Actually it throws a warning when 
> compiling:
> arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb: Warning (reg_format): "reg" 
> property in /ethernet@1b100000/mdio-bus/switch@0 has invalid length (4 bytes) 
> (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb: Warning 
> (avoid_default_addr_size): Relying on default #address-cells value for 
> /ethernet@1b100000/mdio-bus/switch@0
> arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb: Warning 
> (avoid_default_addr_size): Relying on default #size-cells value for 
> /ethernet@1b100000/mdio-bus/switch@0
> 
> Regards,
> Matthias
> 


Hi, Matthias

many thanks

It should be just my written mistakes. Recently I prepared the next
version including a few fixups and enhancements which also would include
the warning correction you reported here.

	Sean 

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

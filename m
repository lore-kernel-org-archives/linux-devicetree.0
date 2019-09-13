From: Gilles Doffe <gilles.doffe@savoirfairelinux.com>
Subject: Re: [PATCH v2] arm: dts: imx6qdl: add gpio expander pca9535
Date: Fri, 13 Sep 2019 04:38:39 -0400 (EDT)
Message-ID: <415531537.7768114.1568363919015.JavaMail.zimbra@savoirfairelinux.com>
References: <20190719104615.5329-1-gilles.doffe@savoirfairelinux.com> <20190722075341.e4ve45rneusiogtk@pengutronix.de> <978100557.7721358.1568282514403.JavaMail.zimbra@savoirfairelinux.com> <20190912101240.ml5jmdei5rvzesap@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912101240.ml5jmdei5rvzesap@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, mark rutland <mark.rutland@arm.com>, festevam <festevam@gmail.com>, s hauer <s.hauer@pengutronix.de>, rennes <rennes@savoirfairelinux.com>, robh+dt <robh+dt@kernel.org>, linux-imx <linux-imx@nxp.com>, kernel <kernel@pengutronix.de>, =?utf-8?Q?J=C3=A9rome?= Oufella <jerome.oufella@savoirfairelinux.com>, shawnguo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

Ack for all, v3 incoming.

Thank you,
Gilles

----- Le 12 Sep 19, à 12:12, Marco Felsch m.felsch@pengutronix.de a écrit :

> Hi Gilles,
> 
> On 19-09-12 06:01, Gilles Doffe wrote:
>> Hi Marco,
>> 
>> Thanks for your reply and sorry about the delay.
> 
> No worries ;)
> 
>> ----- Le 22 Juil 19, à 9:53, Marco Felsch m.felsch@pengutronix.de a écrit :
>> 
>> > Hi Gilles,
>> > 
>> > can you adapt the patch title, I assumed that the base dtsi is adding a
>> > gpio-expander which makes no sense.
>> 
>> My first intent was to add the gpio-expander pca9535 into the imx6q-rex-pro.dts
>> and in a future imx6qp-rex-ultra.dts
>> However I noticed that the sgtl5000 was already in the dtsi.
>> It is maybe due to the fact that like the pca9535, the sgtl5000 is present on
>> the baseboard not on the SOM.
>> Thus I guess that baseboard stuff common to all rex SOM should be in
>> imx6qdl-rex.dtsi and not in the dts.
>> Does-it seem correct to you ?
> 
> Yes this is correct what Shawn and I mean is that you should adapt the
> commit title. Shawn already give you an example.
> 
>> > 
>> > On 19-07-19 12:46, Gilles DOFFE wrote:
>> >> The pca9535 gpio expander is present on the Rex baseboard, but missing
>> >> from the dtsi.
>> >> 
>> >> Add the new gpio controller and the associated interrupt line
>> >> MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.
>> >> 
>> >> Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
>> >> ---
>> > 
>> > Having a changelog would be nice too.
>> > 
>> >>  arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
>> >>  1 file changed, 19 insertions(+)
>> >> 
>> >> diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi
>> >> b/arch/arm/boot/dts/imx6qdl-rex.dtsi
>> >> index 97f1659144ea..b517efb22fcb 100644
>> >> --- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
>> >> +++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
>> >> @@ -136,6 +136,19 @@
>> >>  		compatible = "atmel,24c02";
>> >>  		reg = <0x57>;
>> >>  	};
>> >> +
>> >> +	pca9535: gpio8@27 {
>> >> +		compatible = "nxp,pca9535";
>> >> +		reg = <0x27>;
>> > 
>> > The i2c devices are orderd by their i2c-addresses starting from the
>> > lowest.
>> >
>> 
>> Ack.
>> 
>> >> +		gpio-controller;
>> >> +		#gpio-cells = <2>;
>> >> +		pinctrl-names = "default";
>> >> +		pinctrl-0 = <&pinctrl_pca9535>;
>> >> +		interrupt-parent = <&gpio6>;
>> >> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
>> >> +		interrupt-controller;
>> >> +		#interrupt-cells = <2>;
> 
> As you pointed out above this device isn't available on the
> imx6dl-rex-basic? You should add: 'status = "disabled";' if this is the
> case.
> 
> Regards,
>  Marco
> 
>> >> +	};
>> >>  };
>> >>  
>> >>  &i2c3 {
>> >> @@ -237,6 +250,12 @@
>> >>  			>;
>> >>  		};
>> >>  
>> >> +		pinctrl_pca9535: pca9535 {
>> >> +			fsl,pins = <
>> >> +				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x00017059
>> > 
>> > The pinmux below don't use the leading zero's if you are the first I
>> > would drop that.
>> > 
>> > Regards,
>> >  Marco
>> >
>> 
>> Ack.
>> 
>> Regards,
>> Gilles
>> 
> 
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- 
Gilles DOFFE 
Senior Product Engineering Consultant | Rennes, Fr 
Bureau 
[ tel:+33972468980 | (+33) 9 72 46 89 80 ] p. : 601 
Cellulaire 
[ tel:+33660025866 | (+33) 6 60 02 58 66 ]

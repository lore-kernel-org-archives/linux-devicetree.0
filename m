From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 4/6] ARM: dts: imx6q-evi: support altera-ps-spi
Date: Mon, 5 Jun 2017 10:10:05 -0500
Message-ID: <CANk1AXR1Bt3k7GLudRAVkmQXxaAFmrCKFFpxTFF9k=N7Yn5VZA@mail.gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
 <6513199.IxvCuS6eYj@jclayton-pc> <b944db11-bdd2-5b5f-2aa8-01f4135918be@suse.de>
 <14677930.o4g43KgmZP@jclayton-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14677930.o4g43KgmZP@jclayton-pc>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 2, 2017 at 4:10 PM,  <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Friday, June 2, 2017 9:54:22 PM PDT Andreas Färber wrote:
>> Am 02.06.2017 um 21:39 schrieb stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org:
>> > On Friday, June 2, 2017 6:30:12 PM PDT Andreas Färber wrote:
>> >> Am 25.05.2017 um 19:29 schrieb Joshua Clayton:
>> >>> diff --git a/arch/arm/boot/dts/imx6q-evi.dts
>> >>> b/arch/arm/boot/dts/imx6q-evi.dts index 24fe093a66db..a0cbb2d84803
>> >>> 100644
>> >>> --- a/arch/arm/boot/dts/imx6q-evi.dts
>> >>> +++ b/arch/arm/boot/dts/imx6q-evi.dts
>> >>> @@ -82,6 +82,15 @@
>> >>>
>> >>>   pinctrl-names = "default";
>> >>>   pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>> >>>   status = "okay";
>> >>>
>> >>> +
>> >>> + fpga_spi: cyclonespi@0 {
>> >>
>> >> "cyclonespi" does not strike me as the best node name.
>> >>
>> >> I am guessing this is a sub-node of a SPI controller node, so no need to
>> >> repeat "spi", and Cyclone seems more or less implied by "altr,fpga-".
>> >
>> > True.
>> >
>> >> Note that the example in the bindings doc uses "evi-fpga-spi". Nodes
>> >> don't need to be (shouldn't be?) prefixed with the board. Note that
>> >> bindings examples tend to get copied a lot.
>> >>
>> >> Any reason not to just use "fpga@0" in both places for simplicity?
>> >
>> > Sure. fpga: fpga@0 is probably better.
>>
>> Note that I was only commenting on the node name, the latter part.
>>
>> I'm not aware of any rules for the label, so that could remain unchanged
>> or adopt cyclone_spi from the old node name or whatever is unique and
>> syntactically valid.
> Too late! Patches posted.
> Oh, well, I'm not changing it back.

It's fine as it is in v12.

fpga_mgr: fpga-mgr@0 is what I've been using most recently.  It
distinguishes the one block that is used to program the fpga from the
fpga and hardware in the fpga.  But no need to respin this.

Alan

>>
>> > I'll change it in both the dts and the binding doc.
>>
>> Thanks. Maybe double-check if there's any conventions Xilinx/Lattice DTs
>> are using.
>>
> Of the conventions I found, fpga seemed the most "hardware descriptive"
> for a plain FPGA.
> The other one several binding doc examples are using is "fpga-mgr".
>
>> Cheers,
>> Andreas
>
>
> --
> ~Joshua A Clayton
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

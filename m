From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Sun, 10 Jul 2016 01:47:48 +0200
Message-ID: <4648785.SDx8KzkhqW@phil>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com> <87d1moi7g7.fsf@linux.intel.com> <f5daa697-3125-cfbf-7318-d4900f666362@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f5daa697-3125-cfbf-7318-d4900f666362-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "William.wu" <William.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 9. Juli 2016, 11:38:00 schrieb William.wu:
> Dear Heiko & Balbi=EF=BC=8C
>=20
> On 2016/7/8 21:29, Felipe Balbi wrote:
> > Hi,
> >=20
> > Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> writes:
> >> Am Donnerstag, 7. Juli 2016, 10:54:24 schrieb William Wu:
> >>> Add a quirk to configure the core to support the
> >>> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
> >>> interface is hardware property, and it's platform
> >>> dependent. Normall, the PHYIf can be configured
> >>> during coreconsultant. But for some specific usb
> >>> cores(e.g. rk3399 soc dwc3), the default PHYIf
> >>> configuration value is fault, so we need to
> >>> reconfigure it by software.
> >>>=20
> >>> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
> >>> must be set to the corresponding value according to
> >>> the UTMI+ PHY interface.
> >>>=20
> >>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>> ---
> >>=20
> >> [...]
> >>=20
> >>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> b/Documentation/devicetree/bindings/usb/dwc3.txt index
> >>> 020b0e9..8d7317d
> >>> 100644
> >>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>=20
> >>> @@ -42,6 +42,10 @@ Optional properties:
> >>>    - snps,dis-u2-freeclk-exists-quirk: when set, clear the
> >>>=20
> >>> u2_freeclk_exists in GUSB2PHYCFG, specify that USB2 PHY doesn't
> >>> provide
> >>>=20
> >>>   			a free-running PHY clock.
> >>>=20
> >>> + - snps,phyif-utmi-quirk: when set core will set phyif UTMI+
> >>> interface.
> >>> + - snps,phyif-utmi: the value to configure the core to support a
> >>> UTMI+
> >>> PHY +			with an 8- or 16-bit interface. Value 0=20
select 8-bit
> >>> +			interface, value 1 select 16-bit interface.
> >>=20
> >> maybe
> >>=20
> >> 	snps,phyif-utmi-width =3D <8> or <16>;
> >>=20
> >> devicetree is about describing the hardware, not the things that g=
et
> >> written to registers :-) . The conversion from the described width=
 to
> >> the register value can easily be done in the driver.
>=20
> Thanks for your suggestion:-)
> Yes=EF=BC=8C =E2=80=9Csnps,phyif-utmi-width =3D <8> or <16>=E2=80=9D =
is much clearer and easier to
> understand.
> And I have considered the same dts property for phyif-utmi, but I hav=
e
> no good idea about
> the conversion from described width to the registers value for the ti=
me
> being.
>=20
> About phyif utmi width configuration=EF=BC=8C we need to set two plac=
es in
> GUSB2PHYCFG register=EF=BC=8C
> according to DWC3 USB3.0 controller databook version3.00a=EF=BC=8C6.3=
=2E46
> GUSB2PHYCFG
>=20
> ---------------------------------------------------------------------=
-----
> -------------------- Bits   |  Name                 |     Description
> ---------------------------------------------------------------------=
-----
> -------------------- 13:10  |   USBTRDTIM       |     Sets the turnar=
ound
> time in PHY clocks.
>              |                            |     4'h5: When the MAC
>=20
> interface is 16-bit UTMI+
>=20
>              |                            |     4'h9: When the MAC
>=20
> interface is 8-bit UTMI+/ULPI.
> ---------------------------------------------------------------------=
-----
> -------------------- 3        |   PHYIF                |    If UTMI+ =
is
> selected, the application uses this bit to configure
>=20
>              |                            |    core to support a UTMI=
+
>=20
> PHY with an 8- or 16-bit interface.
>=20
>              |                            |    1'b0: 8 bits
>              |                            |    1'b1: 16 bits
>=20
> ---------------------------------------------------------------------=
-----
> --------------------
>=20
> And I think maybe I can try to do this:
> change it in dts:
>          snps,phyif-utmi-width =3D <8> or <16>;
>=20
> Then convert to register value like this=EF=BC=9A
>         device_property_read_u8(dev, "snps,phyif-utmi-width",
>                                               &phyif_utmi_width);
>=20
>         dwc->phyif_utmi =3D phyif_utmi_width >> 4;
>=20
>   Ater the conversion=EF=BC=8C dwc->phyif_utmi value 0 means 8 bits, =
value 1
> means 16 bits,
>   and it's easier for us to config GUSB2PHYCFG.
>=20
> Is it OK?

or you could just store the actual width value read from the dts and ma=
ke=20
the core handle accordingly, making everything a bit more explicit.

I guess personally I'd do something like:

make dwc->phyif_utmi a regular unsigned int

in probe:
      	ret =3D device_property_read_u8(dev, "snps,phyif-utmi-width",
                                              &dwc->phyif_utmi);
	if (ret < 0) {
		dwc->phyif_utmi =3D 0;
	else if (dwc->phyif_utmi !=3D 16 && dwc->phyif_utmi !=3D 8) {
		dev_err(dev, "unsupported utmi interface width %d\n",
			dwc->phyif_utmi);
		return -EINVAL;
	}


when setting your GUSB2PHYCFG register:

       if (dwc->phyif_utmi > 0) {
               reg &=3D ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
                      DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
               usbtrdtim =3D (dwc->phyif_utmi =3D=3D 16) ? USBTRDTIM_UT=
MI_16_BIT :
                           USBTRDTIM_UTMI_8_BIT;
		phyif =3D (dwc->phyif_utmi =3D=3D 16) ? 1 : 0;
               reg |=3D DWC3_GUSB2PHYCFG_PHYIF(phyif) |
                      DWC3_GUSB2PHYCFG_USBTRDTIM(usbtrdtim) |
       }


> >> Also I don't think you need two properties for this. If the
> >> snps,phyif-utmi property is specified it indicates that you want t=
o
> >> manually set the width and if it is absent you want to use the IC
> >> default. All functions reading property-values indicate if the
> >> property is missing.
>=20
> Ah, it seems very good to me. One dts property "snps,phyif-utmi" can =
help
> to reconfig phyif utmi width. And it seems that Felipe likes it very =
much
> too. :-D

yes, but please name it snps,phyif-utmi-width :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

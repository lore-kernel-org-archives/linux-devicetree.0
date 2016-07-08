From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Fri, 08 Jul 2016 16:29:44 +0300
Message-ID: <87d1moi7g7.fsf@linux.intel.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com> <1467860066-15142-4-git-send-email-william.wu@rock-chips.com> <2213342.0Nx5tnEW8p@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2213342.0Nx5tnEW8p@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> writes:
> Am Donnerstag, 7. Juli 2016, 10:54:24 schrieb William Wu:
>> Add a quirk to configure the core to support the
>> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
>> interface is hardware property, and it's platform
>> dependent. Normall, the PHYIf can be configured
>> during coreconsultant. But for some specific usb
>> cores(e.g. rk3399 soc dwc3), the default PHYIf
>> configuration value is fault, so we need to
>> reconfigure it by software.
>>=20
>> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
>> must be set to the corresponding value according to
>> the UTMI+ PHY interface.
>>=20
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
> [...]
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>> b/Documentation/devicetree/bindings/usb/dwc3.txt index 020b0e9..8d7317d
>> 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -42,6 +42,10 @@ Optional properties:
>>   - snps,dis-u2-freeclk-exists-quirk: when set, clear the
>> u2_freeclk_exists in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>>  			a free-running PHY clock.
>> + - snps,phyif-utmi-quirk: when set core will set phyif UTMI+ interface.
>> + - snps,phyif-utmi: the value to configure the core to support a UTMI+
>> PHY +			with an 8- or 16-bit interface. Value 0 select 8-bit
>> +			interface, value 1 select 16-bit interface.
>
> maybe
> 	snps,phyif-utmi-width =3D <8> or <16>;
>
> devicetree is about describing the hardware, not the things that get writ=
ten=20
> to registers :-) . The conversion from the described width to the registe=
r=20
> value can easily be done in the driver.
>
>
> Also I don't think you need two properties for this. If the snps,phyif-ut=
mi=20
> property is specified it indicates that you want to manually set the widt=
h=20
> and if it is absent you want to use the IC default. All functions reading=
=20
> property-values indicate if the property is missing.
>
> But it looks like there is already a precendence in=20
> snps,tx_de_emphasis(_quirk), so maybe Felipe has a different opinion here?
>
>
>
>>   - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>>  			utmi_l1_suspend_n, false when asserts utmi_sleep_n
>>   - snps,hird-threshold: HIRD threshold
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 0b7bfd2..94036b1 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -408,6 +408,7 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
>>  static int dwc3_phy_setup(struct dwc3 *dwc)
>>  {
>>  	u32 reg;
>> +	u32 usbtrdtim;
>>  	int ret;
>>=20
>>  	reg =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
>> @@ -503,6 +504,15 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
>>  	if (dwc->dis_u2_freeclk_exists_quirk)
>>  		reg &=3D ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
>>=20
>> +	if (dwc->phyif_utmi_quirk) {
>> +		reg &=3D ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
>> +		       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
>> +		usbtrdtim =3D dwc->phyif_utmi ? USBTRDTIM_UTMI_16_BIT :
>> +			    USBTRDTIM_UTMI_8_BIT;
>> +		reg |=3D DWC3_GUSB2PHYCFG_PHYIF(dwc->phyif_utmi) |
>> +		       DWC3_GUSB2PHYCFG_USBTRDTIM(usbtrdtim);
>> +	}
>> +
>>  	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
>>=20
>>  	return 0;
>> @@ -834,6 +844,7 @@ static int dwc3_probe(struct platform_device *pdev)
>>  	struct resource		*res;
>>  	struct dwc3		*dwc;
>>  	u8			lpm_nyet_threshold;
>> +	u8			phyif_utmi;
>>  	u8			tx_de_emphasis;
>>  	u8			hird_threshold;
>>=20
>> @@ -880,6 +891,9 @@ static int dwc3_probe(struct platform_device *pdev)
>>  	/* default to highest possible threshold */
>>  	lpm_nyet_threshold =3D 0xff;
>>=20
>> +	/* default to UTMI+ 8-bit interface */
>> +	phyif_utmi =3D 0;
>> +
>>  	/* default to -3.5dB de-emphasis */
>>  	tx_de_emphasis =3D 1;
>>=20
>> @@ -929,6 +943,10 @@ static int dwc3_probe(struct platform_device *pdev)
>>  				"snps,dis_rxdet_inp3_quirk");
>>  	dwc->dis_u2_freeclk_exists_quirk =3D device_property_read_bool(dev,
>>  				"snps,dis-u2-freeclk-exists-quirk");
>> +	dwc->phyif_utmi_quirk =3D device_property_read_bool(dev,
>> +				"snps,phyif-utmi-quirk");
>> +	 device_property_read_u8(dev, "snps,phyif-utmi",
>> +				 &phyif_utmi);
>
>
> As described above device_property_read_u8 will return an error if the=20
> property is not present, so you could fill your dwc->phyif_utmi_quirk fro=
m=20
> that:
>
> 	ret =3D device_property_read_u8(dev, "snps,phyif-utmi",
> 				 &phyif_utmi);
> 	dwc->phyif_utmi_quirk =3D (ret =3D=3D 0) ? true : false;

I like this much better :-) Unfortunately can't fix tx_deemphasis due to
backwards compatibility :-s

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXf6rIAAoJEIaOsuA1yqREjRoQAJCmvSpNShTXqjhsmCPADe/l
h1ilWrURt5sqp9mVKTTsmZ8zeg1Dh7MN2EyRPh/KCuvK7Ecl9N6ojJSmrOfz5uQN
1uG0YeF1eGaY5hCvq7xb5qmHrUZNPE5ooGyxP71pRHfFbZGfh3FNk5CSNSW1TvzF
zW9IpkBSBPU0FC5mbEmX9/5WtJvh4WyghvLhGS87t+dX4y6y5kDxtrU2zB3jyRyy
3r/T8UmFF+MNwcJGeyRB1/XVADRarwX17dXoDBl3P8rSQS79YSk5OcNRkWmmiDa4
WVBa9uvXxZpd4XU0UUtqnOfOQLXb/QuofTkaucHbag034szwrF2BKUCQmEIGQjtz
sJY9pnKmsOZCFSppG16Gwo/Gq2NdO+lisJoT1tROCk1rzLyuenpz/QHg6GGpO3g5
k35RJ4qbjYBIMEvTKLtl418ymR4zhMqzb3W/BqoMIiLvNZvi/rKjZq5R8QdRNqAv
bqaiLTcXVxZES0fnS1565CQwSwSOeemE2BSCjY2rJoIW69B8okQJ7qCx0/JwG5MY
Q2iOq2IUn2eTcQciF66N5L52xxPZRaoDiDUgeZqCduhowXAixhCIliyo/zJtXV53
IAZ69yKrUNOcDuFc4ekaJs6pTFmlPAhDhLWerptlcigTveYgph4bjAFKKRe9z2zN
+rNzvFAIYSN54aiYJ9ph
=NQgw
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

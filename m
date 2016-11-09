From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/30] usb: dwc2: Deprecate g-use-dma binding
Date: Wed, 09 Nov 2016 09:53:25 +0200
Message-ID: <87zil9gkcq.fsf@linux.intel.com>
References: <cover.1478558343.git.johnyoun@synopsys.com> <e99e9d8df77884671f94734109a1a8d76a0222c1.1478558343.git.johnyoun@synopsys.com> <87wpgeibdh.fsf@linux.intel.com> <6e90b835-73b1-3970-24a4-eab72381b469@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6e90b835-73b1-3970-24a4-eab72381b469-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> On 11/8/2016 1:12 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>>> Add a vendor prefix and make the name more consistent by renaming it to
>>> "snps,gadget-dma-enable".
>>>
>>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
>>>  arch/arm/boot/dts/rk3036.dtsi                  | 2 +-
>>>  arch/arm/boot/dts/rk3288.dtsi                  | 2 +-
>>>  arch/arm/boot/dts/rk3xxx.dtsi                  | 2 +-
>>>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 2 +-
>>>  arch/arm64/boot/dts/rockchip/rk3368.dtsi       | 2 +-
>>>  drivers/usb/dwc2/params.c                      | 9 ++++++++-
>>>  drivers/usb/dwc2/pci.c                         | 2 +-
>>>  8 files changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documenta=
tion/devicetree/bindings/usb/dwc2.txt
>>> index 9472111..389a461 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>>> @@ -26,11 +26,14 @@ Refer to phy/phy-bindings.txt for generic phy consu=
mer properties
>>>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>>>    Refer to usb/generic.txt
>>>  - snps,host-dma-disable: disable host DMA mode.
>>> -- g-use-dma: enable dma usage in gadget driver.
>>> +- snps,gadget-dma-enable: enable gadget DMA mode.
>>=20
>> I don't see why you even have this binding. Looking through the code,
>> you have:
>>=20
>> #define GHWCFG2_SLAVE_ONLY_ARCH			0
>> #define GHWCFG2_EXT_DMA_ARCH			1
>> #define GHWCFG2_INT_DMA_ARCH			2
>>=20
>> void dwc2_set_param_dma_enable(struct dwc2_hsotg *hsotg, int val)
>> {
>> 	int valid =3D 1;
>>=20
>> 	if (val > 0 && hsotg->hw_params.arch =3D=3D GHWCFG2_SLAVE_ONLY_ARCH)
>> 		valid =3D 0;
>> 	if (val < 0)
>> 		valid =3D 0;
>>=20
>> 	if (!valid) {
>> 		if (val >=3D 0)
>> 			dev_err(hsotg->dev,
>> 				"%d invalid for dma_enable parameter. Check HW configuration.\n",
>> 				val);
>> 		val =3D hsotg->hw_params.arch !=3D GHWCFG2_SLAVE_ONLY_ARCH;
>> 		dev_dbg(hsotg->dev, "Setting dma_enable to %d\n", val);
>> 	}
>>=20
>> 	hsotg->core_params->dma_enable =3D val;
>> }
>>=20
>> which seems to hint that DMA support is discoverable. If there is DMA,
>> why would disable it?
>>=20
>
> Yes that's the case and I would prefer to make it discoverable and
> enabled by default.
>
> But the legacy behavior has always been like this because DMA was
> never fully implemented in the gadget driver and it was an opt-in
> feature. Periodic support was only added recently.

legacy behavior can be changed if another 'policy' makes more
sense. IMHO, whatever can be discovered in runtime, should be enabled by
default. That way, we force people to use it and find bugs in certain
features.

> What do you think about enabling it by default now? I think most
> platforms already use DMA.

I think it should be discovered. Drop all these "*-use-dma" bindings
because they're not needed if you can probe a register to answer the
same question.

> We would still need a "disable" binding for IP validation purposes at
> least.

Yeah, could be a quirk.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYItX1AAoJEMy+uJnhGpkGdIMQANpnJgdpdSU9j89ZmbcvLBqX
x1Aj4T9Zm8txnq/vO8bSIfqM3bd1P1fl391AcnXGXL8D2FB5TY6gLbBJJKkkY3YU
29XFkRs2IjWNQU+vM5YY6Ax5pKh/TvOl3Ct8DTXz0s2NIJ5P6nbGZIAuA6GnI+0m
dS6Hm+vuOC0kCyeSt9+sAGQKfRwQ4PDA/N9mM6IkB1UN4+yAq1QiSk94vVTMGSIQ
oNM1yM/7XiOyI6Lgn7DiCdfTIXQ5n0KKRX1TxQo+8YaeBpqiNQplOIB7n8mt3IyH
9YGZJ+RcXQuJT9h2mDYllz5ZhJFXGOCbY0o0VdNDTXvfM3L0Ca8OoHg1d2Y0ZLts
h8N3KKYFurmffGy5KT5vtJNTKPBypgNd+hRQAuTz4OFnALG+4mjjlV2kU9HhErqs
ewwu8CgxIWXrahYefbARTIDVn28PKHuzj0Xblyq8DJxqnzt63VSPZOe7k1kGt4ol
z08DfZujbJVBpmWtsNn/MlD6vSIcdjfXcsNBskhFUosF+knMAWPO0Ae/W2eSJaAl
8SUWdmvwQlp3DtwVkQNFYZH1jRQ0GmzVRoKJxboq+rfgfqGoj4KKYBD4tvCzZtGh
7aj8yH5enzKjWY0TnlXG4tJgOsNyxSMeLw8VN1ST2zrZwpIvQZT0rxJLEygp7Cvt
4cepzEvRXj5Ixx463BlC
=ykJW
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

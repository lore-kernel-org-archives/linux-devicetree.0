From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] phy: work around 'phys' references to usb-phy devices
Date: Thu, 11 Jan 2018 10:16:31 -0800
Message-ID: <87d12guups.fsf@anholt.net>
References: <20180108130116.80148-1-arnd@arndb.de> <aa02104b-d80d-8b12-4403-b5cedc23f03a@ti.com> <CAK8P3a0F4sK=ou8HXmSktq+0S22juYaCaY48RStDKwk8QGgviQ@mail.gmail.com> <6dd37865-9c71-29f9-16b4-26e51e6b1c70@ti.com> <CAK8P3a0NSGCR8=MzHAPqyhWMsUWAxJjtstYo8gszKcXUCaupgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0NSGCR8=MzHAPqyhWMsUWAxJjtstYo8gszKcXUCaupgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "# 3.4.x" <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Thu, Jan 11, 2018 at 2:30 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>> On Thursday 11 January 2018 02:27 AM, Arnd Bergmann wrote:
>>> On Mon, Jan 8, 2018 at 7:32 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>>> On Monday 08 January 2018 06:31 PM, Arnd Bergmann wrote:
>>>>> Stefan Wahren reports a problem with a warning fix that was merged
>>>>> ---
>>>>> This obviously needs to be tested, I wrote this up as a reply to
>>>>> Stefan's bug report. I'm fairly sure that I covered all usb-phy
>>>>> driver strings here. My goal is to have a fix merged into 4.15
>>>>> rather than reverting all the DT fixes.
>>>>
>>>> Shouldn't the fix be in phy consumer drivers to not return error if it's able
>>>> to find the phy either using usb-phy or generic phy?
>>>
>>> Stefan has posted a patch to that effect now, but I fear that might be
>>> a little fragile, in particular this short before the release with the
>>> regression
>>> in place.
>>>
>>> The main problem is that we'd have to change the generic
>>> usb_add_hcd() function in addition to dwc2 and dwc3 to ignore
>>> -EPROBE_DEFER from phy_get() whenever usb_get_phy_dev()
>>> has already succeeded.
>>>
>>> If there is any HCD that relies on usb_add_hcd() to get both the
>>> usb_phy and the phy structures, and it may need to defer probing
>>> when the latter one isn't ready yet, that fix would break another
>>> driver.
>>
>> hmm.. IMO the better thing right now would be to revert the dt patch which adds
>> #phy-cells.
>> We have to see if there are better fixes in order to add #phy-cells warning fix
>> in stable tree.
>
> Let's see which patches that would be, I think this is the full list of
> nodes that got an extra #phy-cells:
>
> c22fe696157d ARM: dts: Fix dm814x missing phy-cells property
> f0e11ff8ff65 ARM: dts: am33xx: Add missing #phy-cells to ti,am335x-usb-phy
> c5bbf358b790 arm: dts: nspire: Add missing #phy-cells to usb-nop-xceiv
> 44e5dced2ef6 arm: dts: marvell: Add missing #phy-cells to usb-nop-xceiv
> 014d6da6cb25 ARM: dts: bcm283x: Fix DTC warnings about missing phy-cells
> f568f6f554b8 ARM: dts: omap: Add missing #phy-cells to usb-nop-xceiv
>
> plus a couple in linux-next:
>
> d745d5f277bf ARM: dts: imx51-zii-rdu1: Add missing #phy-cells to usb-nop-xceiv
> 915fbe59cbf2 ARM: dts: imx: Add missing #phy-cells to usb-nop-xceiv
>
> It's a lot of patches to revert, and I guess it would get us back to hundreds
> of warnings in an allmodconfig build, so I'd first try to come up with
> ways to prove that at least some of them can stay.
>
> Almost all the warnings are about "usb-nop-xceiv" phys, the only exceptions
> I could find are the OMAP ones (the first two patches), which use
> "ti,am335x-usb-phy" and are referenced from a "ti,musb-am33xx". That
> particular driver is not affected by the bug, so we can leave that in.
>
> To deal with all the "usb-nop-xceiv"  references including the one that
> Stefan reported, we could use a much simpler version of my earlier
> patch, do you think this is any better?
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index b4964b067aec..f056d8fb3921 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -410,6 +410,10 @@ static struct phy *_of_phy_get(struct device_node
> *np, int index)
>         if (ret)
>                 return ERR_PTR(-ENODEV);
>
> +       /* This phy type handled by the usb-phy subsystem for now */
> +       if (of_device_is_compatible("usb-nop-xceiv"))
> +               return ERR_PTR(-ENODEV);
> +
>         mutex_lock(&phy_provider_mutex);
>         phy_provider = of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {

This seems like a nice workaround!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlpXqf8ACgkQtdYpNtH8
nuilQw/+OUSXu526Rio/zESd4lqsIjm6T1nnwROIDX3LnIaXkYYekw9HDgCJhXMg
G+Egu4Gs3URruG2WV9z23eoh5hZbxoVtNLhaHtvyavUP6X0YJiZ6/LpKpFzgGBXk
xyt0dyHo5m1aNziIQQbEz5pSbWJdMqV/McMyN+7b/+RTbSbWeY7zW4GNBbKVVp/M
nM6Uk5W6SLgLBn+unuktQgiTllCMXlWpyrDqYcsFhD6y4RLoZ+IUwXcxT0Fn6le6
DSpo3S1hRA+blgjFN3bo5CtrnY+baXmGEjyZ27HB5tXRhRr52utdWhqNgtz0A6lu
opiYz8wEzkhsh3o/GE95nhYddQoFMS7qod966TZJV1S1x3H+AMuA2U/07YXTz6Tc
v2y5lQK4sKHMAJoFoFqR3JNMQShPpFey5YiDay5lpMvpz7fHTZSIte9OW9SJQ06E
bs7WEqu+dULnYLHPiEGD3cDROCfxeTtB4MqZJ1hTGNCJlEaQsVU9KyG3kC0jGAVS
aSx34bPkwlSsExsH9cdqtNl0Waq/D35XwHTZuGGabCqQ56+bsO6pbM0a/OAilOJS
cqdUjE0znjm7+2lvtPLVrUaiB9FJKljuC6i6f87JgXqH8Vyw4cht1EWw8IixkcuT
gTxcL+FOdwjW9FfPWJJvwgm6uLMPQEITvnznk9GTccM3vBLcb3U=
=E2a8
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

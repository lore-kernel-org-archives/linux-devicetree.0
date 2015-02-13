From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Fri, 13 Feb 2015 16:35:36 +0200
Message-ID: <54DE0BB8.7070004@ti.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com> <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com> <20150212093356.GR12209@pengutronix.de> <20150212103944.GA1290@victor> <20150212122405.GW12209@pengutronix.de> <20150212125646.GT8656@n2100.arm.linux.org.uk> <20150212134131.GX12209@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="3KetLVMJR9Avcm8STej2QP7sw6H1ggLNe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150212134131.GX12209-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--3KetLVMJR9Avcm8STej2QP7sw6H1ggLNe
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/02/15 15:41, Sascha Hauer wrote:

> Tomis patch is based on the assumption that clk_set_rate(clk_round_rate=
(rate))
> is equal to clk_round_rate(rate). So when this assumption is wrong then=

> it should simply be reverted.

When is it not equal?

I agree that doing clk_set_rate(clk, clk_round_rate(clk, rate)) is
pointless, but shouldn't it still work?

And we can forget about clk_round_rate. Without my patch, this would
behave oddly also:

rate =3D clk_get_rate(clk);
clk_set_rate(clk, rate);

The end result could be something else than 'rate'.

 Tomi



--3KetLVMJR9Avcm8STej2QP7sw6H1ggLNe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU3gu4AAoJEPo9qoy8lh711ZgP/0YgsMLHLXIYxWX+Px5b0gWB
IJZjDqvkuvf2jpo2/DdeReI28WJG76Y6tuDJeetVkc7bm1SzhJ1hDA/43MoIhqVn
CQul3f5TUwuYs/Ql/RS6nELDOWHvrQAcrePM6cijTMfgpe8hzPrGz7DaHL9149KW
nlIKcuBSBG6HXpSrB0hzQwRqBBiREii6sht2N4GHK1ooJ9Rfccyh8Op6Efn8tqC0
5ydv7Z5RH91KXJIOJ5Q+olSBmfC9G7XTWe4Xkd3WjWmCry4citMsg1Ff9OnwYW6v
6PtRuHZeumaMqrxMU4eFO91/8H6xQYK3sYB5/yjvZYtoJgJk9uuPC2T4ATY5LQ5J
V2qKbtRB6Z6zY87RR1SxVseh9UZOeACJSj7Jw8q19c7L9PdR56b/rj0kQUYLSMxe
7qnH7zRfEDzerCCXeSuKYCMZXR6nvks91f5vDgMgX5aky+XGo2khVKhxPPYMl4zv
ivV7HmDO20boDvtwOOfVFlDGZcoFpT9s1YPIEDdAg7voiNJSUh7uwcOdefESYdfa
3/X9UBgST3PTWklDTfI0k/TMxPcKccc1tiP7YttnH5rPKsOhw1AgKTffBULnL8P5
chKXDx6Xu/PyvrhllKKK3sYFYTX6WEyEvnSKSy9o0zQxoSs8NGAzw9osiNp1Bcr1
rpypjWcsWcFJXSc5B/Pd
=qefX
-----END PGP SIGNATURE-----

--3KetLVMJR9Avcm8STej2QP7sw6H1ggLNe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 00/23] usb gadget update for OTG 2.0
Date: Wed, 22 Jul 2015 10:13:08 -0500
Message-ID: <20150722151308.GE10467@saruman.tx.rr.com>
References: <1436426340-18477-1-git-send-email-jun.li@freescale.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436426340-18477-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2015 at 03:18:37PM +0800, Li Jun wrote:
> Change for v7:
> - Free otg descriptor when failure of bind in patch 21, 22, 23.
>   add Roger's Reviewed-by for patch 10~20.
> - Choose the lesser otg-rev if otg-rev has been set before update by DT,
>   remove 0x0300 in supported otg-rev list, and add code comments in case
>   otg-rev is not passed in DT in patch 7.
> - Fail chipidea usb initilization if DT pass an unsupported otg-rev in pa=
tch 8.
>=20
> Change for v6:
> - Change of_usb_set_otg_caps to be of_usb_update_otg_caps, and add
>   sanity check of otg-rev.
> - Add chipidea otg-rev ability to be 0x0200, which will be updated
>   in DT, if not passed, will be reset to be 0.
> - Remove unnecessary change: move config's descriptor and bmAttributes
>   init from xxxi_config() to xxx_bind() in leagcy gadget drivers.
>=20
> This is a follow-up of Macpaul Lin's previous patchset to resolve usb
> gadget driver working with OTG 2.0, and set otg features by not only
> usb driver config but also usb hardware property in DT, main changes:
> 1. Add usb_otg20_descriptor definition for OTG 2.0 which introduces bcdOTG
>    field for otg revision, bcdOTG can be passed via device tree.
> 2. OTG features(SRP/HNP/ADP) can be decided by combination of usb HW
>    properties and usb driver config.
> 3. Change the chipidea usb driver to use the updated mechanism.
> 4. Remove static usb otg descriptor definition, but allocate and init it
>    according to otg capabilities in each gadget driver, if otg capabiliti=
es
>    is not defined for legacy platforms, the usb otg descriptor content is
>    kept the same as current static definition.
>=20
> Li Jun (19):
>   usb: otg: add usb_otg_caps structure for otg capabilities
>   doc: dt-binding: usb: add otg related properties
>   usb: common: add API to update usb otg capabilities by device tree
>   usb: chipidea: set usb otg capabilities
>   usb: chipidea: update ci_otg_is_fsm_mode conditions
>   usb: gadget: add usb otg descriptor allocate and init interface
>   usb: gadget: configfs: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: ether: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: acm_ms: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: audio: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: cdc2: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: g_ffs: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: hid: allocate and init otg descriptor by otg capabilities
>   usb: gadget: mass_storage: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: multi: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: ncm: allocate and init otg descriptor by otg capabilities
>   usb: gadget: printer: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: serial: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: zero: allocate and init otg descriptor by otg
>     capabilities
>=20
> Macpaul Lin (4):
>   usb: add usb_otg20_descriptor for OTG 2.0 and above
>   usb: add USB_OTG_ADP definition
>   usb: add usb_otg_caps to usb_gadget structure.
>   usb: gadget: composite: add USB_DT_OTG request handling

ok, so how you guys want to handle this series ? Should I take
everything through my tree ? I'd need Acked-by for all chipidea drivers
if that's the case.

--=20
balbi

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVr7MEAAoJEIaOsuA1yqREWeQP/i7m6F/rM3BApeRajWYH9Fb5
fb8QDlQ30eDQxGZ4vpyHvunnjM/BBrZoTdJKlYuBi5mGa9D+xCZPrxHA1k0fc036
dlhDieArn6By1wvXUD3BLjrPTlA9UTiktgSKfv6AYdJ2Va+wYKfnbH8ItCSuUgQI
mYfBGe6dXGNizF9KCblw+3n5ta9WEk3tr2J//rR3EVLxWg5I8RPez4lq8TUft6zc
iVHfTQoL5DVr3jbisCA61mPEiCjUqMU3mMgn3hI46FAFD5EXOcxiMJ1poxTGFM46
NfVlD4D8eAjqmpgl4jok3jOx8y5HqejSqr+DYtEzaQrQYuTPDkfkKhHXh5zzq1sq
VzRQ1H3WqaAhOL5mWcwQcfpZjaX82Dcm6rdMomqVRjolvJh/kpofPin2m7Bx2xwP
CWtw76jPVrB4fBJgvxQDWrilNNziWmQgB1s1xpEnsamMqXWVlIkVD9nPRBL9sXq0
YwEG7hsTlRkFY+vGXFZNC64gUG7mvvPwEAUvIgAHV1XMQkVkprcsw9T6u7FfhBqJ
e+lxQQDYSvt3ev5mgehfWV3ZVgBbo+z9YLZnYHFtHqB/n2O++gD+lwsGdbUkIn5m
TljsEOhYAP02dU/fWie/Y5pG46HO3Q9PTqEfLCllEXEE3me9u538yz6VdspbUui6
XtAzrmLUAkfcG1Bw81j5
=SwIr
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

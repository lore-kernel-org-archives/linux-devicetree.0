From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] usb: gadget: udc: renesas_usb3: add support for R-Car M3-W
Date: Tue, 15 Aug 2017 12:46:38 +0300
Message-ID: <87pobx6u4h.fsf@linux.intel.com>
References: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1501813018-6116-4-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20170810174221.ovyl7bd64s6mjvyw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810174221.ovyl7bd64s6mjvyw@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Fri, Aug 04, 2017 at 11:16:58AM +0900, Yoshihiro Shimoda wrote:
>> This patch adds support for R-Car M3-W. This patch also adds R-Car
>> Gen3 generic version's compatible and changes ".compatible" in
>> the usb3_of_match from "renesas,r8a7796-usb3-peri" to
>> "renesas,rcar-gen3-usb3-peri".
>>=20
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 +++++++++++=
++---
>>  drivers/usb/gadget/udc/renesas_usb3.c                  |  2 +-
>>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> Binding looks fine, but...
>
>> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/=
udc/renesas_usb3.c
>> index aa2b185..b1e166c 100644
>> --- a/drivers/usb/gadget/udc/renesas_usb3.c
>> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
>> @@ -2503,7 +2503,7 @@ static void renesas_usb3_init_ram(struct renesas_u=
sb3 *usb3, struct device *dev,
>>=20=20
>>  static const struct of_device_id usb3_of_match[] =3D {
>>  	{
>> -		.compatible =3D "renesas,r8a7795-usb3-peri",
>> +		.compatible =3D "renesas,rcar-gen3-usb3-peri",
>
> You need to keep the existing string for compatibility with existing=20
> dtbs.

I've fixed it up locally:

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc=
/renesas_usb3.c
index ff69f4645b7c..16ceb445bee8 100644
=2D-- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2512,6 +2512,10 @@ static const struct of_device_id usb3_of_match[] =3D=
 {
                .compatible =3D "renesas,r8a7795-usb3-peri",
                .data =3D &renesas_usb3_priv_gen3,
        },
+       {
+               .compatible =3D "renesas,rcar-gen3-usb3-peri",
+               .data =3D &renesas_usb3_priv_gen3,
+       },
        { },
 };
 MODULE_DEVICE_TABLE(of, usb3_of_match);


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlmSwv4ACgkQzL64meEa
mQauohAA2vFcHkf+98RhRsi1Xws2zQpZHr6EhsbhACYs1Ws7byCxevVNZvg+BApg
9HHpU1B14N1VV73CEDdxkejBvocwSG6zXja1c4fJHHbZmprloJ6mqTZqORj6KLhx
qufYP4Z5tAyVjmZ2owtHNKxIRCdFMGLkuTWnBGSCrE/vSAHRxJG8J81LKjQacpQ3
WtwFQNR84rx0lKAwt5krVqobi4zkfA++Rm4AtJwCJjG3AIoOKnHTYtbc7EjFcMtN
kwV7MnZdQyDHPFVGhN7XI8G3ACJF+HJ0coi6ktsZhkoc0YTCF8uutjwUX+n+EDAO
fsLZx+L43SepcwKunm8v0ffgGynsAJkEoGYIIp/xe9Sj9kXc9hgvb3yo2nyhbuw0
5RTfy4VhcaCjEFT9fQsbyLnUHLgG6YBkITqjKOPXWAXCy8mmZ2GAGZ5pVsym1Y+k
pJOWSQEhXZ3IihLBO8O2DoGz52h0UIdrewfQCyhh4UBKKcoFr4A/eR5j4TggwOhp
b2HyhlSGcy4nzKkXmDUi2jnku2hSNXfQM/I0pLL11uqMYSrDHxebndWD7md/7dwD
lgYyjhffa4MS0oHhqiDZk4TJWp8kLOwiraJMPoGdlSJPX7g91Hk7FSrkTWKZ8Qma
eg95YElsH6v+w9Swec0D6KUNy3RTwxeyYEEEXZ+a5zUBRpDrOcM=
=eP/p
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

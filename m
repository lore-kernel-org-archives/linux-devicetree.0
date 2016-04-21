From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: devicetree: avoid duplicated matching code (was: Re: [PATCH 1/3] xhci: plat: adapt to unified device property interface)
Date: Thu, 21 Apr 2016 16:57:12 +0300
Message-ID: <874mav9i9z.fsf@intel.com>
References: <1461064246-27350-1-git-send-email-heikki.krogerus@linux.intel.com> <1461064246-27350-2-git-send-email-heikki.krogerus@linux.intel.com> <87fuuf9pip.fsf@intel.com> <CAL_JsqLVAN_dEcGUbNyiBjFJTSPSPjMKzWG9QBoJ71whpfmBiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLVAN_dEcGUbNyiBjFJTSPSPjMKzWG9QBoJ71whpfmBiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Thu, Apr 21, 2016 at 6:20 AM, Felipe Balbi
> <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>
>> Hi,
>>
>> Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>> @@ -197,7 +196,7 @@ static int xhci_plat_probe(struct platform_device *=
pdev)
>>>       }
>>>
>>>       xhci =3D hcd_to_xhci(hcd);
>>> -     match =3D of_match_node(usb_xhci_of_match, node);
>>> +     match =3D of_match_node(usb_xhci_of_match, pdev->dev.of_node);
>>
>> Rob, it's weird that OF-based drivers have to redo the same matching
>> which was already done by drivers/base/platform.c::platform_match() just
>> to get match->data. If we know we matched, couldn't we just cache a
>> pointer to match->data in struct device_node.data ? Something like
>> below? (completely untested)
>
> Yes, it is. AIUI, there is some sort of race condition in doing what
> you suggest though. IIRC, Grant did that and reverted it if you look
> at the git history.

looking at drivers/base/platform.c I can't find anything along these
lines. Adding Grant.

Grant, any memory left of this race ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXGNw5AAoJEIaOsuA1yqREgrQQAK+m7MYiZgkAvw5J3q+T6vgU
VhOYDqwOpb/LcXSH9Ka7T2rFHPgB4ShLJVzVxcg0ix4B2Cw5A3HOa7Wx9Kr4R9wB
KhI/W5AzuBNgMz72vK9w8UV4qYGRXzQ+8Sm+D6Nl2CDK/B1VHUh4W4NDk+ClM0rN
+FvAyTeffwmcyN+3G3gFqg781pFVxh0s3zKxOjGcX9JVknSvwNnMRw578yLdSjtp
/ADEmhVnxJNFWzk8rcshkGTQaQF074j8yAQS6kG962COLlB8DonqKtvHT/EMPL4x
tvpmHnZIbu06lB4/gLxxkSn9kNzLWXJAJ58eXQVnS9IPjAsvZ2EzUQkCuIS9JCfq
YtFgzaudP8fZNQWBs5we4USn6IlxcMpv4D9G9baticWKNGsOKMark0Xa1wBWkztd
rzob5wPsmPBUai7PHT31gmHmSURXhjEcTK/RkkJgOHZ/GJFFyTvwRCWpQSDkOGtT
iJvGJqMubXJ/Fcd3h4MIUBpwpz60J1GeNaHOaHw8YzVRBgKzNHOgDL4mppOHPOsi
Fnk1bc37aA9lQzMpJlpgY8IYGh6ekEJoEcbK1nUTmun1gD+sY1r+LKr4nUSvBb4p
pPWxNwrL4CSvdld3FYlADJW07Ay92xZmEvoJ02z/73ps7tNBGjdr68VbpU7ma4dF
ho35GdLcknURYez5wreo
=E9WH
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

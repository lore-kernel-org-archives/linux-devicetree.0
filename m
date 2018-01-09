From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/15] usb: dwc3: Add disabling of start_transfer failure quirk
Date: Tue, 09 Jan 2018 10:45:01 +0200
Message-ID: <87incbzaia.fsf@linux.intel.com>
References: <cover.1515182391.git.thinhn@synopsys.com> <3c63b5f97343d276049e1d59ef2371160004b137.1515182391.git.thinhn@synopsys.com> <20180109041602.f4tk5jynnno2xgvk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109041602.f4tk5jynnno2xgvk@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Fri, Jan 05, 2018 at 12:16:02PM -0800, Thinh Nguyen wrote:
>> In DWC_usb31 version 1.70a-ea06 and prior needs a SW workaround for isoc
>> START TRANSFER command failure. However, some affected versions may have
>> RTL patches to fix this without a SW workaround. Add this quirk to
>> disable the SW workaround when it is not needed.
>
> I really think this one should be implied by compatible strings.

won't work for dwc3. Core driver has a single compatible string, also
this wouldn't work for PCI-based implementations.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlpUgQ0ACgkQzL64meEa
mQYT3A/8D2pZTqmVxiarRacxT3neoKeHHhWEREHpEmHGnX+qsDBsZ/4qo8qVCfTd
fT1j5V3pRkXU8fi0QuWFm+5HxVZ9WdTRXjLV3MiYxh6Djh9ne6tgHkSEUS9bsr55
j3Exdj6LhRivmKqnGU5puHTrqmwJMwy4rf+5Imqy7layTLwck75PkazBbiWUlKWV
RTXL+uQcadYisvgIdCtgRtAJSNuSL4r5Ea7QrclqJKSLnTXq7sfdUD7j0b0dw8fn
qHiT2/PBw7DU5eawbrjnikle2Ob9NBreCwbV9YtPPjdwJ7R+3Y4bqc2e89NPx5uF
xjWW1NYtwUOxVe9BsM4gKaj+2hqKNZuX+pmjLQCmJkN9BcXJco9YK5ioJqnJ8ijM
qLu+uXPkKOd3U+5CBJXi9HzsIvSRvJqw8821inbiJeBjsxdSBR6LZKtCMy6Tyyor
OyN1XEkgN1k9vMqjEKm7wBrnqjJcL/6FPanJMQ4r/LYnhbKrcerMLRxIUZ6cuF2R
U2oxL0Ar+vkWtCzmr3gavAP+QqM/WQ0zPB7J5Mcaq3qSZEUcEwx+/XQ31WBc4nHz
rok9gtxppruw7Pswim0bKABo0r3jbdLeZGdPsRDOB+uKj/BLYv4pY51RP0dsz3rD
zZigyK9WZ0X2xPc95KYFF5KVjON0QAJT+/QV1+QTBAuYUkMawMM=
=WlY6
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

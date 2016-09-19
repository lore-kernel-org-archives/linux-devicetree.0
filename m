From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v4 7/7] ARM: dts: bcm283x: drop alt3 from &gpio
Date: Mon, 19 Sep 2016 11:12:37 +0100
Message-ID: <87wpi89p0q.fsf@eliezer.anholt.net>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com> <1474274603-24215-8-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474274603-24215-8-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> As the alt3 group has no pins left drop it from &gpio.
>
> Signed-off-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

If you end up spinning another version for some reason, I'd squash this
patch with the previous one.  But regardless, 3-7 are:

Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX37oVAAoJELXWKTbR/J7o3jkP/RiPReyWnS2rHHRVCNw3eBKu
DeXgh/GvN6ofz+Al03WgY8MlvfdhXPJh3T5XC7bQSAQQEi1F+naUQOykf9pP1g12
JnWWr9QM88FwNvn9+ayFmTH83k9JzuSzHr3vkS+y2JV4AqSnGRPSvYL2CxesCizn
91Fb+8ifmyxpOtOJzjnVh2O3sI/5W4td+QOgZx0lLJO/OKMsguwgj7+uTPnDgQ8J
g4D1KF76Ys6cplenHj6ww3b1ELDhWPWx3dFVjugWh6492KrkLGLViwHsLOIVjncR
GayxJB6uQNKjgnIU09Gf56FrcChQgPp4uKzGPIepa7rUcUpM2m6YRu0y5kG+Oemp
3BChWzoUjJfhahRqJtijfsECet6OhwWqprKNsnxO3U/hA9Y1CWNh9LckupyF6tLS
vUDorSRFQiZVbybjKAmzceM17yT9MDoI0jTKpUNCSxmCbT3Y6WPGlmUu034N7GdI
EwYkmxxnnZRQeXhFnRtfKxyDmBLuxYKThgeJ8Mz3zmGht16MyOpbb8FmN2jKRJrK
j4N1ysDQX68wNwBma3OKNOMp5Wi5AnMc3jUYyiDwsoEFD1fi4WTnW5+DvEm4tZLH
oq0ypuVyNoU6Th95kUxatNHSvTwvuVULB5j/KW/5SNfSa0Y4788jDirDmGEod3cd
EwBqSbl0pF1YoLxCp6fm
=a0yC
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

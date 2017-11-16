From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm2835-rpi: Avoid conflicts on i2c0
Date: Thu, 16 Nov 2017 12:34:53 -0800
Message-ID: <87a7zmq7wy.fsf@anholt.net>
References: <1510779424-642-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510779424-642-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> The GPU firmware of the Raspberry Pi 3 uses i2c0 to communicate to
> the FXL6408 gpio expander. It's a bad idea to use the same interface
> from the ARM side. Since this interface isn't used by the other
> RPi boards, it's save to remove the complete node and avoid this
> conflict.

It's not used by other kernel drivers currently, but should we leave it
in for the pi0/1/2 folks that might have userspace I2C stuff using it?
That's a thing people do, right?  I actually don't know.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAloN9m4ACgkQtdYpNtH8
nugcEw//cA0BH2uZV6tV48AHFhVtp94pVwxgnOsDleBW1mfInI7bmDZUJYRr0t+f
VvwX7hWCMlh1g5qVpgmo8jokwmHH29AjxZpW3VI/leiILOMrVDQtwKxREm/mPpwH
r/9i9VJW+uudJSU5vTeqrBz/u9wQN4tfPrA9nvdZpqTQHvFQKzqUvrQ2D+xi6Nm6
JU+fiek8V/SdLp/kBBHFN4nvEZMqfgFVrN1ESmTQ4+ujRncWOFbdMuB8RySCImqT
kuBO9btYY2Ox0P8WibjknpT09btwni2gvNCN57Q1mCBKhiRY6WWGZ4t6Pvxq9lUc
c6SspvgDgOB+QgJqkte9+pIaH+pHRM8wvAUnH9WWz3y2IBoSYEpwwohFByj0mx4W
oAW82Vq4BmSJo0TaaruhC9wAsLeINjBeA/GMI6bL1OpvtDZchM9WAQ9zp3F5htle
8LNwSmDdBvJ3PuTajhPqy1CYlqd1QYJrwcdxUNianaiCj7QcyGjtxkDU84GGBIxG
izC+Zc+igVWIuHen6Od6OAgTdiscFMjp0fbR0LgeTKBfBAsNwpn45USm8mvq3pFS
UjF/KbbmfYekx3K2ILHLH7TTrshIg9hHCjqnJrkqDK9+04zS66ZQz3MIzTA5+vfi
X1nLkMPHc5lfzc/uSx5+mOpMRRApqgdSXQ5h/QYCBwABEVGDOgI=
=m7ID
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

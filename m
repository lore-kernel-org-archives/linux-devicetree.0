From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: vf610-cosmic: relicense vf610-cosmic.dts
 under GPLv2/X11
Date: Wed, 25 Nov 2015 00:41:22 -0500
Message-ID: <56554A02.8080202@pid1solutions.com>
References: <1448323291-23505-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448323291-23505-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/23/2015 07:01 PM, Stefan Agner wrote:
> GPLv2-only devicetrees make reuse difficult for software components
> licensed under a different license.
> 
> The consensus is that a GPL/X11 dual-license should allow all necessary
> uses, so relicense the vf610-twr.dts file to this combination.
> 
> CCs were acquired using (updated some email addresses):
> git shortlog -sne --no-merges arch/arm/boot/dts/vf610-cosmic.dts
> 
> CC: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>

Acked-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>

> CC: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> CC: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


- -- 
Cory Tusar
Principal
PID 1 Solutions, Inc.


"There are two ways of constructing a software design.  One way is to
 make it so simple that there are obviously no deficiencies, and the
 other way is to make it so complicated that there are no obvious
 deficiencies."  --Sir Charles Anthony Richard Hoare

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZVSgIACgkQHT1tsfGwHJ8+WgCgpIksiDYnrAinLzsEv11cl5Ez
Hb4An1Bm9qpykikhgs+BDjuNiDp7KDC/
=8817
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

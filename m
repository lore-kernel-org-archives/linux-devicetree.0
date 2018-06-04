From: Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] arm: sun4i: Add support for Pengpod 1000 tablet
Date: Mon, 4 Jun 2018 18:33:02 +0100
Message-ID: <313a74ea-0be6-cff1-6b2f-06a4b0b7ba8d@settrans.net>
References: <20180602160313.26763-1-rah@settrans.net>
 <20180604081302.hcn7j36gt6xeyquq@flea>
Reply-To: rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pCmjnmObO9x0egywGVNLrY5rQWHGXhoYZ"
Return-path: <linux-sunxi+bncBDB3RAHOSIJBBXPP2XMAKGQEXM2PMLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180604081302.hcn7j36gt6xeyquq@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pCmjnmObO9x0egywGVNLrY5rQWHGXhoYZ
Content-Type: multipart/mixed; boundary="htcHbGzW5oCOp962TF84wFRNTZm5l55lA";
 protected-headers="v1"
From: Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <313a74ea-0be6-cff1-6b2f-06a4b0b7ba8d-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] arm: sun4i: Add support for Pengpod 1000 tablet
References: <20180602160313.26763-1-rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
 <20180604081302.hcn7j36gt6xeyquq@flea>
In-Reply-To: <20180604081302.hcn7j36gt6xeyquq@flea>

--htcHbGzW5oCOp962TF84wFRNTZm5l55lA
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-GB

On 04/06/18 09:13, Maxime Ripard wrote:
> On Sat, Jun 02, 2018 at 05:03:13PM +0100, Bob Ham wrote:

>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.

>> + *     The above copyright notice and this permission notice shall be
>> + *     included in all copies or substantial portions of the Software.

> And this is redundant with the SPDX header.

The X11 license notice states explicitly that the notice has to be
included in the file.  Wouldn't removing it be a violation of the license?


>> +		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
> 
> Each step should increase the perceived brightness by roughly 1/Nth, N
> being the number of steps. Usually PWM backlights don't work like that.

FYI, this was copied from another .dts file.  All of the other
brightness-levels settings in sun{4,5,7}i .dts files follow similar
patterns:

sun4i-a10-dserve-dsrv9703c.dts:               brightness-levels = <0 10
20 30 40 50 60 70 80 90 100>;
sun4i-a10-inet1.dts:          brightness-levels = <0 10 20 30 40 50 60
70 80 90 100>;
sun4i-a10-pov-protab2-ips9.dts:               brightness-levels = <0 10
20 30 40 50 60 70 80 90 100>;
sun5i-a13-empire-electronix-d709.dts:         brightness-levels = <0 10
20 30 40 50 60 70 80 90 100>;
sun5i-a13-utoo-p66.dts:       brightness-levels = <0 30 40 50 60 70 80
90 100>;
sun5i-gr8-evb.dts:            brightness-levels = <0 10 20 30 40 50 60
70 80 90 100>;
sun7i-a20-wexler-tab7200.dts:         brightness-levels = <0 10 20 30 40
50 60 70 80 90 100>;

I'll take the brightness-levels from sun8i-a83t-tbs-a711.dts which
follows a more appropriate pattern:

sun8i-a83t-tbs-a711.dts:              brightness-levels = <0 1 2 4 8 16
32 64 128 255>;


Thanks,

Bob

-- 
Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>

for (;;) { ++pancakes; }

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--htcHbGzW5oCOp962TF84wFRNTZm5l55lA--

--pCmjnmObO9x0egywGVNLrY5rQWHGXhoYZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

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
=HzkO
-----END PGP SIGNATURE-----

--pCmjnmObO9x0egywGVNLrY5rQWHGXhoYZ--

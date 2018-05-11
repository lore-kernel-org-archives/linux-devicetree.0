From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM: dts: sun7i: Add support for the
 Ainol AW1 tablet
Date: Fri, 11 May 2018 16:36:47 +0200
Message-ID: <20180511143647.ici2bfoeeldto3ju@flea>
References: <20180507220413.21990-1-contact@paulk.fr>
 <20180507220413.21990-3-contact@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xxiga6mvouif32wv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC6V23LQKGQEXZMW7UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180507220413.21990-3-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xxiga6mvouif32wv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, May 08, 2018 at 12:04:13AM +0200, Paul Kocialkowski wrote:
> +++ b/arch/arm/boot/dts/sun7i-a20-ainol-aw1.dts
> @@ -0,0 +1,297 @@
> +/*
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)

This really should be the first line, and with a C++ style comment, as
in:

// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
/*
 * Copyright (C) ...

See Documentation/process/license-rules.rst

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <  0   1   1   1   1   2   2   2
> +				       2   3   3   3   3   4   4   4
> +				       5   5   5   6   6   6   7   7
> +				       8   8   8   9   9   9  10  10
> +				      10  11  11  12  12  12  13  13
> +				      14  14  14  15  15  16  16  17
> +				      17  17  18  18  19  19  20  20
> +				      21  21  21  22  22  23  23  24
> +				      24  25  25  26  26  27  27  28
> +				      28  29  30  30  31  31  32  32
> +				      33  33  34  35  35  36  36  37
> +				      38  38  39  39  40  41  41  42
> +				      43  43  44  44  45  46  47  47
> +				      48  49  49  50  51  51  52  53
> +				      54  54  55  56  57  57  58  59
> +				      60  61  61  62  63  64  65  65
> +				      66  67  68  69  70  71  71  72
> +				      73  74  75  76  77  78  79  80
> +				      81  82  83  84  85  86  87  88
> +				      89  90  91  92  93  94  95  96
> +				      97  98  99 101 102 103 104 105
> +				     106 108 109 110 111 112 114 115
> +				     116 117 119 120 121 123 124 125
> +				     127 128 129 131 132 133 135 136
> +				     138 139 141 142 144 145 147 148
> +				     150 151 153 154 156 157 159 161
> +				     162 164 166 167 169 171 173 174
> +				     176 178 180 181 183 185 187 189
> +				     191 192 194 196 198 200 202 204
> +				     206 208 210 212 214 216 219 221
> +				     223 225 227 229 232 234 236 238
> +				     241 242 244 246 248 250 253 255>;

You kind of overdid it here :)

What I meant to say before was that if you have 10 elements (and you
really should have something in that magnitude) each step should
increase the perceived brightness by 10%.

In this particular case, I really think having something close to <0 4
8 16 32 64 128 255> would be enough.

And in general, that kind of odd looking table without any more
context is just screaming for a comment :)

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--xxiga6mvouif32wv--

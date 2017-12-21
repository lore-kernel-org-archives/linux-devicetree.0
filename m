From: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Thu, 21 Dec 2017 09:19:24 -0600
Message-ID: <CACNAnaE9GiVTXD-TV1xXyBJKtTGKpdA6n0REk6a=qm218EgHbg@mail.gmail.com>
References: <20171219210523.10428-1-kevans91@ksu.edu> <20171221145512.llxvzkcrjpquhczi@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221145512.llxvzkcrjpquhczi-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 8:55 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Kyle,
>
> On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org wrote:
>> Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
>> thermal calibration data, add node to describe it.
>>
>> a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
>> supported in an external driver for FreeBSD.
>>
>> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
>
> The patch looks fine in itself, but we've had a number of issues with
> the register layout (and access patterns) in the past, so I'd rather
> have something that works in Linux too if possible.

Hello!

I have a patch that I think should make it work fine on Linux [1], but
I'm afraid I have little to no capability to test it myself and so I
did not add it as well.

I do know that the rootkey is offset 0x200 into the given space [2],
as is the case with the H3, and that the readout quirk is not needed.
I wasn't 100% sure that the a83t has 2Kbit worth of efuse space as the
H3, but I do know that thermal data can be found at 0x34 and 0x38 in
this space.

[1] https://people.freebsd.org/~kevans/sunxi-sid.diff
[2] https://svnweb.freebsd.org/base/head/sys/arm/allwinner/aw_sid.c?view=markup#l56
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

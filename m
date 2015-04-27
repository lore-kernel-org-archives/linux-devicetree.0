From: Catalin Crenguta <catalin.crenguta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Mon, 27 Apr 2015 12:19:52 +0300
Message-ID: <CABH3fy-kaEuwW6oxwZgahopPEUheXtwbJRyUk2_9J0mqo89Pzg@mail.gmail.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
	<1427876156.24886.1.camel@pengutronix.de>
	<1427877126.2449.0@mail.essensium.com>
	<CABH3fy_YWYoQZL4E_i1FWaY+rOgidxBVcUNo15GrXfcoS2or0A@mail.gmail.com>
	<1429878521.2872.3.camel@pengutronix.de>
	<CABH3fy8o8R7d+bpyxS-Q0eSyPgqg0dvuQnF7m1gywLAzjRBXRA@mail.gmail.com>
	<1430118452.1475.0@mail.essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430118452.1475.0-ZoYdQ1qa4hNshLDXf1BNyNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Vianney_le_Cl=C3=A9ment?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hi Catalin,
>
> Sorry for not being able to answer earlier.  Great that you made eMMC to
> work.  Can you share your pinmux configuration for usdhc3, so I can send a
> follow-up patch?

I have changed the byte 0x59 with 0x09
0x17059 -> 0x17009
and 0x10059 -> 0x10009
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

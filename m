From: Vianney le =?iso-8859-1?q?Cl=E9ment?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Mon, 27 Apr 2015 09:07:32 +0200
Message-ID: <1430118452.1475.0@mail.essensium.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
	<1427876156.24886.1.camel@pengutronix.de>
	<1427877126.2449.0@mail.essensium.com>
	<CABH3fy_YWYoQZL4E_i1FWaY+rOgidxBVcUNo15GrXfcoS2or0A@mail.gmail.com>
	<1429878521.2872.3.camel@pengutronix.de>
	<CABH3fy8o8R7d+bpyxS-Q0eSyPgqg0dvuQnF7m1gywLAzjRBXRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABH3fy8o8R7d+bpyxS-Q0eSyPgqg0dvuQnF7m1gywLAzjRBXRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Crenguta <catalin.crenguta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 8:47 , Catalin Crenguta=20
<catalin.crenguta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I have managed to get it working after changing the drive strength to
> 260 Ohm and speed to 50 MHz.
> Changing only the speed to 50 MHz didn't work, I had to also change
> the drive strength. I haven't tested other values.
> Maybe this can be pushed to mainline?

Hi Catalin,

Sorry for not being able to answer earlier.  Great that you made eMMC=20
to work.  Can you share your pinmux configuration for usdhc3, so I can=20
send a follow-up patch?

Thanks,
Vianney

Vianney le Cl=C3=A9ment de Saint-Marcq
Embedded Software Developper =C2=B7 +32 485 84 55 05
Essensium, Mind division =C2=B7 www.mind.be
GPG: 727B CFE9 355F 1B02 0820 EE1C 9042 3E07 A804 0316

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Catalin Crenguta <catalin.crenguta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Mon, 27 Apr 2015 09:47:46 +0300
Message-ID: <CABH3fy8o8R7d+bpyxS-Q0eSyPgqg0dvuQnF7m1gywLAzjRBXRA@mail.gmail.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
	<1427876156.24886.1.camel@pengutronix.de>
	<1427877126.2449.0@mail.essensium.com>
	<CABH3fy_YWYoQZL4E_i1FWaY+rOgidxBVcUNo15GrXfcoS2or0A@mail.gmail.com>
	<1429878521.2872.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429878521.2872.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: =?UTF-8?Q?Vianney_le_Cl=C3=A9ment?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Fri, Apr 24, 2015 at 3:28 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Catalin,
>
> This may as well be a signaling issue. You could try to slow down the
> the MMC bus speed or play a bit with the pin drive strength values. Note
> that in those cases _reducing_ the drive strength may be the right thing
> to do.
>

Thank you!
I have managed to get it working after changing the drive strength to
260 Ohm and speed to 50 MHz.
Changing only the speed to 50 MHz didn't work, I had to also change
the drive strength. I haven't tested other values.
Maybe this can be pushed to mainline?

> Regards,
> Lucas

Best regards,
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

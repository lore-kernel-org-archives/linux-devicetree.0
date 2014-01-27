From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: dts: imx: remove the use of pingrp macros
Date: Mon, 27 Jan 2014 09:47:10 -0800
Message-ID: <CAOesGMgV-UPTujzdnb5FWHM7b5X-_f7qCE7awrF4+snB2Tn+9g@mail.gmail.com>
References: <1390668191-20289-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390668191-20289-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn,

On Sat, Jan 25, 2014 at 8:43 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob,
>
> In order to solve a pinctrl data efficiency problem, we introduced
> pingrp macros [1] in this development cycle as the base of board dts
> support.  The whole imx-dt-3.14 pull request has been held by Olof for
> a few weeks because he wants to get a general approval from DT folks
> on this change.  But unfortunately it appears that you are not fond of
> this change.
>
> I just spent the day to create a patch series against imx-dt-3.14 to
> remove these pingrp macros.  May I get your nod on this quick
> turn-around, so that we do not miss the merge window?
>
> Hi Olof,
>
> I guess we do not have to shut the door for imx-dt-3.14 if you and DT
> folks are happy with this patch series, which is a quite straight
> forward search&replace change?

The merge window is halfway over already, the time for us to pick up
large branches like these are long past.

Please rebase (since this is a partial revert of some of the earlier
patches in your dt branch, I think?), and resend after -rc1 for 3.15
inclusion.


Thanks,

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

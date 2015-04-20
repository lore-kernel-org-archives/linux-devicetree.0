From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: ux500: Fix SD-card regression by using GPIO regulator
Date: Mon, 20 Apr 2015 08:49:37 -0700
Message-ID: <CAJAp7Oh1V7QKUtBnf-RCYyFD_RfTLOM5ir-jnr2DR3kg1xAOKg@mail.gmail.com>
References: <1429538553-17366-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429538553-17366-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 7:02 AM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patchset fixes an old stability issue for detection of SD-cards. The DT
> node for the GPIO regulator which controls the I/O voltage level towards the
> SD-card was disabled in below commit.
>
[..]
> The commit that introduced the thorough error handling is:
> 9369c97cc7ec ("mmc: mmci: Cascade EPROBE_DEFER from regulators")
>

Glad I could help :)

>
> Ulf Hansson (3):
>   ARM: ux500: Move GPIO regulator for SD-card into board DTSs
>   ARM: ux500: Enable GPIO regulator for SD-card for HREF boards
>   ARM: ux500: Enable GPIO regulator for SD-card for snowball
>

Looks good

Reviewed-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

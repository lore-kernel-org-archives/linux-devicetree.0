From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: ux500: Fix SD-card regression by using GPIO
 regulator
Date: Mon, 20 Apr 2015 19:24:16 +0100
Message-ID: <20150420182416.GG3447@x1>
References: <1429538553-17366-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429538553-17366-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Where did you get this email address from?

> This patchset fixes an old stability issue for detection of SD-cards. The DT
> node for the GPIO regulator which controls the I/O voltage level towards the
> SD-card was disabled in below commit.
> 
> c94a4ab7af3f ("ARM: ux500: Disable the MMCI gpio-regulator by default")
> 
> The conseqeunce from that commit, was that the initially chosen voltage level
> remained, even after I/O voltage switch sequence was performed for UHS-I cards,
> since no GPIO regulator could be fetched.
> 
> Appearantly some SD-cards didn't have any problem to cope with that, but some
> had.
> 
> Recently thorough error handling was introduced for the MMCI mmc host driver,
> while fetching the regulators for the SD-card. That actually made the driver to
> continously return -EPROBE_DEFER while probing, which thus meant failing all the
> times instead of just failing "sometimes".
> 
> The commit that introduced the thorough error handling is:
> 9369c97cc7ec ("mmc: mmci: Cascade EPROBE_DEFER from regulators")
> 
> 
> Ulf Hansson (3):
>   ARM: ux500: Move GPIO regulator for SD-card into board DTSs
>   ARM: ux500: Enable GPIO regulator for SD-card for HREF boards
>   ARM: ux500: Enable GPIO regulator for SD-card for snowball
> 
>  arch/arm/boot/dts/ste-dbx5x0.dtsi  | 17 -----------------
>  arch/arm/boot/dts/ste-href.dtsi    | 15 +++++++++++++++
>  arch/arm/boot/dts/ste-snowball.dts | 13 +++++++++++++
>  3 files changed, 28 insertions(+), 17 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

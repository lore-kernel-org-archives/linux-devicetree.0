From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 1/2] ARM: dts: add rockchip PX3 Evaluation board
Date: Tue, 13 Sep 2016 13:04:25 +0200
Message-ID: <1473786122.FM2XgiQb2U@phil>
References: <1473529249-6151-1-git-send-email-andy.yan@rock-chips.com> <1473529440-6202-1-git-send-email-andy.yan@rock-chips.com> <94379f31-00bb-4873-5a93-f6eeead55180@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94379f31-00bb-4873-5a93-f6eeead55180-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Dienstag, 13. September 2016, 18:06:12 CEST schrieb Andy Yan:
> Hi Heiko:
> 
>      Is there any further suggestion about this series?

nope, all fine. I've now applied both patches, after moving some minor stuff
around (alphabetical ordering etc). While it is in branches targeted at 4.9 it
may very well only make it into 4.10.

I've also dropped the stk3310 i2c node from both until the binding is figured
out and moved the px3 board binding to the px5 patch, so that we can sort
entries correctly but don't produce merge conflicts.

If you have time, please give it a final look:
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=a55e2f1b7423ab8b1c3fefbac7ae752e8a4b7edc
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=d42f818e056116237ac8b6a3f72e5bfc38681589


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

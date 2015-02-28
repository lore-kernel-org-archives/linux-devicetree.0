From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: Provide always-on clock support
Date: Sat, 28 Feb 2015 14:51:17 +0530
Message-ID: <CAJe_Zhf=GBb8AfnTLaGxGcZkVSm9TtdnTsmpH_MBmbMT8ViMDg@mail.gmail.com>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
	<1425071674-16995-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425071674-16995-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 February 2015 at 02:44, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Lots of platforms contain clocks which if turned off would prove fatal.
> The only way to recover from these catastrophic failures is to restart
> the board(s).  Now, when a clock is registered with the framework it is
> compared against a list of provided always-on clock names which must be
> kept ungated.  If it matches, we enable the existing CLK_IGNORE_UNUSED
> flag, which will prevent the common clk framework from attempting to
> gate it during the clk_disable_unused() procedure.
>
If a clock is critical on a certain board, it could be got+enabled
during early boot so there is always a user.
To be able to do that from DT, maybe add a new, say, CLK_ALWAYS_ON
flag could be made to initialize the clock with one phantom user
already. Or just reuse the CLK_IGNORE_UNUSED?

-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

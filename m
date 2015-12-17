From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 0/6] Support the rk3036 Kylin board
Date: Fri, 18 Dec 2015 00:48:36 +0100
Message-ID: <2077620.agNLOx8o2g@diego>
References: <1450362112-8075-1-git-send-email-wxt@rock-chips.com> <CAGXu5jKEykL1+F=m2kk8E4qOKeUmc-jHnZ-fYpz1OS8oQ1Pgxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jKEykL1+F=m2kk8E4qOKeUmc-jHnZ-fYpz1OS8oQ1Pgxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leo Wang <leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Caesar, Kees,

Am Donnerstag, 17. Dezember 2015, 11:45:06 schrieb Kees Cook:
> On Thu, Dec 17, 2015 at 6:21 AM, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> > Kylin-board is based on RK3036 SOCs, add the initiation
> > version for working.
> > 
> > This series patches have the following decriptions:
> > 
> > PATCH[1/6]:
> > ARM: dts: fix the correct pinctrl control for rk3036
> > 
> > The pinctrl gpio pull up/down is incorrect since the rk3036 SoCs
> > can't set the status in the internal.
> > ---
> > 
> > PATCH[2/6]:
> > ARM: dts: add the lcdc and hdmi node for rk3036
> > 
> > Add the devices is related to display.
> > Based on the series patches of Mark Yao's
> > ---
> > 
> > PATCH[3/6]:
> > ARM: dts: add the sdio/sdmmc node for rk3036
> > 
> > Add the wifi/sd card work for kylin board.
> > ---
> > 
> > PATCH[4/6]:
> > ARM: dts: rockchip: add the kylin board for rk3036
> > 
> > Add the dts for kylin board.
> > ---
> > 
> > PATCH[5/6]:
> > ARM: dts: add the sound codec for kylin board
> > 
> > Make the codec rt5616 working on kylin board.
> > The realteak have been upstream for Mark Brown,
> > I guess need some days to review.
> > 
> > ---
> > 
> > PATCH[6/6]:
> > ARM: dts: add the sdio node for kylin board
> > 
> > Enable the sdio for kylin board.
> > ---
> 
> Thanks for sending this!
> 
> Reviewed-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Some thoughts: maybe collapse 4, 5, and 6 together, since it's a new file?

@Caesar, no need to resend, I can do that merging myself.
After we clarified the authorship of patch1 ;-) .

Except the audio patch, as we're missing the realtek codec driver.
I'll also drop the lcdc+hdmi parts for now, as the relevant parts aren't in
any maintainer-tree yet. The ordering is for this:

- atomic conversion
- rk3036 vop
- inno-hdmi driver
- dts changes last

The driver for the Innosilicon hdmi driver is from November, had one comment 
from me and Caesar+ Yakir should make sure it works with the atomic 
modesetting variant of the drm/kms driver please. (And probably resend the 
series fixing that one tiny comment).


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: hi6220: add resets property into dwmmc nodes
Date: Thu, 27 Oct 2016 13:23:09 -0700
Message-ID: <CALAqxLXfb48h8hMQmAaJ+YjA5=pekkQ8Dg8ReL6VTTfmuFRPDw@mail.gmail.com>
References: <1472094041-5357-1-git-send-email-guodong.xu@linaro.org>
 <1472094041-5357-2-git-send-email-guodong.xu@linaro.org> <CAKfTPtB0FtGbm4C5z+LJizrsHikKt_BGFti5XY+LN3w7zO1Vjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKfTPtB0FtGbm4C5z+LJizrsHikKt_BGFti5XY+LN3w7zO1Vjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Fathi Boudra <fathi.boudra-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 6:56 AM, Vincent Guittot
<vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> My hikey board failed to detect and mount sdcard with v4.9-rc1 and i
> have bisected the issue to this patch. Once reverted, the sdcard is
> detected again.

Hrm.. I've not seen this w/ my v4.9-rc2 based tree, and I don't have
any mmc patches there.

Can you send me your .config and point me to any other patches you're
running with? Also do you have any details about the card in case its
card specific?

Guodong: Is there any bootloader dependency on that change?

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

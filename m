From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V1 3/9] clk: sprd: add gate clock support
Date: Thu, 29 Jun 2017 18:43:05 -0700
Message-ID: <20170630014305.GK22780@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-4-chunyan.zhang@spreadtrum.com>
 <20170620013130.GI4493@codeaurora.org>
 <CAAfSe-sbJxEA0OdC9u3A4p5Q7hrfqkiHscvsuT_irOHp98G+aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAfSe-sbJxEA0OdC9u3A4p5Q7hrfqkiHscvsuT_irOHp98G+aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Geng Ren <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Ben Li <ben.li-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/22, Chunyan Zhang wrote:
> On 20 June 2017 at 09:31, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > On 06/18, Chunyan Zhang wrote:
> >> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
> >> index 8f802b2..333e2b2 100644
> >> --- a/drivers/clk/sprd/Makefile
> >> +++ b/drivers/clk/sprd/Makefile
> >> @@ -1,3 +1,3 @@
> >>  ifneq ($(CONFIG_OF),)
> >> -obj-y        += ccu_common.o
> >> +obj-y        += ccu_common.o ccu_gate.o
> >
> > Can this be built as a module?
> 
> Since most of all Spreadtrum device drivers would depend on if clocks
> have been initialized, so we'd prefer to build this into the kernel
> image.

This isn't really a good reason, but OK. Hopefully nobody wants
to make a module for every driver on the system and jam the ones
needed to access the rootfs into a ramdisk. Don't worry, you
don't need to support modules here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing
Date: Sun, 3 Nov 2013 21:04:55 -0800
Message-ID: <20131104050455.GA3651@quad.lixom.net>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <1381869563-16083-5-git-send-email-grant.likely@linaro.org>
 <CAOesGMj03kgJXttm80pHvPYeqg5hOaeOJAJ4DA8tf5LxqdArrQ@mail.gmail.com>
 <CACxGe6uE+KvycQq3XBavRcvprff6PhBaxX54W_Cb1cfuVpMXvQ@mail.gmail.com>
 <20131031185714.GA12646@quad.lixom.net>
 <20131101175317.A812AC40868@trevor.secretlab.ca>
 <20131101185401.B298FC40868@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101185401.B298FC40868-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 11:54:01AM -0700, Grant Likely wrote:
> On Fri, 01 Nov 2013 10:53:17 -0700, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, 31 Oct 2013 11:57:14 -0700, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > > On Wed, Oct 30, 2013 at 02:25:21PM -0700, Grant Likely wrote:
> > > > (Sorry for HTML mail)
> > > > 
> > > > Can you put #define DEBUG at the top of drivers/of/irq.c and send me the
> > > > log output from before and after the commit?
> > > 
> > > Here you go, quite verbose log below.
> > > 
> > > Looks like we're tripping the "no reg passed in" checks, not sure if related.
> > 
> > I think I've found the bug. See if this helps...
> 
> That one was broken. Try this instead.
> 
> From bcbffc3d16f49451ef505dc021480aa061465a15 Mon Sep 17 00:00:00 2001
> From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Fri, 1 Nov 2013 10:50:50 -0700
> Subject: [PATCH] of: Fixup interrupt parsing failure.
> 
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Well, it boots. That's an improvement. :) It is again going for the
precalculated delay loop. I'm not sure why the code path diverged before,
especially given the below irq request fail for MCT.

I do see a bunch of new printk errors that I didn't use to though:

[    0.000000] genirq: Flags mismatch irq 160. 00015200 (mct_comp_irq) vs. 00014a00 (mct_tick0)
[    0.040401] genirq: Flags mismatch irq 160. 00014a00 (mct_tick1) vs. 00014a00 (mct_tick0)
[    0.040405] exynos-mct: cannot register IRQ 160

So I don't think we're home safe yet. I need to spend some time this week
actually debugging this... Good thing the merge window is delayed.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

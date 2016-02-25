From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: add userspace clock consumer
Date: Thu, 25 Feb 2016 15:01:12 -0800
Message-ID: <20160225230112.GA28849@codeaurora.org>
References: <1456141719-2543-1-git-send-email-akinobu.mita@gmail.com>
 <20160223214944.GA20852@rob-hp-laptop>
 <20160224220819.GF4847@codeaurora.org>
 <CAC5umyjs_Q_G4jpcmPWk4Ug16tdwq+7c3UH1kwastj2P1UenqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAC5umyjs_Q_G4jpcmPWk4Ug16tdwq+7c3UH1kwastj2P1UenqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/25, Akinobu Mita wrote:
> 2016-02-25 7:08 GMT+09:00 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>:
> > Agreed. Plus, the userspace regulator consumer doesn't have any
> > DT binding for it, so I don't see why we would have a DT binding
> > for the clk one.
> 
> OK.  I'll drop a DT binding part of this driver.
> 
> I'll still try to expose this feature by platform device instead of
> exposing under clk debugfs.  Because we don't want to allow controlling
> all clock devices (which may result abuse of the feature).  Instead,
> this userspace consumer only allows explicitly specified devices to
> control.

I'm pretty lost on this whole patch. Is it for debug? Or is it to
put clk control into userspace? If it's for debug, why not just
keep this patch around locally and use it for debugging? If it's
for userspace clk control we need to have a larger discussion
around the concept of that (since Rob doesn't think it should be
done at all) and ABI (sysfs or ioctl?) before moving forward.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

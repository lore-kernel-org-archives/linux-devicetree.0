From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 18/22] clk: add support for clocks provided by SCMI
Date: Fri, 3 Nov 2017 08:12:28 -0700
Message-ID: <20171103151228.GS11011@codeaurora.org>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-19-git-send-email-sudeep.holla@arm.com>
 <20171102072350.GO30645@codeaurora.org>
 <c0b80daf-6361-87eb-fde6-a9d6a71e3e82@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c0b80daf-6361-87eb-fde6-a9d6a71e3e82-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/02, Sudeep Holla wrote:
> 
> 
> On 02/11/17 07:23, Stephen Boyd wrote:
> > Is there a lot of copy/paste going on from clk-scpi.c? Maybe it
> > could be consolidated?
> > 
> 
> Not much apart from the usual driver skeleton. Also SCPI specification
> will not be enhanced any further while SCMI will be. So they will
> deviated in the feature set going further. Even I was thinking of
> merging then together initially but based on some WIP changes to the
> specification, I thought it may not be good idea. But if we think it can
> be merged in future , I will do that for sure(for easy maintenance)
> 

Ok, no worries from me. Thanks for taking another look.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

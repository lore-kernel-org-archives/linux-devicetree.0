From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB
 driver
Date: Mon, 4 Apr 2016 11:25:15 -0500
Message-ID: <5702956B.8030501@lechnology.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
 <87fuvtbl26.fsf@intel.com> <56E76E5A.5060801@lechnology.com>
 <57022992.4060008@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57022992.4060008-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/04/2016 03:45 AM, Petr Kulhavy wrote:
> I'm trying to move on with my USB2.0 patch set because my projects is
> blocked waiting for it.
> I've seen your PHY patch but it contains only on/off functions and does
> not handle the clocks, which IMHO should be moved to the PHY driver as
> well if we decided to do it properly.

Have a closer look at my (v3) patchset. It does handle clocks in the phy 
driver. The clocks themselves are implemented in mach-davinici similar 
to the rest of the SoC clocks and the phy driver uses clk_get(), 
clk_prepare_enable(), etc.


> How shall we proceed if both of us are working on the same piece of code?

I have never submitted patches for the Linux kernel before last month, 
so I have not yet experienced the whole process of getting a patch 
accepted. So, I don't know an answer to this question.

Perhaps someone with more experience can offer advice?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

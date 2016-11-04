From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P)
 support
Date: Fri, 4 Nov 2016 13:12:26 -0700
Message-ID: <20161104201226.GC16026@codeaurora.org>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
 <20161028000656.GH26139@codeaurora.org>
 <822ebad4-4fdf-574a-12cb-75b0165f4746@redhat.com>
 <20161103223246.GA5135@hector>
 <9e0555fa-d689-e26e-feba-9daa815eb1c5@codeaurora.org>
 <20161103224422.GB5135@hector>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161103224422.GB5135@hector>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Bastian =?iso-8859-1?Q?K=F6cher?= <mail-LJ92rlH3Dns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/03, Andy Gross wrote:
> On Thu, Nov 03, 2016 at 03:42:36PM -0700, Stephen Boyd wrote:
> > On 11/03/2016 03:32 PM, Andy Gross wrote:
> > >> On 2016-10-27 5:06 PM, Stephen Boyd wrote:
> > >>> Please replace this with something more specific for the actual
> > >>> board. Preferably with the board manufacturer vendor prefix and
> > >>> some sort of string for the board.
> > > Something like?
> > >
> > > "huawei,nexus-6P", "qcom,msm8994"
> > 
> > Sure, except completely remove qcom,msm8994 from there.
> 
> Hmmm ok.  I just briefly looked at one of the sony boards and used that as an
> example.  So there shouldn't be any link to the underlying soc in the compat?

Two people asked the same question. I don't see how having the
SoC in the root compatible string does anything. Of course,
having it there doesn't hurt anything either so I don't really
care. And it may help if we want to test for SoC compatibility at
some point.

Of course, we have an SoC node, so I'd think we would put the SoC
model number into that node's compatible string. In the ePAPR it
looks like they have compatible = “fsl,mpc8572ds”, which is a
board/platform. The "SoC" on there is an mpc8572e.

In practice, there doesn't seem to be any consistency here and it
feels like everything is vague on purpose with regards to
compatible strings, so either way is fine for me.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

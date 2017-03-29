From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Wed, 29 Mar 2017 18:37:12 +0800
Message-ID: <20170329103712.GA22480@leoy-linaro>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <31be033f-514e-e48a-3ba2-a5c5cd477548@arm.com>
 <20170329030735.GA23889@leoy-linaro>
 <5584203e-cb19-a5d2-45b1-3e78d3482c55@arm.com>
 <20170329102740.GA20804@leoy-linaro>
 <89b6c6c7-0da0-6891-312a-c9221851c20a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <89b6c6c7-0da0-6891-312a-c9221851c20a-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 11:31:03AM +0100, Suzuki K Poulose wrote:
> On 29/03/17 11:27, Leo Yan wrote:
> >On Wed, Mar 29, 2017 at 10:07:07AM +0100, Suzuki K Poulose wrote:
> >
> >[...]
> >
> >>>>>+	if (mode == EDDEVID_IMPL_NONE) {
> >>>>>+		drvdata->edpcsr_present  = false;
> >>>>>+		drvdata->edcidsr_present = false;
> >>>>>+		drvdata->edvidsr_present = false;
> >>>>>+	} else if (mode == EDDEVID_IMPL_EDPCSR) {
> >>>>>+		drvdata->edpcsr_present  = true;
> >>>>>+		drvdata->edcidsr_present = false;
> >>>>>+		drvdata->edvidsr_present = false;
> >>>>>+	} else if (mode == EDDEVID_IMPL_EDPCSR_EDCIDSR) {
> >>>>>+		if (!IS_ENABLED(CONFIG_64BIT) &&
> >>>>>+			(pcsr_offset == EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32))
> >>>>>+			drvdata->edpcsr_present = false;
> >>>>>+		else
> >>>>>+			drvdata->edpcsr_present = true;
> >>>>
> >>>>Sorry, I forgot why we do this check only in this mode. Shouldn't this be
> >>>>common to all modes (of course which implies PCSR is present) ?
> >>>
> >>>No. PCSROffset is defined differently in ARMv7 and ARMv8; So finally we
> >>>simplize PCSROffset value :
> >>>0000 - Sample offset applies based on the instruction state (indicated by PCSR[0])
> >>>0001 - No offset applies.
> >>>0010 - No offset applies, but do not use in AArch32 mode!
> >>>
> >>>So we need handle the corner case is when CPU runs AArch32 mode and
> >>>PCSRoffset = 'b0010. Other cases the pcsr should be present.
> >>
> >>I understand that reasoning. But my question is, why do we check for PCSROffset
> >>only when mode == EDDEVID_IMPL_EDPCSR_EDCIDSR and not for say mode == EDDEVID_IMPL_EDPCSR or
> >>any other mode where PCSR is present.
> >
> >Sorry I misunderstood your question.
> >
> >I made mistake when I analyzed the possbile combination for mode and
> >PCSROffset so I thought it's the only case should handle:
> >{ EDDEVID_IMPL_EDPCSR_EDCIDSR, EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 }
> >
> >Below three combinations are possible to exist; so you are right, I
> >should move this out for the checking:
> >{ EDDEVID_IMPL_NONE,           EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 }
> 
> That need not be covered, as IMPL_NONE says PCSR is not implemented hence you
> don't worry about anything as the functionality is missing. This should rather be:
> EDDEVID_IMPL_EDPCSR, where only PCSR is implemented.

I think below combination doesn't really exist:
{ EDDEVID_IMPL_EDPCSR, EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 };

EDDEVID_IMPL_EDPCSR is only defined in ARMv7 ARM, and
EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 is only defined in ARMv8 ARM.

> My switch...case suggestion makes it easier to do all this checking.

Agree. Will do this.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

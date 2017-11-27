From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Hi3660: Fix state id for 'CPU_NAP' state
Date: Mon, 27 Nov 2017 10:01:28 +0800
Message-ID: <20171127020128.GB26822@leoy-linaro>
References: <1511415614-9859-1-git-send-email-leo.yan@linaro.org>
 <17639ecc-8ff8-e118-f6e1-51e2cfe4342b@arm.com>
 <20171124065623.GD13184@leoy-linaro>
 <b62517be-1d4d-7b2e-7a6e-1c2abbb4ecee@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b62517be-1d4d-7b2e-7a6e-1c2abbb4ecee-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

On Fri, Nov 24, 2017 at 02:39:47PM +0000, Sudeep Holla wrote:

[...]

> > Come back to recommended state id, I reviewed Juno board defintion and
> > I found it's not align with PSCI spec defintion, in ARM-TF Juno code
> > defines state as below [1]:
> > 
> 
> Yes Juno is almost 4 years old now, so it may not be too good a
> reference platform for latest and greatest platforms like hikey2 ;)
> As I said, Juno predates the recommendation in the PSCI spec.
> 
> > #define ARM_LOCAL_STATE_RUN     0
> > #define ARM_LOCAL_STATE_RET     1
> > #define ARM_LOCAL_STATE_OFF     2
> > 
> > In PSCI spec chapter "6.5 Recommended StateID Encoding" recommends power
> > state id as below:
> > 
> > 0: Run
> > 1: Standby
> > 2: Retention
> > 3: Powerdown
> > 
> > So could you confirm on Hikey960 we should follow PSCI definition for
> > state id definition?
> > 
> 
> Yes, I don't see any reason not to, as this may become reference to some
> other platform, it's good to keep it aligned so that copy paste happens
> in a good sense for future platforms. :)

Thanks for upper confirmation.

> >> Juno's implementation is legacy as these recommendations were added
> >> later in the specification while Juno is 3 year old platform now.
> >>
> >> Though strictly speaking it's not violation of the PSCI specification,
> >> but I would rather get this fixed not before it's too late and copied to
> >> the next generation of platforms. Since the firmware can be easily
> >> upgraded that shouldn't be that difficult.
> > 
> > If completely compliant with PSCI recommended state id, we need change
> > both for ARM-TF and kernel for this. In ARM-TF, I have sent PR [2].
> > 
> 
> OK
> 
> > For the kernel patch, we should change state id as below. Please let me
> > know if you have suggestion for this.
> > 
> 
> I would wait until ATF changes are merged before you patch DT in the kernel.

Agree, will sent new version patch after ATF patch merging ahead.

Thank you for suggestions.
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

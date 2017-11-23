From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Hi3660: Fix state id for 'CPU_NAP' state
Date: Thu, 23 Nov 2017 14:03:51 +0000
Message-ID: <17639ecc-8ff8-e118-f6e1-51e2cfe4342b@arm.com>
References: <1511415614-9859-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511415614-9859-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Thanks a lot for pointing me to this and having some useful discussion
in private. That helped to dig a bit further on this.

On 23/11/17 05:40, Leo Yan wrote:
> Thanks a lot for Vincent Guittot careful work to find bug for 'CPU_NAP'
> idle state. From ftrace log we can observe CA73 CPUs can be easily waken
> up from 'CPU_NAP' state but the 'waken up' CPUs doesn't handle anything
> and sleep again; so there have tons of trace events for CA73 CPUs
> entering and exiting idle state.
> 
> On Hi3660 CA73 has retention state 'CPU_NAP' for CPU idle, this state we
> set its psci parameter as '0x0000001' and from this parameter it can
> calculate state id is 1. Unfortunately ARM trusted firmware (ARM-TF)
> takes 1 as a invalid value for state id, so the CPU cannot enter idle
> state and directly bail out to kernel.
> 
> This commit changes psci parameter to '0x00000000' for state id = 0;
> this id is accepted by ARM trusted firmware and finally CPU can stay
> properly in 'CPU_NAP' state.
> 

I would like to conditionally NACK this patch. If we can't update the
ARM TF at all then, I will agree with this change reluctantly.

This looks like an artifact of copy paste in ARM TF port for this
platform. If you look as PSCI specification, CPU suspend parameter has
some recommendations and it's good to follow then unless you have strong
reasons not to.

As Daniel pointed to me, this patch is required to satisfy TF
particularly [1]. Now that looks like copy pasted from Juno or FVP port
and if you look deeper, it's clearly under !ARM_RECOM_STATE_ID_ENC [2]
which was not copied IIUC :).

Juno's implementation is legacy as these recommendations were added
later in the specification while Juno is 3 year old platform now.

Though strictly speaking it's not violation of the PSCI specification,
but I would rather get this fixed not before it's too late and copied to
the next generation of platforms. Since the firmware can be easily
upgraded that shouldn't be that difficult.

-- 
Regards,
Sudeep

[1]
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/hisilicon/hikey960/hikey960_pm.c#L156
[2]
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/arm/common/arm_pm.c#L28
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Thu, 30 Mar 2017 16:47:59 +0100
Message-ID: <b3bed726-921c-0f5c-8b51-2beaa19921c9@arm.com>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <20170328165010.GA21937@linaro.org> <20170329015423.GA5035@leoy-linaro>
 <CAJ9a7VhQRuVOCJkjPc9RANGo=fgA8wjtB65dC5f19ZX22a5FHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJ9a7VhQRuVOCJkjPc9RANGo=fgA8wjtB65dC5f19ZX22a5FHQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, Suzuki K. Poulos
List-Id: devicetree@vger.kernel.org



On 29/03/17 15:56, Mike Leach wrote:

[...]
> 
> No - EDPRCR_COREPURQ and EDPRCR_CORENPDRQ have different semantics and purposes
> 
> EDPRCR_COREPURQ is in the debug power domain an is tied to an external
> debug request that should be an input to the external (to the PE)
> system power controller.
> The requirement is that the system power controller powers up the core
> domain and does not power it down while it remains asserted.
> 
> EDPRCR_CORENPDRQ is in the core power domain and thus to the specific
> core only. This ensures that any power control software running on
> that core should emulate a power down if this is set to one.
> 
> We cannot know the power control design of the system, so the safe
> solution is to set both bits.
> 

+1

I agree that's the safe bet.

-- 
Regards,
Sudeep

Return-Path: <SRS0=UYfu=L4=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH v2 0/3] Add R-Car gen3 SoC support to the CMT driver
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4283320b-2f6f-0b77-a8d8-734f6540bc49@linaro.org>
Date: Fri, 14 Sep 2018 16:34:14 +0200
MIME-Version: 1.0
In-Reply-To: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 12/09/2018 22:10, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 3 patches against the 'tip.git' repo's 'timers/core' branch
> plus the CMT driver fixups for the 32/64-bit machines posted recently. We're
> adding support for the CMT types0/1 found in the R-Car gen3 SoCs.
> 
> [1/3] clocksource: sh_cmt: properly line-wrap sh_cmt_of_table[] initializer
> [2/3] dt-bindings: timer: renesas: cmt: document R-Car gen3 support
> [3/3] clocksource: sh_cmt: add R-Car gen3 support

Applied for 4.20, thanks.

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

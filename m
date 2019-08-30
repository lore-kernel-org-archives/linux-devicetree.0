From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 0/5] dt-bindings: arm: idle-states: Miscellaneous
 improvements
Date: Fri, 30 Aug 2019 23:41:06 +0200
Message-ID: <a94a768b-f71c-959b-243a-06ab4d5f297c@linaro.org>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30/08/2019 17:02, Geert Uytterhoeven wrote:
>   - Replace abbreviations "eg" and "ie" by "e.g." resp. "i.e.",
>   - Correct references to wake-up delay,
>   - Correct "constraints guarantees" to "constraint guarantees",
>   - Add punctuation marks to improve readability,
>   - Move exit-latency-us explanation to exit-latency-us section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> Split to ease review.
> Feel free to squash into a single commit.
> 
> Geert Uytterhoeven (5):
>   dt-bindings: arm: idle-states: Use "e.g." and "i.e." consistently
>   dt-bindings: arm: idle-states: Correct references to wake-up delay
>   dt-bindings: arm: idle-states: Correct "constraint guarantees"
>   dt-bindings: arm: idle-states: Add punctuation to improve readability
>   dt-bindings: arm: idle-states: Move exit-latency-us explanation
> 
>  .../devicetree/bindings/arm/idle-states.txt   | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

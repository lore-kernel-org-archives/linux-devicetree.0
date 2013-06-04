From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH RFC 3/3] clk: dt: binding for basic divider clock
Date: Tue, 04 Jun 2013 10:11:23 -0700
Message-ID: <51AE1FBB.1070806@codeaurora.org>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org> <1370281990-15090-4-git-send-email-mturquette@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370281990-15090-4-git-send-email-mturquette@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/03/13 10:53, Mike Turquette wrote:
> +Required properties:
> +- compatible : shall be "divider-clock".
> +- #clock-cells : from common clock binding; shall be set to 0.
> +- clocks : link to phandle of parent clock
> +- reg : base address for register controlling adjustable divider
> +- mask : arbitrary bitmask for programming the adjustable divider
> +
> +Optional properties:
> +- clock-output-names : From common clock binding.
> +- table : array of integer pairs defining divisors & bitfield values
> +- shift : number of bits to shift the mask, defaults to 0 if not present
> +- index_one : valid divisor programming starts at 1, not zero
> +- index_power_of_two : valid divisor programming must be a power of two
> +- allow_zero : implies index_one, and programming zero results in
> +  divide-by-one

It's preferred that property names have dashes instead of underscores.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 1/9] coresight: bindings for CPU debug module
Date: Fri, 31 Mar 2017 10:04:49 +0100
Message-ID: <516de455-796f-8243-7bfa-e8ff104e1945@arm.com>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-2-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490466197-29163-2-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, sudeep.ho
List-Id: devicetree@vger.kernel.org

On 25/03/17 18:23, Leo Yan wrote:
> According to ARMv8 architecture reference manual (ARM DDI 0487A.k)
> Chapter 'Part H: External debug', the CPU can integrate debug module
> and it can support self-hosted debug and external debug. Especially
> for supporting self-hosted debug, this means the program can access
> the debug module from mmio region; and usually the mmio region is
> integrated with coresight.
>
> So add document for binding debug component, includes binding to APB
> clock; and also need specify the CPU node which the debug module is
> dedicated to specific CPU.
>
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

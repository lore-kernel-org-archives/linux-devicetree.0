From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH] ARM: dts: qcom: Add RNG device tree node
Date: Wed, 12 Feb 2014 11:28:21 +0200
Message-ID: <52FB3EB5.4020207@mm-sol.com>
References: <1391764987-17138-1-git-send-email-svarbanov@mm-sol.com> <20140208033740.GD10784@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140208033740.GD10784@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Brown <davidb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi, Stephen

On 02/08/2014 05:37 AM, Stephen Boyd wrote:
> On 02/07, Stanimir Varbanov wrote:
>> Add the necessary DT node to probe the rng driver on
>> msm8974 platforms.
>>
> 
> Looks good. We should add it to msm8960-cdp and enable the driver
> in the defconfig as well.

Sure, I can prepare a patch. Unfortunately I haven't msm8960 CDP to test it.

> 
>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> 

Thanks!

regards,
Stan

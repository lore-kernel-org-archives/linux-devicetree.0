From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCHv4 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Mon, 23 Jan 2017 15:53:47 -0800
Message-ID: <bf402123-52f5-51ee-32df-276ed7a7e832@codeaurora.org>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-2-chris.packham@alliedtelesis.co.nz>
 <20170121004819.GA8801@codeaurora.org>
 <be295fd327674a2ca91437456db7a047@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be295fd327674a2ca91437456db7a047@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/22/2017 11:53 PM, Chris Packham wrote:
> Not 100% sure what you mean. Something like this?
>
> +static void __init of_mv98dx3236_cpu_clk_setup(struct device_node *node)
> +{
> +       of_clk_add_provider(node, of_clk_src_simple_get, NULL);
> +}
>
> Seems to work as expected (i.e. does nothing, kernel boots/runs).
>

Yep that's what I mean.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

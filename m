From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 2/5] ARC: AXS103: Get rid of platform specific cpu clock
 configuration
Date: Tue, 22 Aug 2017 13:39:04 -0700
Message-ID: <0a4209a9-bf2e-c8a4-31b0-c08043d5e168@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
 <20170814161213.17522-3-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814161213.17522-3-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/14/2017 09:12 AM, Eugeniy Paltsev wrote:
> We set AXS103 cpu frequency in arch/arc/plat-axs10x/axs10x.c
> via direct writing to pll registers for historical reasons.
> So get rid of AXS103 platform specific cpu clock configuration as
> we have driver for AXS103 core pll (AXS103 pll driver is already
> in linux-next. It is selected automatically when
> CONFIG_ARC_PLAT_AXS10X is set)
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>   arch/arc/plat-axs10x/axs10x.c | 88 ++-----------------------------------------
>   1 file changed, 4 insertions(+), 84 deletions(-)
>
> diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
> index 38ff349..98d07b7 100644
> --- a/arch/arc/plat-axs10x/axs10x.c
> +++ b/arch/arc/plat-axs10x/axs10x.c
> @@ -335,61 +335,12 @@ union pll_reg {
>   	unsigned int val;
>   };

You forget to prune a bunch of code not needed anymore - pll_reg struct /  
write_cgu_reg ....
I've fixed that up locally !

Nice cleanup !

Thx,
-Vineet

From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/8] arm64: mm: mark fault_info __ro_after_init
Date: Wed, 29 Mar 2017 12:23:26 +0100
Message-ID: <20170329112326.GE23442@leverpostej>
References: <20170328213431.10904-1-opendmb@gmail.com>
 <20170328213431.10904-3-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170328213431.10904-3-opendmb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Berger <opendmb@gmail.com>
Cc: wangkefeng.wang@huawei.com, catalin.marinas@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, mingo@kernel.org, f.fainelli@gmail.com, jonathanh@nvidia.com, bgolaszewski@baylibre.com, bcm-kernel-feedback-list@broadcom.com, shijie.huang@arm.com, treding@nvidia.com, devicetree@vger.kernel.org, suzuki.poulose@arm.com, robh+dt@kernel.org, gregory.0xf0@gmail.com, sandeepa.s.prabhu@gmail.com, linux-arm-kernel@lists.infradead.org, mirza.krak@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com, olof@lixom.net, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 02:34:25PM -0700, Doug Berger wrote:
> The fault_info table must be made writeable to allow installation
> of custom memory abort handlers, but it can be made read-only
> after initialization to provide some protection.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Thanks for putting this together. I agree that making this RO is good.

However, I also think that we should not allow arbitrary hooking of
fault codes, and thus this can be const.

Thanks,
Mark.

> ---
>  arch/arm64/mm/fault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index cdf1260f1005..43319ed58a47 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -493,7 +493,7 @@ static struct fault_info {
>  	int	sig;
>  	int	code;
>  	const char *name;
> -} fault_info[] = {
> +} fault_info[] __ro_after_init = {
>  	{ do_bad,		SIGBUS,  0,		"ttbr address size fault"	},
>  	{ do_bad,		SIGBUS,  0,		"level 1 address size fault"	},
>  	{ do_bad,		SIGBUS,  0,		"level 2 address size fault"	},
> -- 
> 2.12.0
> 

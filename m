From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts
 files
Date: Fri, 11 Dec 2015 10:10:14 +0000
Message-ID: <566AA106.2050404@arm.com>
References: <1449790703-12054-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449790703-12054-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Barry Song <baohua@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Santosh Shilimkar <ssantosh@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
List-Id: devicetree@vger.kernel.org



On 10/12/15 23:38, Rob Herring wrote:
> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   MAINTAINERS | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69c8a9c..415b731 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

[...]

> @@ -1680,7 +1694,7 @@ M:	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	arch/arm/boot/dts/vexpress*
> -F:	arch/arm64/boot/dts/arm/vexpress*
> +F:	arch/arm64/boot/dts/arm/
>   F:	arch/arm/mach-vexpress/
>   F:	*/*/vexpress*
>   F:	*/*/*/vexpress*

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts
 files
Date: Fri, 11 Dec 2015 08:51:38 -0600
Message-ID: <alpine.DEB.2.02.1512110849540.27904@linux-builds1>
References: <1449790703-12054-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449790703-12054-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Santosh Shilimkar <ssantosh@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Shir
List-Id: devicetree@vger.kernel.org

On Thu, 10 Dec 2015, Rob Herring wrote:

> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
[...] 
> @@ -1536,6 +1549,7 @@ S:	Maintained
>  F:	arch/arm/mach-socfpga/
>  F:	arch/arm/boot/dts/socfpga*
>  F:	arch/arm/configs/socfpga_defconfig
> +F:	arch/arm64/boot/dts/altera/
>  W:	http://www.rocketboards.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Thanks,
Dinh

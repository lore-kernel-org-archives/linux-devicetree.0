From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts
 files
Date: Fri, 11 Dec 2015 00:17:16 -0600
Message-ID: <20151211061716.GA11957@Agamemnon.attlocal.net>
References: <1449790703-12054-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449790703-12054-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Santosh Shilimkar <ssantosh@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Viresh
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 05:38:23PM -0600, Rob Herring wrote:
> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

<snip>

>  ARM/Marvell Dove/MV78xx0/Orion SOC support
> @@ -1406,7 +1415,9 @@ M:	David Brown <davidb@codeaurora.org>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	linux-soc@vger.kernel.org
>  S:	Maintained
> +F:	arch/arm/boot/dts/qcom-*
>  F:	arch/arm/mach-qcom/
> +F:	arch/arm64/boot/dts/qcom/*
>  F:	drivers/soc/qcom/
>  F:	drivers/tty/serial/msm_serial.h
>  F:	drivers/tty/serial/msm_serial.c

<snip>

for QCOM,

Acked-by: Andy Gross <agross@codeaurora.org>

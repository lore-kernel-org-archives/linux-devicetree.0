From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts files
Date: Fri, 11 Dec 2015 06:50:12 +0100
Message-ID: <87vb85ilez.fsf@belgarion.home>
References: <1449790703-12054-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449790703-12054-1-git-send-email-robh@kernel.org> (Rob
	Herring's message of "Thu, 10 Dec 2015 17:38:23 -0600")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Santosh Shilimkar <ssantosh@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS | 20 +++++++++++++++++++-
...
> @@ -8627,6 +8642,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  T:	git git://github.com/hzhuang1/linux.git
>  T:	git git://github.com/rjarzmik/linux.git
>  S:	Maintained
> +F:	arch/arm/boot/dts/pxa*
>  F:	arch/arm/mach-pxa/
>  F:	drivers/dma/pxa*
>  F:	drivers/pcmcia/pxa2xx*

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert

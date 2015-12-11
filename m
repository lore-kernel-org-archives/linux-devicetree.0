From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add missing platform maintainers for dts
 files
Date: Fri, 11 Dec 2015 07:13:44 +0530
Message-ID: <20151211014344.GG3612@ubuntu>
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

On 10-12-15, 17:38, Rob Herring wrote:
> Platform dts files need to be reviewed primarily by the platform
> maintainers as dts files typically go in thru their trees. Add the missing
> paths where there are existing maintainers listed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> @@ -10068,6 +10085,7 @@ L:	spear-devel@list.st.com
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  W:	http://www.st.com/spear
>  S:	Maintained
> +F:	arch/arm/boot/dts/spear*
>  F:	arch/arm/mach-spear/
>  
>  SPEAR CLOCK FRAMEWORK SUPPORT

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

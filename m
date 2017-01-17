From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: juno: add missing CoreSight STM
 component
Date: Tue, 17 Jan 2017 13:39:19 +0000
Message-ID: <5c742b98-0707-67fd-d8a1-467f34d99cdb@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
 <1484655313-9025-5-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484655313-9025-5-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, Liviu Dudau <liviu.dudau@arm.com>, Olof Johansson <olof@lixom.net>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On 17/01/17 12:15, Sudeep Holla wrote:
> From: Mike Leach <mike.leach@linaro.org>
>
> This patch adds the missing CoreSight STM component definition to the
> device tree of all the juno variants(r0,r1,r2)
>
> STM component is connected to different funnels depending on Juno
> platform variant.
>
> Reviewed-and-Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> [sudeep.holla@arm.com: minor changelog update and reorganising the STM
> 	node back into juno-base.dtsi to avoid duplication]
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 15 +++++++++++++++
>  arch/arm64/boot/dts/arm/juno-r1.dts    |  4 ++++
>  arch/arm64/boot/dts/arm/juno-r2.dts    |  4 ++++
>  arch/arm64/boot/dts/arm/juno.dts       | 16 ++++++++++++++++
>  4 files changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index faedf357db3b..58c1773c3aa4 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -185,6 +185,21 @@
>  		};
>  	};
>
> +	stm@20100000 {
> +		compatible = "arm,coresight-stm", "arm,primecell";
> +		reg = <0 0x20100000 0 0x1000>,
> +		      <0 0x28000000 0 0x180000>;

The size of the stimulus base is 16MB (as per TRM), implies => 0x1000000.

with that fixed :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

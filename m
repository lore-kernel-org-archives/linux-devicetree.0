From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH 12/12] soc: qcom: ipa: build and "ipa_i.h"
Date: Tue, 6 Nov 2018 16:40:20 -0800
Message-ID: <cebe0d3c-4a24-60a4-88c8-5195a5d0da4b@infradead.org>
References: <20181107003250.5832-1-elder@linaro.org>
 <20181107003250.5832-13-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181107003250.5832-13-elder@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Elder <elder@linaro.org>, davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, syadagir@codeaurora.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, mjavid@codeaurora.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi-

On 11/6/18 4:32 PM, Alex Elder wrote:
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> new file mode 100644
> index 000000000000..f8ea9363f532
> --- /dev/null
> +++ b/drivers/net/ipa/Kconfig
> @@ -0,0 +1,30 @@
> +config IPA
> +	tristate "Qualcomm IPA support"
> +	depends on NET
> +	select QCOM_QMI_HELPERS
> +	select QCOM_MDT_LOADER
> +	default n
> +	help
> +	  Choose Y here to include support for the Qualcomm IP
> +	  Accelerator (IPA), a hardware block present in some
> +	  Qualcomm SoCs.  The IPA is a programmable protocol
> +	  processor that is capable of generic hardware handling
> +	  of IP packets, including routing, filtering, and NAT.
> +	  Currently the IPA driver supports only basic transport
> +	  of network traffic between the AP and modem, on the
> +	  Qualcomm SDM845 SoC.
> +
> +	  If unsure, say N.
> +
> +config IPA_ASSERT
> +	bool "Enable IPA assertions"
> +	depends on IPA
> +	default y
> +	help
> +	 Incorporate IPA assertion verification in the build.  This
> +	 cause various design assumptions to be checked at runtime,

	 causes

> +	 generating a report (and a crash) if any assumed condition
> +	 does not hold.  You may wish to disable this to avoid the
> +	 overhead of checking.
> +
> +	 If unsure doubt, say "Y" here.


-- 
~Randy

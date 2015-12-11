From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Fri, 11 Dec 2015 10:37:05 -0600
Message-ID: <20151211163705.GA6298@rob-hp-laptop>
References: <1449819921-18464-1-git-send-email-xuejiancheng@huawei.com>
 <1449819921-18464-7-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449819921-18464-7-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 03:45:20PM +0800, Jiancheng Xue wrote:
> Add device tree bindings for Hi3519 system controller.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/mfd/hi3519.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hi3519.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hi3519.txt b/Documentation/devicetree/bindings/mfd/hi3519.txt
> new file mode 100644
> index 0000000..4b1c294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hi3519.txt
> @@ -0,0 +1,14 @@
> +* Hisilicon Hi3519 System Controller Block
> +
> +This bindings use the following binding:
> +Dcumentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: "hislicon,hi3519-sysctrl".
> +- reg: the register region of this block
> +
> +Examples:
> +sysctrl: system-controller@12010000 {
> +	compatible = "hisilicon,hi3519-sysctrl", "syscon";
> +	reg = <0x12010000 0x1000>;
> +};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 4/6] ARM: debug: add hi3519 debug uart
Date: Fri, 8 Jan 2016 15:08:28 +0000
Message-ID: <20160108150828.GM19062@n2100.arm.linux.org.uk>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-5-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452219400-32478-5-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 10:16:38AM +0800, Jiancheng Xue wrote:
> @@ -1449,6 +1457,7 @@ config DEBUG_UART_PHYS
>  	default 0xf7fc9000 if DEBUG_BERLIN_UART
>  	default 0xf8b00000 if DEBUG_HIX5HD2_UART
>  	default 0xf991e000 if DEBUG_QCOM_UARTDM
> +	default 0x12100000 if DEBUG_HI3519_UART
>  	default 0xfcb00000 if DEBUG_HI3620_UART
>  	default 0xfd883000 if DEBUG_ALPINE_UART0
>  	default 0xfe800000 if ARCH_IOP32X

Please insert at the appropriate location - examination of the list
of defaults will show that it's sorted numerically, please keep this
sorted numerically.

> @@ -1529,6 +1538,7 @@ config DEBUG_UART_VIRT
>  	default 0xfe230000 if DEBUG_PICOXCELL_UART
>  	default 0xfe300000 if DEBUG_BCM_KONA_UART
>  	default 0xfe800000 if ARCH_IOP32X
> +	default 0xfef00000 if DEBUG_HI3519_UART
>  	default 0xfeb00000 if DEBUG_HI3620_UART || DEBUG_HIX5HD2_UART
>  	default 0xfeb24000 if DEBUG_RK3X_UART0
>  	default 0xfeb26000 if DEBUG_RK3X_UART1

Same for here.

Thanks.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

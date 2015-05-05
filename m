From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Tue, 5 May 2015 18:13:49 +0100
Message-ID: <20150505171349.GA30215@leverpostej>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "heyunlei@huawei.com" <heyunlei@huawei.com>, puc
List-Id: devicetree@vger.kernel.org

Hi,

> +/*Reserved 1MB memory for MCU*/
> +/memreserve/ 0x05e00000 0x00100000;

What exactly is the MCU used for, and what does it use this memory for?

Can this be carved out from the memory node instead? If the OS doesn't
need to access this memory to communicate with the MCU, preventing the
OS from mapping the memory avoids a number of potential issues.

I take it that with UEFI this region is not described to the OS?

[...]

> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};

Are all the PSCI 0.2 mandatory features implemented?

Can CPU0 be hot unplugged?

[...]

> +		uart0: uart@f8015000 {	/* console */
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0xf8015000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ao_ctrl HI6220_UART0_PCLK>, <&ao_ctrl HI6220_UART0_PCLK>;
> +			clock-names = "uartclk", "apb_pclk";
> +		};

In a previous discussion [1] the UART on HI6220 was described as not
fully PL011 compliant, with a number of differences (e.g. the FIFO
length).

Given that, I feel somewhat uncomfortable with the current compatible
string list. What exactly are those differences? We may need a more
specific compatible string (even if in addition to those existing ones),
or perhaps other properties.

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/328978.html

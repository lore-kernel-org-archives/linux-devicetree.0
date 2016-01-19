From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 5/6] ARM: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Tue, 19 Jan 2016 12:13:49 -0600
Message-ID: <20160119181349.GA9747@rob-hp-laptop>
References: <1453171111-21921-1-git-send-email-xuejiancheng@huawei.com>
 <1453171111-21921-6-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453171111-21921-6-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 19, 2016 at 10:38:30AM +0800, Jiancheng Xue wrote:
> Add device tree bindings for Hi3519 system controller.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt

Sorry to keep telling you different places, but I'd rather try to 
collect these in a common location (perhaps bindings/sysctrl). 
Leaving it here is fine for now. If you respin the series then please 
move it. Either way:

Acked-by: Rob Herring <robh@kernel.org>


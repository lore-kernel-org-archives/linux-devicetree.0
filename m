From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/6] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
Date: Fri, 8 Jan 2016 15:04:57 -0600
Message-ID: <20160108210457.GA24079@rob-hp-laptop>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-6-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452219400-32478-6-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 10:16:39AM +0800, Jiancheng Xue wrote:
> Add device tree bindings for Hi3519 system controller.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  Documentation/devicetree/bindings/mfd/hi3519.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hi3519.txt

This seems like it could be combined with other HiSi system controller 
bindings if the compatible string is the only difference. But it is fine 
like this:

Acked-by: Rob Herring <robh@kernel.org>

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] clk: hisilicon: add CRG driver for hi3519 soc
Date: Thu, 31 Dec 2015 16:29:46 -0600
Message-ID: <20151231222946.GA21265@rob-hp-laptop>
References: <1451439832-13927-1-git-send-email-xuejiancheng@huawei.com>
 <1451439832-13927-2-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1451439832-13927-2-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 09:43:47AM +0800, Jiancheng Xue wrote:
> The CRG(Clock and Reset Generator) block provides clock
> and reset signals for other modules in hi3519 soc.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  .../devicetree/bindings/clock/hi3519-crg.txt       |  46 +++++++

For the binding:

Acked-by: Rob Herring <robh@kernel.org>

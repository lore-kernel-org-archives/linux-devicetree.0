From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: hisilicon: add CRG driver Hi3521A SoC
Date: Tue, 24 Oct 2017 13:42:50 -0500
Message-ID: <20171024184250.d4wmzr6osd4o53oz@rob-hp-laptop>
References: <20171017223854.6980-1-hanetzer@startmail.com>
 <20171017223854.6980-2-hanetzer@startmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20171017223854.6980-2-hanetzer@startmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, linux@armlinux.org.uk, xuejiancheng@hisilicon.com, zhangfei.gao@linaro.org, wnpan@hisilicon.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 05:38:52PM -0500, Marty E. Plummer wrote:
> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.
> 
> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> ---
> Changes in v2:
>   - Switched to SPDX tags and GPL-2.0+
> 
>  drivers/clk/hisilicon/Kconfig             |   7 ++
>  drivers/clk/hisilicon/Makefile            |   1 +
>  drivers/clk/hisilicon/crg-hi3521a.c       | 196 ++++++++++++++++++++++++++++++

>  include/dt-bindings/clock/hi3521a-clock.h |  23 ++++

Acked-by: Rob Herring <robh@kernel.org>

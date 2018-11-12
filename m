From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: mediatek: add clock support for MT7629 SoC
Date: Mon, 12 Nov 2018 11:21:07 -0600
Message-ID: <5bea0ea7.1c69fb81.7820a.2044@mx.google.com>
References: <815e38d4d74689980cd73c86d9e80fd5854cfc94.1541143168.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <815e38d4d74689980cd73c86d9e80fd5854cfc94.1541143168.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: devicetree@vger.kernel.org, Wenzhen Yu <wenzhen.yu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-kernel@vger.kernel.org, Roy Luo <cheng-hao.luo@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 04:43:55PM +0800, Ryder Lee wrote:
> Add all supported clocks exported from every susbystem found on MT7629 SoC.
> 
> Signed-off-by: Wenzhen Yu <wenzhen.yu@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |  23 ++
>  drivers/clk/mediatek/Makefile          |   3 +
>  drivers/clk/mediatek/clk-mt7629-eth.c  | 159 ++++++++
>  drivers/clk/mediatek/clk-mt7629-hif.c  | 156 +++++++
>  drivers/clk/mediatek/clk-mt7629.c      | 723 +++++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/mt7629-clk.h | 203 +++++++++

Acked-by: Rob Herring <robh@kernel.org>

In the future, the header goes with the binding patch.

>  6 files changed, 1267 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt7629-eth.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7629-hif.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7629.c
>  create mode 100644 include/dt-bindings/clock/mt7629-clk.h

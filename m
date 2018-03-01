From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: update MT2712 power dt-bindings
Date: Thu, 1 Mar 2018 16:41:51 -0600
Message-ID: <20180301224151.bl3syre32pqfcsls@rob-hp-laptop>
References: <20180222054851.26096-1-weiyi.lu@mediatek.com>
 <20180222054851.26096-3-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180222054851.26096-3-weiyi.lu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 22, 2018 at 01:48:47PM +0800, Weiyi Lu wrote:
> Add new power domains(MFG_SC1/MFG_SC2/MFG_SC3)
> for MT2712 according to ECO design change.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  include/dt-bindings/power/mt2712-power.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

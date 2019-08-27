From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Date: Tue, 27 Aug 2019 12:04:48 -0500
Message-ID: <20190827170448.GA15803@bogus>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Aug 2019 07:13:15 -0400, Dong Aisheng wrote:
> There's a few limitations on the original one cell clock binding
> (#clock-cells = <1>) that we have to define some SW clock IDs for device
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
> 
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
> 
> For such situation, we want to eliminate the using of SW Clock IDs and
> change to use a more close to HW one instead.
> For SCU clocks usage, only two params required: Resource id + Clock Type.
> Both parameters are platform independent. So we could use two cells binding
> to pass those parameters,
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v3->v4:
>  * add some comments for various clock types
> v2->v3:
>  * Changed to two cells binding and register all clocks in driver
>    instead of parse from device tree.
> v1->v2:
>  * changed to one cell binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>    Resource ID is encoded in 'reg' property.
>    Clock type is encoded in generic clock-indices property.
>    Then we don't have to search all the DT nodes to fetch
>    those two value to construct clocks which is relatively
>    low efficiency.
>  * Add required power-domain property as well.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 12 ++++++-----
>  include/dt-bindings/firmware/imx/rsrc.h            | 23 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

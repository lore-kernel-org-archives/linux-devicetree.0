From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: ls1088a: Add qspi device node for
 ls1088a-rdb
Date: Mon, 5 Feb 2018 00:08:28 -0600
Message-ID: <20180205060828.ubp67qmtn7m3b247@rob-hp-laptop>
References: <1517373888-4716-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1517373888-4716-1-git-send-email-yogeshnarayan.gaur@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, festevam@gmail.com, prabhakar.kushwaha@nxp.com, linux-mtd@lists.infradead.org, suresh.gupta@nxp.com, cyrille.pitchen@wedev4u.fr, han.xu@nxp.com, computersforpeace@gmail.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 10:14:48AM +0530, Yogesh Gaur wrote:
> Add nodes and properties for QSPI controller.
> Add support for spansion flash, s25fs512s, as slave device for
> QSPI controller.
> 
> Added entry of "fsl,ls1088a-qspi" in fsl-quadspi.txt binding file.
> 
> Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Depends on
>  https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084
> 
> Changes for v3:
> - Add compatible string for slave nodes.
> Changes for v2:
> - Move property spi-rx-bus-width and spi-tx-bus-width from controller
>   to connected slave device node.
> 
>  .../devicetree/bindings/mtd/fsl-quadspi.txt        |  1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  | 25 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 12 +++++++++++
>  3 files changed, 38 insertions(+)

Really the binding should be a separate patch, but no need to respin 
just for that.

Reviewed-by: Rob Herring <robh@kernel.org>

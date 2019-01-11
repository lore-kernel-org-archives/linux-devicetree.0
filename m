From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv4 1/4] dt-bindings: add DT binding for the layerscape
 PCIe controller with EP mode
Date: Fri, 11 Jan 2019 08:31:23 -0600
Message-ID: <20190111143123.GA6960@bogus>
References: <20190108030922.24031-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190108030922.24031-1-xiaowei.bao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, kstewart@linuxfoundation.org, linux-pci@vger.kernel.org, shawn.lin@rock-chips.com, minghuan.Lian@nxp.com, lorenzo.pieralisi@arm.com, kishon@ti.com, mingkai.hu@nxp.com, niklas.cassel@axis.com, devicetree@vger.kernel.org, arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org, cyrille.pitchen@free-electrons.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, roy.zang@nxp.com, Xiaowei Bao <xiaowei.bao@nxp.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, pombredanne@nexb.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  8 Jan 2019 11:09:19 +0800, Xiaowei Bao wrote:
> Add the documentation for the Device Tree binding for the layerscape PCIe
> controller with EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Add the SoC specific compatibles.
> v3:
>  - modify the commit message.
> v4:
>  - no change.
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt     |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

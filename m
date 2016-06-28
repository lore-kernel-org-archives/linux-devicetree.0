From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/6] Documentation: dt: mtd: gpmi: document the clocks
 and clock-names in DT property
Date: Tue, 28 Jun 2016 15:55:51 -0500
Message-ID: <20160628205551.GI3737@rob-hp-laptop>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
 <1466804411-19874-3-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1466804411-19874-3-git-send-email-han.xu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Han Xu <han.xu@nxp.com>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, richard@nod.at, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, galak@codeaurora.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 04:40:07PM -0500, Han Xu wrote:
> add the clocks and clock-names in DT property, gpmi-io clock is
> mandatory for all platforms, but some platforms, such as i.MX6Q may
> need more extra clocks for submodules. More details please refer to the
> SoC reference manual.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> index d02acaf..a2fd034 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -13,6 +13,13 @@ Required properties:
>      and GPMI DMA channel ID.
>      Refer to dma.txt and fsl-mxs-dma.txt for details.
>    - dma-names: Must be "rx-tx".
> +  - clocks : The clocks needed by the gpmi controller. This field varies
> +    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
> +    need several extra clocks, such as i.MX6 series, which requires "gpmi_apb,
> +    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules, while i.MX7 only
> +    need gpmi_bch_apb. Please refer to the HW design manual.
> +  - clock-names : the name of the clocks, please refer to the HW design
> +    manual.

No please list the names here (I assume what is above?). Also need to 
specify the order of the clocks. It would be clearest if you list things 
by exact compatible strings.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

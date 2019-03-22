From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: interconnect: Add a dma interconnect
 name
Date: Fri, 22 Mar 2019 18:46:37 +0200
Message-ID: <c2e00120-e6e1-9a43-dd8d-3bd6725d2dff@linaro.org>
References: <cover.221220f2f28e14ef07cce84e753ac662085d84ff.1552595146.git-series.maxime.ripard@bootlin.com>
 <9512c3223c26c12b02376cf4ba4a74ca29de1132.1552595146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9512c3223c26c12b02376cf4ba4a74ca29de1132.1552595146.git-series.maxime.ripard@bootlin.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 3/14/19 22:26, Maxime Ripard wrote:
> The current DT bindings assume that the DMA will be performed by the
> devices through their parent DT node, and rely on that assumption for the
> address translation using dma-ranges.
> 
> However, some SoCs have devices that will perform DMA through another bus,
> with separate address translation rules. We therefore need to express that
> relationship, through the special interconnect name "dma".

s/dma/dma-mem/

> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

> ---
>  Documentation/devicetree/bindings/interconnect/interconnect.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> index 5a3c575b387a..6f5d23a605b7 100644
> --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
> +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> @@ -51,6 +51,10 @@ interconnect-names : List of interconnect path name strings sorted in the same
>  		     interconnect-names to match interconnect paths with interconnect
>  		     specifier pairs.
>  
> +                     Reserved interconnect names:
> +			 * dma-mem: Path from the device to the main memory of
> +			            the system
> +
>  Example:
>  
>  	sdhci@7864000 {
> 

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dmaengine: add DT binding for
 UniPhier MIO DMAC
Date: Tue, 28 Aug 2018 19:36:39 -0500
Message-ID: <20180829003639.GA24691@bogus>
References: <1535074873-15617-1-git-send-email-yamada.masahiro@socionext.com>
 <1535074873-15617-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1535074873-15617-2-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 Aug 2018 10:41:12 +0900, Masahiro Yamada wrote:
> The MIO DMAC (Media IO DMA Controller) is used in UniPhier LD4,
> Pro4, and sLD8 SoCs.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>  - Rename the node "dmac" to "dma-controller"
>  - Remove dma-channels property
> 
>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

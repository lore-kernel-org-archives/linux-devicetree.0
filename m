From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: stm32-dma: Fix typo regarding DMA
 client binding
Date: Tue, 13 Dec 2016 14:09:06 -0600
Message-ID: <20161213200906.zikhjnvivqrdpgqh@rob-hp-laptop>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
 <1481636451-27863-4-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1481636451-27863-4-git-send-email-cedric.madianga@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alexandre.torgue@st.com, vinod.koul@intel.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 02:40:45PM +0100, M'boumba Cedric Madianga wrote:
> Only four cells are required for dma client binding not five.
> 
> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> Reviewed-by: Ludovic BARRE <ludovic.barre@st.com>
> ---
>  Documentation/devicetree/bindings/dma/stm32-dma.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

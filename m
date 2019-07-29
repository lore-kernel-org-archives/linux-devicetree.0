From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: amlogic,vdec: add default
 compatible
Date: Mon, 29 Jul 2019 15:06:02 +0200
Message-ID: <b82bd2b5-9192-5ce8-eb97-8bde44c2d363@baylibre.com>
References: <20190726124639.7713-1-mjourdan@baylibre.com>
 <20190726124639.7713-2-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726124639.7713-2-mjourdan@baylibre.com>
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
To: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/07/2019 14:46, Maxime Jourdan wrote:
> The first version of the bindings is missing a generic compatible that
> is used by the base node (GX), and then extended by the SoC device trees
> (GXBB, GXL, GXM)
> 
> Also change the example to use "video-codec" instead of "video-decoder",
> as the former is the one used in almost all cases when it comes to video
> decode/encode accelerators.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,vdec.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
> index aabdd01bcf32..9b6aace86ca7 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,vdec.txt
> +++ b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
> @@ -26,6 +26,7 @@ Required properties:
>  	- GXBB (S905) : "amlogic,gxbb-vdec"
>  	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
>  	- GXM (S912) : "amlogic,gxm-vdec"
> +	followed by the common "amlogic,gx-vdec"
>  - reg: base address and size of he following memory-mapped regions :
>  	- dos
>  	- esparser
> @@ -47,8 +48,8 @@ Required properties:
>  
>  Example:
>  
> -vdec: video-decoder@c8820000 {
> -	compatible = "amlogic,gxbb-vdec";
> +vdec: video-codec@c8820000 {
> +	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
>  	reg = <0x0 0xc8820000 0x0 0x10000>,
>  	      <0x0 0xc110a580 0x0 0xe4>;
>  	reg-names = "dos", "esparser";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

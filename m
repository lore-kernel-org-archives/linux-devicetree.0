From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: add Meson8 and Meson8b
 support
Date: Sun, 7 May 2017 12:35:22 +0100
Message-ID: <56a48302-c7f1-65a0-95f9-22c7a1c21e8b@kernel.org>
References: <20170506134929.31190-1-martin.blumenstingl@googlemail.com>
 <20170506134929.31190-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170506134929.31190-3-martin.blumenstingl@googlemail.com>
Content-Language: en-GH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, thomas.langer@intel.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/05/17 14:49, Martin Blumenstingl wrote:
> The Amlogic Meson SAR ADC driver can be used on Meson8 and Meson8b
> (probably on earlier SoC generations as well, but I don't have any
> hardware available for testing that).
> Add a separate compatible for Meson8 and Meson8b because it does not
> need any of the BL30 magic (unlike the GX SoCs).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Rob Herring <robh@kernel.org>
Applied
> ---
>  Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
> index f9e3ff2c656e..08cee82e54c3 100644
> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt
> @@ -2,6 +2,8 @@
>  
>  Required properties:
>  - compatible:	depending on the SoC this should be one of:
> +			- "amlogic,meson8-saradc" for Meson8
> +			- "amlogic,meson8b-saradc" for Meson8b
>  			- "amlogic,meson-gxbb-saradc" for GXBB
>  			- "amlogic,meson-gxl-saradc" for GXL
>  			- "amlogic,meson-gxm-saradc" for GXM
> 

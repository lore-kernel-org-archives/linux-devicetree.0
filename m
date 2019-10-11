From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/10] ASoC: dt-bindings: cros_ec_codec:
 add SHM bindings
Date: Fri, 11 Oct 2019 10:13:54 -0500
Message-ID: <20191011151354.GA12997@bogus>
References: <20191005085509.187179-1-tzungbi@google.com>
 <20191005164320.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191005164320.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, drinkcat@google.com, broonie@kernel.org, enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
List-Id: devicetree@vger.kernel.org

On Sat, Oct 05, 2019 at 04:55:05PM +0800, Tzung-Bi Shih wrote:
> - Add "ec-shm" for binding to shared memory exposed by EC.
> - Add "memory-region" for binding to memory region shared by AP.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> index 0ce9fafc78e2..cb46bc082b4b 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> @@ -10,8 +10,26 @@ Required properties:
>  - compatible: Must contain "google,cros-ec-codec"
>  - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
>  
> +Optional properties:
> +- ec-shm: Shared memory region from EC.  It contains 3 unsigned 32-bit
> +          integer.  The first 2 integers combine to become an unsigned
> +	  64-bit address.  The last one integer is length of the shared
> +	  memory.

This is an address accessible to the main CPU? If so, then it really 
should be using 'reg' and be translatable.

> +- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
> +                 ../reserved-memory/reserved-memory.txt for details.
> +
>  Example:
>  
> +{
> +	...
> +
> +	reserved_mem: reserved_mem {
> +		compatible = "shared-dma-pool";
> +		reg = <0 0x52800000 0 0x100000>;
> +		no-map;
> +	};
> +}
> +
>  cros-ec@0 {
>  	compatible = "google,cros-ec-spi";
>  
> @@ -20,5 +38,7 @@ cros-ec@0 {
>  	cros_ec_codec: ec-codec {
>  		compatible = "google,cros-ec-codec";
>  		#sound-dai-cells = <1>;
> +		ec-shm = <0x0 0x10500000 0x80000>;
> +		memory-region = <&reserved_mem>;
>  	};
>  };
> -- 
> 2.23.0.581.g78d2f28ef7-goog
> 

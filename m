From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
Date: Fri, 11 Oct 2019 10:20:29 -0500
Message-ID: <20191011152029.GA18877@bogus>
References: <20191005085509.187179-1-tzungbi@google.com>
 <20191005164320.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191005164320.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
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

On Sat, Oct 05, 2019 at 04:55:08PM +0800, Tzung-Bi Shih wrote:
> Add an optional property "ec-codec".  If specified, mt8183 could use the
> "wake on voice" feature offered by EC codec.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> index 17ff3892f439..decaa013a07e 100644
> --- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> +++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> @@ -6,12 +6,15 @@ Required properties:
>  
>  Optional properties:
>  - mediatek,headset-codec: the phandles of ts3a227 codecs
> +- mediatek,ec-codec: the phandle of EC codecs.
> +                     See google,cros-ec-codec.txt for more details.

Not the best designed audio binding here. We really should just have 
links to codecs and then you can look at the codec nodes to determine 
the type.

>  
>  Example:
>  
>  	sound {
>  		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";

Don't you need to add EC codec to this? Just kidding. Just highlighting 
the weirdness of this binding.

>  		mediatek,headset-codec = <&ts3a227>;
> +		mediatek,ec-codec = <&ec_codec>;
>  		mediatek,platform = <&afe>;
>  	};
>  
> -- 
> 2.23.0.581.g78d2f28ef7-goog
> 

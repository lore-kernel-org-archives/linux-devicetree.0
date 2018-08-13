From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: media: adv7604: Fix slave map
 documentation
Date: Mon, 13 Aug 2018 13:16:16 -0600
Message-ID: <20180813191616.GA4086@rob-hp-laptop>
References: <20180808163351.28852-1-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180808163351.28852-1-kieran.bingham@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: mchehab@kernel.org, Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 05:33:51PM +0100, Kieran Bingham wrote:
> The reg-names property in the documentation is missing an '='. Add it.
> 
> Fixes: 9feb786876c7 ("media: dt-bindings: media: adv7604: Extend
> bindings to allow specifying slave map addresses")
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> ---
> v2:
>  - Commit title changed to prefix as "dt-bindings: media:"
> 
> If this is collected through a DT tree, I assume therefore this will be
> fine, but if it is to go through the media-tree, please update as
> necessaary to prevent the redundant dual "media:" tagging.
> 
> (I'll leave it to the maintainers to decide whose tree thise should go
> through)
> 
> Thanks
> 
> Kieran
> 
>  Documentation/devicetree/bindings/media/i2c/adv7604.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> index dcf57e7c60eb..b3e688b77a38 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> @@ -66,7 +66,7 @@ Example:
>  		 * other maps will retain their default addresses.
>  		 */
>  		reg = <0x4c>, <0x66>;
> -		reg-names "main", "edid";
> +		reg-names = "main", "edid";
>  
>  		reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
>  		hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> -- 
> 2.17.1
> 

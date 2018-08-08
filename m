From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] dt-bindings: media: adv7604: Fix slave map documentation
Date: Wed, 08 Aug 2018 19:36:16 +0300
Message-ID: <80734187.pp6Fhz4Hl4@avalon>
References: <20180808163351.28852-1-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808163351.28852-1-kieran.bingham@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: mchehab@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wednesday, 8 August 2018 19:33:51 EEST Kieran Bingham wrote:
> The reg-names property in the documentation is missing an '='. Add it.
> 
> Fixes: 9feb786876c7 ("media: dt-bindings: media: adv7604: Extend
> bindings to allow specifying slave map addresses")
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2:
>  - Commit title changed to prefix as "dt-bindings: media:"
> 
> If this is collected through a DT tree, I assume therefore this will be
> fine, but if it is to go through the media-tree, please update as
> necessaary to prevent the redundant dual "media:" tagging.

I assume Hans will take the patch in his tree and submit a pull request. 
Mauro, this will then require special handling to avoid a rewrite of the 
subject.

> (I'll leave it to the maintainers to decide whose tree thise should go
> through)
> 
> Thanks
> 
> Kieran
> 
>  Documentation/devicetree/bindings/media/i2c/adv7604.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> b/Documentation/devicetree/bindings/media/i2c/adv7604.txt index
> dcf57e7c60eb..b3e688b77a38 100644
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

-- 
Regards,

Laurent Pinchart

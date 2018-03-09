From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: backlight: Add binding for RAVE SP
 backlight driver
Date: Fri, 9 Mar 2018 17:57:57 -0600
Message-ID: <20180309235757.mulnqtrbewtrfdce@rob-hp-laptop>
References: <20180308192046.27670-1-andrew.smirnov@gmail.com>
 <20180308192046.27670-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308192046.27670-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Aleksander Morgado <aleksander@aleksander.es>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2018 at 11:20:46AM -0800, Andrey Smirnov wrote:
> Add Device Tree bindings for RAVE SP backlight driver - an MFD cell of
> parent RAVE SP driver (documented in
> Documentation/devicetree/bindings/mfd/zii,rave-sp.txt).
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Changes since [v1]:
> 
>  - Fixed typos in commit message and incorrect node name in example section
> 
> [v1] https://lkml.kernel.org/r/20180307024011.25033-2-andrew.smirnov@gmail.com
> 
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt

Reviewed-by: Rob Herring <robh@kernel.org>

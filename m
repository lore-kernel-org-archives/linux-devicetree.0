From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Date: Fri, 26 Apr 2019 15:39:22 -0500
Message-ID: <20190426203922.GA14919@bogus>
References: <20190426005308.27039-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426005308.27039-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On Fri, 26 Apr 2019 02:53:07 +0200, Paul Cercueil wrote:
> Add documentation for the devicetree bindings of the LCD controller present in
> the JZ47xx family of SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
> 
> Notes:
>     v2: Remove ingenic,panel property.
>     
>     v3: - Rename compatible strings from ingenic,jz47XX-drm to ingenic,jz47XX-lcd
>         - The ingenic,lcd-mode property is now read from the panel node instead
>     	  of from the driver node
>     
>     v4: Remove ingenic,lcd-mode property completely.
> 
>  .../bindings/display/ingenic,lcd.txt          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

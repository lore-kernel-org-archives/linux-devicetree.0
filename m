From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Date: Tue, 11 Jun 2019 15:55:54 -0600
Message-ID: <20190611215554.GA23791@bogus>
References: <20190603152331.23160-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603152331.23160-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On Mon,  3 Jun 2019 17:23:30 +0200, Paul Cercueil wrote:
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
>     v5: No change
> 
>  .../bindings/display/ingenic,lcd.txt          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

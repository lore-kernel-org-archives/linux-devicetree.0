From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: drm/panel: simple: add support for PDA
 91-00156-A0
Date: Thu, 6 Dec 2018 17:45:50 -0600
Message-ID: <20181206234550.GA3012@bogus>
References: <1542789804-4584-1-git-send-email-eugen.hristev@microchip.com>
 <1542789804-4584-3-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542789804-4584-3-git-send-email-eugen.hristev@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugen.Hristev@microchip.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 08:48:00AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
> AC320005-5).
> Adding Device Tree bindings for this panel.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/pda,91-00156-a0.txt          | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
> new file mode 100644
> index 0000000..52f0da9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
> @@ -0,0 +1,7 @@
> +PDA 91-00156-A0 5.0" WVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "pda,91-00156-a0"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

You need to explicitly list what properties from this are used. Does 
this have a single supply or did you just forget to add supplies for 
example? I don't know.

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/panel: simple: add support for
 PDA  91-00156-A0
Date: Wed, 16 Jan 2019 15:09:22 -0600
Message-ID: <20190116210922.GA24880@bogus>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
 <1547458584-29548-3-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547458584-29548-3-git-send-email-eugen.hristev@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com, Eugen.Hristev@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

On Mon, 14 Jan 2019 09:43:28 +0000, <Eugen.Hristev@microchip.com> wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
> This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
> AC320005-5).
> Adding Device Tree bindings for this panel.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> [eugen.hristev@microchip.com]: specified backlight and supply bindings
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - added binding explanations for required properties from simple-panel:
> backlight and power supply which are mandatory
> 
>  .../devicetree/bindings/display/panel/pda,91-00156-a0.txt  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

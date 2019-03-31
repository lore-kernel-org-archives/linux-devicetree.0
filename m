From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/panel: Add missing unit names
Date: Sun, 31 Mar 2019 01:41:56 -0500
Message-ID: <5ca06135.1c69fb81.a71f5.6cc6@mx.google.com>
References: <901e836ea06889a9d91a799102b2a6b836d93dcd.1553529797.git.agx@sigxcpu.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <901e836ea06889a9d91a799102b2a6b836d93dcd.1553529797.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019 17:08:10 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> Some examples were missing the unit names triggering
> 
>  Warning (unit_address_vs_reg): .../panel: node has a reg or ranges property, but no unit name
> 
> warnings when used verbatim in DTs and running dtc with W=1.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  .../devicetree/bindings/display/panel/innolux,p079zca.txt       | 2 +-
>  .../devicetree/bindings/display/panel/innolux,p097pfg.txt       | 2 +-
>  .../devicetree/bindings/display/panel/kingdisplay,kd097d04.txt  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

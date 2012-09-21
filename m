From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] pwm_backlight: Add device tree support for Low Threshold
 Brightness
Date: Thu, 20 Sep 2012 23:16:45 -0600
Message-ID: <505BF83D.8040201@wwwdotorg.org>
References: <1348203080-16348-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1348203080-16348-1-git-send-email-avinashphilip@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Philip, Avinash" <avinashphilip@ti.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, rpurdie@rpsys.net, thierry.reding@avionic-design.de, broonie@opensource.wolfsonmicro.com, shawn.guo@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nsekhar@ti.com, gururaja.hebbar@ti.com
List-Id: devicetree@vger.kernel.org

On 09/20/2012 10:51 PM, Philip, Avinash wrote:
> Some backlights perform poorly when driven by a PWM with a short
> duty-cycle. For such devices, the low threshold can be used to specify a
> lower bound for the duty-cycle and should be chosen to exclude the
> problematic range.
> 
> This patch adds support for an optional low-threshold-brightness
> property.

> diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt

>  Optional properties:
>    - pwm-names: a list of names for the PWM devices specified in the
>                 "pwms" property (see PWM binding[0])
> +  - low-threshold-brightness: brightness threshold low level. Low threshold
> +    brightness set to value so that backlight present on low end of
> +    brightness.

For my education, why not just specify values above this value in the
brightness-levels array; how do those two interact? It seems like any
description of that is missing from the PWM documentation, and would be
good to have in the DT binding too.


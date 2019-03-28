From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: cpu: Fix JSON schema
Date: Thu, 28 Mar 2019 14:35:54 -0500
Message-ID: <CAL_JsqJ_LYycXazkdP2Q=e-jynKiX+z5En0bz0AWpDjsevwQTg@mail.gmail.com>
References: <20190318100521.29109-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318100521.29109-1-maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, ARM-SoC Maintainers <arm@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+arm-soc

On Mon, Mar 18, 2019 at 5:05 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Commit fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for
> Milbeaut") added support for a new cpu enable-method, but did so using
> tabulations to ident. This is however invalid in the syntax, and resulted
> in a failure when trying to use that schemas for validation.
>
> Use spaces instead of tabs to indent to fix this.
>
> Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

This should be applied to arm-soc tree having the commit.

Rob

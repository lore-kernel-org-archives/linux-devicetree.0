From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: artpec6: add missing pin group
 uart5nocts
Date: Thu, 1 Mar 2018 17:25:23 -0600
Message-ID: <20180301232523.4a2fhhbjhkycv2hp@rob-hp-laptop>
References: <20180222152247.10554-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180222152247.10554-1-niklas.cassel@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 22, 2018 at 04:22:46PM +0100, Niklas Cassel wrote:
> Add missing pin group uart5nocts (all pins except cts), which has been
> supported by the artpec6 pinctrl driver since its initial submission.
> 
> Fixes: 00df0582eab1 ("pinctrl: Add pincontrol driver for ARTPEC-6 SoC")
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

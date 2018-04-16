From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: bcm2835-gpio: Add generic
 pinctrl support
Date: Mon, 16 Apr 2018 10:06:39 -0500
Message-ID: <20180416150639.wt74teumpzah4x7o@rob-hp-laptop>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
 <1523422726-7910-1-git-send-email-matheus@castello.eng.br>
 <1523422726-7910-2-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523422726-7910-2-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: stefan.wahren@i2se.com, eric@anholt.net, linus.walleij@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 12:58:44AM -0400, Matheus Castello wrote:
> Added generic pin configuration and multiplexing support,
> and should be preferred than brcm legacy one.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

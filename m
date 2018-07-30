From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO
 documentation
Date: Mon, 30 Jul 2018 17:08:09 -0600
Message-ID: <20180730230809.GA20470@rob-hp-laptop>
References: <20180730110406.132729-1-tmaimon77@gmail.com>
 <20180730110406.132729-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730110406.132729-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 02:04:05PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM750/730/715/705 pinmux and GPIO controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   | 216 +++++++++++++++++++++
>  1 file changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt

Reviewed-by: Rob Herring <robh@kernel.org>

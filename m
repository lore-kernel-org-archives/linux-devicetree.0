From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: pinctrl: deprecate
 'microchip,irq-active-high' property
Date: Tue, 21 Nov 2017 12:37:37 -0600
Message-ID: <20171121183737.d6l4pw4mkdxrvb7i@rob-hp-laptop>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-6-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511252491-79952-6-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 04:21:31PM +0800, Phil Reid wrote:
> The irq output polarity can be determined from the 'interrupts'
> configuration. So 'microchip,irq-active-high' is not required.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>


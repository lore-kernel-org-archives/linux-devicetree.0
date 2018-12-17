From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: atmel: describe SECUMOD usage
 as a  GPIO controller
Date: Mon, 17 Dec 2018 15:47:09 -0600
Message-ID: <20181217214709.GA24782@bogus>
References: <1544615784-29331-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544615784-29331-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544615784-29331-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, mark.rutland@arm.com, Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

On Wed, 12 Dec 2018 11:57:11 +0000, <Andrei.Stefanescu@microchip.com> wrote:
> This patch describes the Security Module's usage as a GPIO
> controller for its PIOBU pins. These pins have the special
> property of maintaining their voltage during suspend-to-mem.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

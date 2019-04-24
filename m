Return-Path: <robherring2@gmail.com>
Date: Wed, 24 Apr 2019 14:49:20 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: add Microchip QT1050 bindings
Message-ID: <20190424194920.GA7270@bogus>
References: <20190415165655.13016-1-m.felsch@pengutronix.de>
 <20190415165655.13016-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415165655.13016-2-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, raphaelpereira@gmail.com, voice.shen@atmel.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 15, 2019 at 06:56:54PM +0200, Marco Felsch wrote:
> This patch adds the device tree binding documentation for the Microchip
> QT1050 touch sensor.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi Rob,
> 
> it is only a minor change since v2 but it's still a change so I droped
> your Reviewed-by tag.
> 
> Changes:
> v3
> - add optional wakeup-source property
> 
> v2
> - change fw-layout, so each key is represented by a fw-subnode
> - use microchip,* device properties instead of touchscreen ones
> 
>  .../bindings/input/microchip,qt1050.txt       | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt

Reviewed-by: Rob Herring <robh@kernel.org>

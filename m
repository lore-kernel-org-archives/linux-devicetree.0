Return-Path: <robherring2@gmail.com>
Date: Tue, 30 Oct 2018 17:26:24 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: add Microchip QT1050 bindings
Message-ID: <20181030222624.GA15659@bogus>
References: <20181029133826.30326-1-m.felsch@pengutronix.de>
 <20181029133826.30326-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181029133826.30326-2-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, raphaelpereira@gmail.com, voice.shen@atmel.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Mon, 29 Oct 2018 14:38:25 +0100, Marco Felsch wrote:
> This patch adds the device tree binding documentation for the Microchip
> QT1050 touch sensor.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> ---
> Changes:
> 
> v2:
> - change fw-layout, so each key is represented by a fw-subnode
> - use microchip,* device properties instead of touchscreen ones
> 
>  .../bindings/input/microchip,qt1050.txt       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

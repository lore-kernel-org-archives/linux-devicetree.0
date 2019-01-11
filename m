Return-Path: <robherring2@gmail.com>
Date: Fri, 11 Jan 2019 11:02:37 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Input: edt-ft5x06 - add support for
 FT5726
Message-ID: <20190111170237.GA5628@bogus>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
 <20190103192327.6170-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103192327.6170-2-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

On Thu,  3 Jan 2019 20:23:23 +0100, Marco Felsch wrote:
> The FT5726 controller has up to 72 channels, 42 Tx-channels and 30
> Rx-channels. The recommended touchpoint size is less equal 11.6".
> 
> This adds the support for the FT5726 controller flashed with the
> Evervision firmware.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

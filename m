Return-Path: <robherring2@gmail.com>
Date: Fri, 11 Jan 2019 11:04:03 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: Input: edt-ft5x06 - add offset bindings
 for ft5726
Message-ID: <20190111170403.GA8384@bogus>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
 <20190103192327.6170-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103192327.6170-5-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

On Thu,  3 Jan 2019 20:23:26 +0100, Marco Felsch wrote:
> The evervision,ev-ft5726 devices has a more advanced offset support,
> since they support setting the offset for the x and y position.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

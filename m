Return-Path: <robherring2@gmail.com>
Date: Wed, 16 Jan 2019 14:56:26 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: usb251xb: add documentation for
 data lane swapping
Message-ID: <20190116205626.GA7771@bogus>
References: <20190116142037.10086-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116142037.10086-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: richard.leitner@skidata.com, robh@kernel.org, fancer.lancer@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de, gregkh@linuxfoundation.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 16 Jan 2019 15:20:36 +0100, Marco Felsch wrote:
> Add optional binding to allow USB differential-pair (D+/D-) data lane
> swapping. The swapping can be specified for each port separately,
> default is no swapping.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> Changes:
> v3:
>  - no changes
> v2:
>  - rename property s/sw-dx-lanes-ports/swap-dx-lanes
> 
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

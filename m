Return-Path: <SRS0=2j9E=PY=skidata.com=prvs=912a82b5b=Richard.Leitner@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: usb251xb: add documentation for
 data lane swapping
References: <20190115115018.27143-1-m.felsch@pengutronix.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <1970646d-bc2e-4ff2-c160-9fbc4678f1b9@skidata.com>
Date: Wed, 16 Jan 2019 14:45:20 +0100
MIME-Version: 1.0
In-Reply-To: <20190115115018.27143-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, robh@kernel.org, fancer.lancer@gmail.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 15/01/2019 12:50, Marco Felsch wrote:
> Add optional binding to allow USB differential-pair (D+/D-) data lane
> swapping. The swapping can be specified for each port separately,
> default is no swapping.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changes:
> v2:
>   - rename property s/sw-dx-lanes-ports/swap-dx-lanes
> 
>   Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
>   1 file changed, 4 insertions(+)
> 

looks good to me. Feel free to add

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

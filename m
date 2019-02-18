Return-Path: <robherring2@gmail.com>
Date: Mon, 18 Feb 2019 12:12:30 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
Message-ID: <20190218181230.GA13153@bogus>
References: <20190213175124.3695-1-m.tretter@pengutronix.de>
 <20190213175124.3695-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190213175124.3695-2-m.tretter@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On Wed, 13 Feb 2019 18:51:22 +0100, Michael Tretter wrote:
> Add device-tree bindings for the Allegro DVT video IP core found on the
> Xilinx ZynqMP EV family.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> v2 -> v3:
> - rename node to video-codec
> - drop interrupt-names
> - fix compatible in example
> - add clocks to required properties
> 
> v1 -> v2:
> none
> ---
>  .../devicetree/bindings/media/allegro.txt     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

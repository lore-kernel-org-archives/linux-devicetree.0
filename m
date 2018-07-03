Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 11:01:54 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
Message-ID: <20180703170154.GA25114@rob-hp-laptop>
References: <20180627185237.24830-1-daniel@zonque.org>
 <20180627185237.24830-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180627185237.24830-2-daniel@zonque.org>
To: Daniel Mack <daniel@zonque.org>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 08:52:33PM +0200, Daniel Mack wrote:
> This patch add the bindings document for LT3593 LED drivers.
> The binding is kept consistent with other LED driver bindings in that it
> stores all the LED-specific properties in its own subnode. As the hardware
> only supports one channel, there can consequently only be one sub-node.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/leds/leds-lt3593.txt  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt

Reviewed-by: Rob Herring <robh@kernel.org>

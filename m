From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: usb-connector: add Vbus regulator
 for Type-A/B
Date: Sat, 6 Apr 2019 02:10:52 -0500
Message-ID: <20190406071052.GA5805@bogus>
References: <20190405205736.55177-1-icenowy@aosc.io>
 <20190405205736.55177-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405205736.55177-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Sat,  6 Apr 2019 04:57:32 +0800, Icenowy Zheng wrote:
> USB Type-A and Type-B connectors have a Vbus pin, which provides +5V
> power to bus-powered devices.
> 
> Add a power supply regulator property for this pin.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> New patch in v5.
> 
>  Documentation/devicetree/bindings/connector/usb-connector.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

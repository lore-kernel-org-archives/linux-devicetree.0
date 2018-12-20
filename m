From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] Documentation: dt: Add binding info for jz4740-musb
 driver
Date: Thu, 20 Dec 2018 14:33:27 -0600
Message-ID: <20181220203327.GA14186@bogus>
References: <20181213144555.24031-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213144555.24031-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Dec 2018 15:45:52 +0100, Paul Cercueil wrote:
> This commit adds documentation for the device-tree bindings of the
> jz4740-musb driver, which provides support for the USB gadget mode
> of the JZ4740 and similar SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/usb/ingenic,jz4740-musb.txt           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

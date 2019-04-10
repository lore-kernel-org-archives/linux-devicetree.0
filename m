From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: Add usb-phy property to the
 jz4740-musb node
Date: Wed, 10 Apr 2019 09:07:57 -0500
Message-ID: <20190410140757.GA19016@bogus>
References: <20190404094739.23503-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190404094739.23503-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>, od@zcrc.me, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Thu,  4 Apr 2019 11:47:37 +0200, Paul Cercueil wrote:
> Add a required 'usb-phy' property, to obtain a phandle to the USB PHY
> from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Change "usb-phy" DT property to "phys"
> 
>  Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

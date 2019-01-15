From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: keystone-usb: Add ti,am654-dwc3
 support
Date: Tue, 15 Jan 2019 15:35:00 -0600
Message-ID: <20190115213500.GA12172@bogus>
References: <1547132670-5908-1-git-send-email-rogerq@ti.com>
 <1547132670-5908-3-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547132670-5908-3-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: balbi@kernel.org, vigneshr@ti.com, robh+dt@kernel.org, nsekhar@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jan 2019 17:04:29 +0200, Roger Quadros wrote:
> The AM654 SoC from TI contains a DWC3 controller. Add
> support for it.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  Documentation/devicetree/bindings/usb/keystone-usb.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

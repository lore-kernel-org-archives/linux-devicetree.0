From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: keystone-usb: Update bindings
 pm and clocks properties
Date: Thu, 17 Aug 2017 17:18:55 -0500
Message-ID: <20170817221855.7tcgsx4onukbooyu@rob-hp-laptop>
References: <20170816215408.13076-1-fcooper@ti.com>
 <20170816215408.13076-3-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170816215408.13076-3-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: gregkh@linuxfoundation.org, ssantosh@kernel.org, linux@armlinux.org.uk, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, rogerq@ti.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 04:54:08PM -0500, Franklin S Cooper Jr wrote:
> Update various properties to properly indicate their requirement depending
> on the SoC.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 2:
> Clarify clock requirements in binding document
> 
>  Documentation/devicetree/bindings/usb/keystone-usb.txt | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

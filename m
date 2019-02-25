From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: net: mt76: update binding for mt7603
 driver
Date: Mon, 25 Feb 2019 10:33:08 -0600
Message-ID: <20190225163308.GA6363@bogus>
References: <20190130140756.91317-1-nbd@nbd.name>
 <20190130140756.91317-2-nbd@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190130140756.91317-2-nbd-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Jan 2019 15:07:55 +0100, Felix Fietkau wrote:
> In addition to MT7603E PCI devices, the driver supports the WLAN core on
> MT7628/MT7688, which needs to be defined in DT.
> 
> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> ---
>  .../bindings/net/wireless/mediatek,mt76.txt   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

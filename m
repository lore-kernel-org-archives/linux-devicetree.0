From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Broadcom Stingray SATA PHY support
Date: Fri, 16 Jun 2017 11:15:15 +0530
Message-ID: <c685d3a3-c3ea-6509-9190-a884518c90f1@ti.com>
References: <1496921499-2808-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496921499-2808-1-git-send-email-srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 08 June 2017 05:01 PM, Srinath Mannam wrote:
> This patchset extends the Broadcom SATA PHY driver to add
> support for Stingray SATA PHY.
> 
> All patches are based on linux-phy/next
> 
> Changes since v1:
>  - Rebased patchset on linux-phy/next
> 

merged, thanks!

-Kishon
> Srinath Mannam (2):
>   dt-bindings: Update documentation for stingray SATA phy
>   phy: Add stingray SATA phy support
> 
>  .../devicetree/bindings/phy/brcm-sata-phy.txt      |  7 ++-
>  drivers/phy/broadcom/phy-brcm-sata.c               | 73 ++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 3 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

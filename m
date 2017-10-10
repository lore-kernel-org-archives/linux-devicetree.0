From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: renesas_usbhs: add support for R-Car D3
Date: Tue, 10 Oct 2017 14:02:40 -0500
Message-ID: <20171010190240.jrjzlfaiebhron6r@rob-hp-laptop>
References: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507028954-15738-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507028954-15738-3-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 03, 2017 at 08:09:14PM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for R-Car D3. This SoC needs to release
> the PLL reset by the UGCTRL register. So, since this is not the same
> as other R-Car Gen3 SoCs, this patch adds a new type as
> "USBHS_TYPE_RCAR_GEN3_WITH_PLL".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
>  drivers/usb/renesas_usbhs/common.c                 | 10 ++++-
>  drivers/usb/renesas_usbhs/rcar3.c                  | 48 ++++++++++++++++++++++
>  drivers/usb/renesas_usbhs/rcar3.h                  |  1 +
>  include/linux/usb/renesas_usbhs.h                  |  5 ++-
>  5 files changed, 62 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: phy: mxs: Add DT bindings to configure TX settings
Date: Thu, 18 Aug 2016 14:27:14 -0500
Message-ID: <20160818192714.GA32621@rob-hp-laptop>
References: <0160614020657.GA25052@shlinux2>
 <1471386708-26350-1-git-send-email-jaret.cantu@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471386708-26350-1-git-send-email-jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 06:31:48PM -0400, Jaret Cantu wrote:
> The TX settings can be calibrated for particular hardware.  The
> phy is reset by Linux, so this cannot be handled by the bootloader.
> 
> The TRM mentions that the maximum resistance should be used for the
> DN/DP calibration in order to pass USB certification.
> 
> The values for the TX registers are poorly described in the TRM.
> The meanings of the register values were taken from another
> NXP-provided document:
> https://community.nxp.com/message/566147#comment-566912
> 
> Signed-off-by: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
> ---
> v4. Corrected tx-d-cal register value by rounding up.
>     Changed Freescale web site reference to NXP.
> 
> v3. Added unit suffix (-ohms) to tx-cal-45-d*
> 
> v2. Copying devicetree list
>     Removed prettifying extra whitespace
>     Removed unnecessary register rewrite on resume
>     Use min and max constants for clarity
> 
>  .../devicetree/bindings/phy/mxs-usb-phy.txt        |   10 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/phy/phy-mxs-usb.c                      |   61 ++++++++++++++++++++
>  2 files changed, 71 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

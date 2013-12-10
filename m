From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5 15/15] usb: phy-mxs: Add sync time after controller
 clear phcd
Date: Tue, 10 Dec 2013 09:47:02 +0800
Message-ID: <20131210014700.GB24228@shlinux1.ap.freescale.net>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
 <1386570664-6713-16-git-send-email-peter.chen@freescale.com>
 <52A609D8.1050300@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A609D8.1050300-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 09, 2013 at 09:20:08PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 12/09/2013 09:31 AM, Peter Chen wrote:
> 
> >After clear portsc.phcd, PHY needs 200us stable time for switch
> >32K clock to AHB clock.
> 
> >Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >---
> >  drivers/usb/phy/phy-mxs-usb.c |   11 +++++++++++
> >  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> >diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> >index e18fdf3..7ae5225 100644
> >--- a/drivers/usb/phy/phy-mxs-usb.c
> >+++ b/drivers/usb/phy/phy-mxs-usb.c
> >@@ -151,6 +151,15 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
> >  	return mxs_phy->data == &imx6sl_phy_data;
> >  }
> >
> >+/*
> >+ * PHY needs some 32K cycles to switch from 32K clock to
> >+ * bus (such as AHB/AXI, etc) clock.
> >+ */
> >+static void mxs_phy_clock_switch(void)
> >+{
> >+	usleep_range(300, 400);
> >+}
> >+
> 
>    Don't think this is a good name for this function since it
> doesn't really switch anything, just waits. I'd suggest something
> like mxs_phy_clock_switch_delay().
> 

Thanks, I will change.

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

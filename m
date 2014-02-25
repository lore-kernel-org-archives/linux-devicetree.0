From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v10 1/4] PHY: Add function set_speed to generic
 PHY framework
Date: Tue, 25 Feb 2014 08:45:17 -0500
Message-ID: <20140225134517.GA26189@htj.dyndns.org>
References: <1393308882-3964-1-git-send-email-lho@apm.com>
 <1393308882-3964-2-git-send-email-lho@apm.com>
 <530C8711.4000600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530C8711.4000600-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 25, 2014 at 05:35:37PM +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Tuesday 25 February 2014 11:44 AM, Loc Ho wrote:
> > This patch adds function set_speed to the generic PHY framework operation
> > structure. This function can be called to instruct the PHY underlying layer
> > at specified lane to configure for specified speed in hertz.
> > 
> > Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> > ---
> >  drivers/phy/phy-core.c  |   21 +++++++++++++++++++++
> >  include/linux/phy/phy.h |    8 ++++++++
> >  2 files changed, 29 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 645c867..44f2f63 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -257,6 +257,27 @@ int phy_power_off(struct phy *phy)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_power_off);
> >  
> 
> missing function comment :-s

Can you please let me know when this series goes in?  I'll pull in the
phy tree into libata and then apply the ata patches on top.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

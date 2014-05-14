From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] usb: phy: msm: devm_ioremap() doesn't return ERR_PTRs
Date: Wed, 14 May 2014 16:44:09 +0300
Message-ID: <20140514134409.GE16836@mwanda>
References: <20140514125524.GB14571@mwanda>
 <53736EA4.8040203@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53736EA4.8040203@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 05:24:52PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 14-05-2014 16:55, Dan Carpenter wrote:
> 
> >devm_ioremap() returns a NULL on error so the IS_ERR() check needs to be
> >updated.
> 
> >Fixes: 6b99c68ec1f9 ('usb: phy: msm: Migrate to Managed Device Resource allocation')
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> >diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> >index c522c4f..bd32257 100644
> >--- a/drivers/usb/phy/phy-msm-usb.c
> >+++ b/drivers/usb/phy/phy-msm-usb.c
> >@@ -1587,8 +1587,8 @@ static int msm_otg_probe(struct platform_device *pdev)
> >
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 
>    Hm, 'res' can be NULL too, why this isn't checked?

Yeah.  You're right.  The correct idiom is to use devm_ioremap_resource()
like Fabio says, since it has checking built in.  Also the original code
was missing a call to a request_mem_region function here but so that's
buggy.

Ivan, I am so cross with you right now...   *Grumble*.

v2 coming up.

regards,
dan carpenter

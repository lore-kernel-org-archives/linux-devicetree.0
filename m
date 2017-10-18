From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: dts: imx51-ts4800: Fix 'port@0' node with unit
 name and no reg property
Date: Wed, 18 Oct 2017 10:51:25 +0800
Message-ID: <20171018025124.GH18810@dragon>
References: <1508158110-5188-1-git-send-email-marco.franchi@nxp.com>
 <1508158110-5188-2-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508158110-5188-2-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 16, 2017 at 10:48:26AM -0200, Marco Franchi wrote:
> The following build warning is seen with W=1:
> 
> Warning (unit_address_vs_reg): Node /display-di0/port@0 has a unit name, but no reg property
> 
> Fix this warning by removing '@' from such node.
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

This patch and #6 do not apply to imx/dt branch.  Please rebase.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

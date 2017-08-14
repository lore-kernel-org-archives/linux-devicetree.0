From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] arm64: dts: ls1088a: add cpu idle support
Date: Mon, 14 Aug 2017 09:15:11 +0800
Message-ID: <20170814011510.GE31819@dragon>
References: <1502070879-14106-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502070879-14106-1-git-send-email-andy.tang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.tang-3arQi8VN3Tc@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 07, 2017 at 09:54:38AM +0800, andy.tang-3arQi8VN3Tc@public.gmane.org wrote:
> From: Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
> 
> ls1088a supports another cpu idle state which is ph20 which saves
> more power when cpu is idle.
> It was implemented through psci firmware.
> 
> Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>

Applied both, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

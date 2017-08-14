From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx6q-bx50v3: Enable i2c recovery
 mechanism
Date: Mon, 14 Aug 2017 09:46:35 +0800
Message-ID: <20170814014634.GH31819@dragon>
References: <cover.1502360101.git.jose.alarcon@ge.com>
 <622b0df0cfc7ed6fe3510ea8a2ef07fb7073bee5.1502360101.git.jose.alarcon@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <622b0df0cfc7ed6fe3510ea8a2ef07fb7073bee5.1502360101.git.jose.alarcon-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, nandor.han-JJi787mZWgc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 10, 2017 at 01:42:29PM +0300, Jose Alarcon wrote:
> This commit enables i2c recovery, supported by the i2c core subsystem.
> It defines the required GPIOs for SDA and SLC lines.

s/SLC/SCL

I fixed it up and applied the patch.

Shawn

> Signed-off-by: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
> Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
> Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

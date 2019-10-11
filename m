From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 0/3] RK3288 Gamma LUT
Date: Fri, 11 Oct 2019 09:27:15 -0400
Message-ID: <20191011132715.GO85762@art_vandelay>
References: <20191010194351.17940-1-ezequiel@collabora.com>
 <2314316.IrHOdPmtjk@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2314316.IrHOdPmtjk@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2019 at 03:22:00PM +0200, Heiko Stübner wrote:
> Am Donnerstag, 10. Oktober 2019, 21:43:48 CEST schrieb Ezequiel Garcia:
> > New iteration, seems that we are finally converging.
> > 
> > For this v5, we are only doing some changes on
> > the gamma_set implementation. As a result, the code
> > is more readable. See the changelog in patch 2 for more
> > information.
> > 
> > Thanks!
> 
> on rk3288 (and rk3399+rk3328 to make sure nothing breaks)
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 

Applied the first 2 patches to drm-misc-next for 5.5. I'll leave 3/3 for Heiko
and the rockchip tree.

Thanks to all for the reviews and testing, thanks to Ezequiel for sticking with
this to completion!

Sean

> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS

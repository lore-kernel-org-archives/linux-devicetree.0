From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
Date: Fri, 26 Jul 2019 14:36:25 +0200
Message-ID: <20190726123625.GA17037@ravnborg.org>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jeffrey.

On Mon, Jul 08, 2019 at 09:56:47AM -0700, Jeffrey Hugo wrote:
> The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
> or Sharp option.  This likely provides options during manufacturing.
> 
> These panels connect via eDP, however they sit behind a DSI to eDP
> bridge on the laptop, so they can easily be handled by the existing
> simple panel code.
> 
> This series adds support for the Sharp option.
> 
> v2:
> -removed no-hpd from dt example
> -added .bus_format and .bus_flags fields based on reviews
> -added .flags after Bjorn pointed me to something I missed
> -added Sam's reviewed-by tags
> 
> Jeffrey Hugo (2):
>   dt-bindings: panel: Add Sharp LD-D5116Z01B
>   drm/panel: simple: Add support for Sharp LD-D5116Z01B panel

Thanks.
Both patches applied and pushed to drm-misc-next.

Are you up to a little janitorial work?
Today the preferred format for bindings files are the new yaml format.
Could you update 'your' file, and maybe the other sharp files too?
It would be good to have some progress in this.

	Sam

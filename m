From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
Date: Thu, 2 May 2019 16:36:05 -0500
Message-ID: <20190502213605.GA20606@bogus>
References: <20190501121448.3812-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501121448.3812-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Wed,  1 May 2019 17:44:47 +0530, Jagan Teki wrote:
> HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
> resolution. It has built in Goodix, GT9271 captive touchscreen
> with backlight adjustable via PWM.
> 
> Add support for it.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/panel/friendlyarm,hd702e.txt      | 29 +++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c          | 26 +++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

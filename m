From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 4/9] drm/panel: simple: add support for overriding the
 pixel clock polarity
Date: Tue, 17 Oct 2017 14:25:07 +0200
Message-ID: <20171017142507.127f1711@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
        <20171017121422.GE684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171017121422.GE684@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 17 Oct 2017 14:14:22 +0200 Thierry Reding wrote:
> On Wed, Oct 11, 2017 at 01:23:36PM +0200, Lothar Waßmann wrote:
> > The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
> > converter that requires a fixed pixelclk polarity, no matter what the
> > panel's display_mode specifies. Add an option to override the pixelclk
> > polarity defined in the panel's display_mode via DTB.
> 
> I'd argue that the LCD->LVDS converter should be modelled specifically
> in DT to handle this case. It could be a implemented as a DRM bridge
> driver, for example.
> 
IMO that's just overkill for a simple chip that is in no way
configurable nor detectable by software.


Lothar Waßmann

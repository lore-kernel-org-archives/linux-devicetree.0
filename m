From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/1] drm/panel: Add support for Olimex LCD-OLinuXino
 panel
Date: Mon, 5 Nov 2018 16:03:22 -0600
Message-ID: <20181105220322.GA10583@bogus>
References: <1531383729-13932-1-git-send-email-stefan@olimex.com>
 <20180716150836.GA16895@rob-hp-laptop>
 <e677488e-34e0-512c-db13-15ccf78c5ea0@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e677488e-34e0-512c-db13-15ccf78c5ea0@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 01, 2018 at 04:34:42PM +0200, Stefan Mavrodiev wrote:
> On 7/16/18 6:08 PM, Rob Herring wrote:
> > On Thu, Jul 12, 2018 at 11:21:53AM +0300, Stefan Mavrodiev wrote:
> > > This patch adds Olimex Ltd. LCD-OLinuXino bridge panel driver. The
> > > panel is used with different LCDs (currently from 480x272 to 1280x800).
> > > Small EEPROM chip is used for identification, which holds some
> > > factory data and timing requirements.
> > > 
> > > Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> > > ---
> > > Changes for v3:
> > >    - Change module license from "GPL v2" to "GPL"
> > >    - Make use of backlight_enable()/backlight_disable() helpers
> > >    - Rework backlight device request
> > >    - Remove drm_panel_detach()
> > >    - Use module_i2c_driver() for initialization
> > >    - Make the first mode preferred
> > >    - If num_modes value is invalid, overwrite it with 4, which is the maximum
> > >    - Some variable types optimizations
> > > 
> > > Changes for v2:
> > >    - Changed lcd_olinuxino_funcs to static const
> > > 
> > >   .../display/panel/olimex,lcd-olinuxino.txt         |  42 +++
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > >   MAINTAINERS                                        |   6 +
> > >   drivers/gpu/drm/panel/Kconfig                      |  10 +
> > >   drivers/gpu/drm/panel/Makefile                     |   1 +
> > >   drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 331 +++++++++++++++++++++
> > >   5 files changed, 390 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
> > >   create mode 100644 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> 
> I would like to ask if there will be any progress on this patch?

Thierry needs to pick this one up. At this point you need to re-send. No 
one is going to look at patches 4 months old.

Rob

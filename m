From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v6 17/39] platform: add video-multiplexer subdevice driver
Date: Wed, 05 Apr 2017 13:58:39 +0200
Message-ID: <1491393519.2904.40.camel@pengutronix.de>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-18-git-send-email-steve_longerbeam@mentor.com>
 <20170405111857.GA26831@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170405111857.GA26831@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, shuah@kernel.org, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, p.zabel@pengutronix.de, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, Sascha Hauer <s.hauer@pengutronix.de>, tiffany.lin@mediatek.com, bparrot@ti.com, laurent.pinchart+renesas@ideasonboard.com, horms+renesas@verge.net.au, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 05.04.2017, 13:18 +0200 schrieb Pavel Machek:
> Hi!
> 
> > + * video stream multiplexer controlled via gpio or syscon
> > + *
> > + * Copyright (C) 2013 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
> > + * Copyright (C) 2016 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
> 
> This is actually quite interesting. Same email address for two
> people...
> 
> Plus, I believe this wants to say that copyright is with Pengutronix,
> not Sascha and Philipp. In that case you probably want to list
> copyright and authors separately?
> 
Nope, copyright doesn't get transferred to the employer within the rules
of the German "Urheberrecht", but stays at the original author of the
code.
Same email is just to ensure that any requests regarding this code get
routed to the right people, even if someone leaves the company or is
temporarily unavailable. kernel@ is a list for the Pengutronix kernel
team.

Regards,
Lucas

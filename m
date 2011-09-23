From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 08/11] OMAP2+: board-generic: Add i2c static init
Date: Fri, 23 Sep 2011 16:12:08 -0700
Message-ID: <20110923231208.GE6324@atomide.com>
References: <1316809399-19579-1-git-send-email-b-cousson@ti.com>
 <1316809399-19579-9-git-send-email-b-cousson@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1316809399-19579-9-git-send-email-b-cousson@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: grant.likely@secretlab.ca, paul@pwsan.com, khilman@ti.com, rnayak@ti.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

* Benoit Cousson <b-cousson@ti.com> [110923 12:50]:
> Still needed to boot until the i2c & twl driver is adapted to
> device-tree. Otherwise the voltage control code will try to
> access the twl and crash.

That sounds OK to me for now. For merging these patches, how
about the following:

- Kevin queues up the omap_device related changes

- Grant queues up the .dts changes

- I'll queue the map_io and board changes based on Kevin's
  omap_device changes

Regards,

Tony

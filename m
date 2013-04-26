From: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] ARM: OMAP2+: Legacy support for wl12xx when booted with devicetree
Date: Fri, 26 Apr 2013 11:33:59 +0200
Message-ID: <0104F687-1726-476D-B2DF-7E72223B127A@dominion.thruhere.net>
References: <20130426034858.26065.65118.stgit@muffinssi.local> <20130426035210.26065.39995.stgit@muffinssi.local>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20130426035210.26065.39995.stgit@muffinssi.local>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org, Luciano Coelho <coelho@ti.com>, devicetree-discuss@lists.ozlabs.org, "linux-omap@vger.kernel.org List" <linux-omap@vger.kernel.org>, Benoit Cousson <b-cousson@ti.com>, Rajendra Nayak <rnayak@ti.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Jason Kridner <jkridner@beagleboard.org>
List-Id: devicetree@vger.kernel.org


Op 26 apr. 2013, om 05:52 heeft Tony Lindgren <tony@atomide.com> het volgende geschreven:

> Without WLAN we cannot switch omap4 to use device tree
> only booting. This patch can be reverted when the
> binding for wl12xx is added.

How much boards am I allowed to add to this? I need to get the wl12xx wifi expansionboards for beagleboard, beagleboard xM and beaglebone working with DT :)

regards,

Koen
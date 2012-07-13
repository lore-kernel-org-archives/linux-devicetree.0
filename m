From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [RFC RESEND 4/4] ARM: OMAP: Add DT support for timer driver
Date: Fri, 13 Jul 2012 17:41:45 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1207131740460.25585@utopia.booyaka.com>
References: <1342218413-30116-1-git-send-email-jon-hunter@ti.com> <1342218413-30116-5-git-send-email-jon-hunter@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1342218413-30116-5-git-send-email-jon-hunter@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Jon Hunter <jon-hunter@ti.com>
Cc: Tarun Kanti DebBarma <tarun.kanti@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Benoit Cousson <b-cousson@ti.com>, linux-omap <linux-omap@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, device-tree <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi

On Fri, 13 Jul 2012, Jon Hunter wrote:

> 1. If DT blob is present, then let HWMOD create the timer devices dynamically.

This probably should read "is _not_ present", yes?


- Paul

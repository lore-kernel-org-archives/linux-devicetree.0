From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 07/36] mtd: nand: omap: Move NAND write protect code from
 GPMC to NAND driver
Date: Fri, 13 Jun 2014 00:20:23 -0700
Message-ID: <20140613072023.GK17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-8-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402477001-31132-8-git-send-email-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, kyungmin.park@samsung.com, pekon@ti.com, ezequiel.garcia@free-electrons.com, javier@dowhile0.org, nsekhar@ti.com, linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

* Roger Quadros <rogerq@ti.com> [140611 01:58]:
> The write protect (WP) pin is only used for NAND devices. So move
> the code into the NAND driver.

Eek, noooo!

Tony

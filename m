From: Rajendra Nayak <rnayak@ti.com>
Subject: Re: [PATCH 00/13] Device tree support for OMAP HS USB Host
Date: Tue, 5 Feb 2013 16:55:01 +0530
Message-ID: <5110EC0D.40609@ti.com>
References: <1359993540-20780-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1359993540-20780-1-git-send-email-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, b-cousson@ti.com, balbi@ti.com, stern@rowland.harvard.edu, linux@arm.linux.org.uk, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, paul@pwsan.com
List-Id: devicetree@vger.kernel.org

On Monday 04 February 2013 09:28 PM, Roger Quadros wrote:
> This patchset adds device tree support for OMAP's High Speed USB Host
> subsystem. Board adaptation for Panda and Beagleboard is also provided.
>
> Tested on Beagleboard.
>
> Will only work with Panda if we provide a reference to the PHY clock

But there is no reference provided even for Beagle. Does it work because
the default clk speed is 192Mhz?

> generator in the device tree in PATCH 11. I do not know how to do that
> as there is no way to provide a phandle to any of the OMAP generated clocks
> in the device tree. Suggestions welcome:).


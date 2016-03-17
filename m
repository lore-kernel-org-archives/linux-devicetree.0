From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 09/11] usb: ohci-da8xx: Remove code that references
 mach
Date: Thu, 17 Mar 2016 14:01:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1603171400290.2097-100000@iolanthe.rowland.org>
References: <1458181615-27782-10-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458181615-27782-10-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Petr Kulhavy <petr@barix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Mar 2016, David Lechner wrote:

> Including mach/* is frowned upon in device drivers, so get rid of it.
> 
> This replaces usb20_clk and code that pokes CFGCHIP2 with a proper phy
> driver.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v2 changes: Uses the new phy driver instead of using a second clock.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

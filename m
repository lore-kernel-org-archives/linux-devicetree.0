From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 5/5] arm: dts: Convert mvebu device tree files to 64
 bits
Date: Thu, 21 Mar 2013 22:15:23 +0100
Message-ID: <20130321221523.7ede6ccc@skate>
References: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com>
	<1363883179-1361-6-git-send-email-gregory.clement@free-electrons.com>
	<20130321201533.GN21478@lunn.ch>
	<20130321212236.1015295d@skate>
	<20130321205545.GA8358@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130321205545.GA8358@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.c>
List-Id: devicetree@vger.kernel.org

Dear Jason Gunthorpe,

On Thu, 21 Mar 2013 14:55:45 -0600, Jason Gunthorpe wrote:

> Or, better, locate all the internal registers above 8G and use
> contiguous DRAM mapping from 0 -> 8GB

I see two potential issues with this idea:

 *) It only works when LPAE is enabled, so we would have to have
    different internal register addresses depending on whether LPAE is
    enabled or not. Probably not impossible, but not very
    straightforward either.

 *) It would require Linux to change the internal registers address
    (for now the kernel relies on the bootloader). The problem is that
    we can't do it early enough to preserve the earlyprintk
    functionality. Maybe you have suggestions on how to achieve that?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

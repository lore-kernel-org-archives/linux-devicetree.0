From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v8 03/11] ARM: brcmstb: add debug UART for earlyprintk
	support
Date: Sat, 2 Aug 2014 09:30:40 +0100
Message-ID: <20140802083040.GY30282@n2100.arm.linux.org.uk>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com> <1405976886-27807-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405976886-27807-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Matt Porter <mporter@linaro.org>, Christian Daudt <bcm@fixthebug.org>, linux-arm-kernel@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Marc Carino <marc.ceeeee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 21, 2014 at 02:07:58PM -0700, Brian Norris wrote:
> From: Marc Carino <marc.ceeeee@gmail.com>
> 
> Add the UART definitions needed to support earlyprintk on brcmstb machines.
> 
> Signed-off-by: Marc Carino <marc.ceeeee@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I noticed that you sent this to the patch system.  I asked Olof last
night whether he had anything in arm-soc touching Kconfig.debug, and
he does (a number of other platforms have updated it.)  This means
that if I apply it to my tree, it may conflict, so I'm reluctant to
take it.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.

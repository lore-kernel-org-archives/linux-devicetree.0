From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v1 0/5] ARM: Initial support for Marvell Armada 1500
Date: Tue, 27 Aug 2013 21:38:53 +0200
Message-ID: <2660767.3xDXT08nY0@wuerfel>
References: <1376682098-10580-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130827161958.5e71890d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130827161958.5e71890d@skate>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On Tuesday 27 August 2013 16:19:58 Thomas Petazzoni wrote:
> 
> Also, to help us understand the organization of the family of SOCs, I
> asked a few informations to Marvell, and here is what I could collect:
> 
> """
> BGxname         CPU core        codename        L2 cache controller     internal name
> BG2             PJ4B            Armada1500      Tauros3                 MV88DE3100
> BG2-CT          Cortex-A9       N/A             PL310                   N/A
> BG3             Cortex-A15      N/A             CA15 integrated         N/A
> """

My guess is that BG2-CT is Armada1500-mini aka MV88DE3005, i.e. the chip
used in the chromecast.
At least that is what gets used in the chromecast kernel sources, but it's
also possible that there are UP and SMP versions of BG2-CT and that
DE3005 is only the former.

	Arnd

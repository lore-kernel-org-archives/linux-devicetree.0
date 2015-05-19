From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Tue, 19 May 2015 23:32:59 +0200
Message-ID: <84257d3d23dbcc063b6f60e73970cc40@agner.ch>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
 <2419398.cbLWQC7K5f@wuerfel> <b41ebeb9d62b9c49faec6500f73460b9@agner.ch>
 <5548280.7uBnLuun8k@wuerfel> <0103afd0e9dd50c1bf85153a38a3490f@agner.ch>
 <alpine.DEB.2.11.1505192331220.4225@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1505192331220.4225@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de, olof@lixom.net, galak@codeaurora.org, shawn.guo@linaro.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On 2015-05-19 23:32, Thomas Gleixner wrote:
> On Tue, 19 May 2015, Stefan Agner wrote:
>> Ok, I will rebase this patchset (06-13) then, send the clocksource patch
>> (07) as a single patch and send the EFM32 convertion patch (10) together
>> with a conversion patch of the other two platforms as a follow-up.
> 
> Is the clocksource one independent? Then I can just pick it up now and
> route it through tip.

With the current Kconfig symbol setup, both should be selected by other
config symbols (CLKSRC_OF by ARM_SINGLE_ARMV7M and CLKSRC_MMIO by
ARCH_MXC).

Hence yes, this can go independently through tip.

--
Stefan

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/9] ARM: Initial support for Marvell Berlin SoCs
Date: Tue, 10 Dec 2013 20:33:00 +0100
Message-ID: <201312102033.00953.arnd@arndb.de>
References: <1383661723-17956-1-git-send-email-sebastian.hesselbarth@gmail.com> <52A674F1.7000104@gmail.com> <20131210191653.GA10105@quad.lixom.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131210191653.GA10105@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 10 December 2013, Olof Johansson wrote:
> > I started with mach-mvebu in the first RFC, but Berlin SoCs are from a
> > different business unit at Marvell and are more PXA compatible than
> > Orion/Kirkwood/Armada 370/XP. Most notably, they lack the "mbus" and
> > IP is either from PXA/MMP or Synopsys DW. Thomas Petazzoni and also
> > Jisheng Zhang from Marvell suggested to not put it into mvebu but
> > have a different mach folder instead.
> 
> Hmm, ok. Well, maybe later on we can look at aggregating them more again. It'd
> be nice to get fewer top-level platform directories per vendor.

I possibly a lot of directories just become empty in the long run and
we remove them once all all code has been subsystemized and drivered.

	Arnd

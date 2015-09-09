From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] MIPS: ath79: Add USB support on the TL-WR1043ND
Date: Wed, 09 Sep 2015 16:21:13 +0200
Message-ID: <1734684.IINudhV2s6@wuerfel>
References: <1441120994-31476-1-git-send-email-albeu@free.fr> <3589971.cbF7muh57v@wuerfel> <20150909161459.30cf580f@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20150909161459.30cf580f@avionic-0020>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 September 2015 16:14:59 Alban wrote:
> On Mon, 07 Sep 2015 15:20:42 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > On Tuesday 01 September 2015 17:23:10 Alban Bedel wrote:
> > > 
> > > this serie add a driver for the USB phy on the ATH79 SoCs and enable the
> > > USB port on the TL-WR1043ND. The phy controller is really trivial as it
> > > only use reset lines.
> > > 
> > 
> > Is this a common thing to have? If other PHY devices are like this, we
> > could instead add a simple generic PHY driver that just asserts all
> > its reset lines in the order as provided, rather than making this a
> > hardware specific driver that ends up getting copied several times.
> 
> I don't know how common it is. However I agree that a simple driver that
> can start a clock and toggle a few GPIO and/or reset would make sense.
> 
> However in the case of the ATH79 SoC some models have a reset line that
> is misused to force the PHY in sleep mode. Sadly this extra reset must
> be asserted for the PHY to work, so it wouldn't fit in such a generic
> design.
> 
> Still we could have such a generic driver and let the ATH79 driver
> build on top of it. Honestly that's what I wanted to do, but getting
> generic drivers with DT support accepted is not easy. That's why I went
> with this driver, it is technically inferior but much easier to get
> considered for merging.

Ok, fair enough. If we end up doing a more generic driver for this,
we can still consider adding the compatible string there, potentially
with some workaround for the sleep mode.

	Arnd

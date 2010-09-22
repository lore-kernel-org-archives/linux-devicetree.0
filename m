From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Regarding hw irq to Linux irq mapping on ARM
Date: Wed, 22 Sep 2010 11:51:11 +0100
Message-ID: <20100922105111.GA20986@sirena.org.uk>
References: <AANLkTi=6nCJnfLB1uc0uLGOvOm0CX_R=j-8GQWTzmmep@mail.gmail.com>
	<AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_@mail.gmail.com>
	<alpine.LFD.2.00.1009212342580.2416@localhost6.localdomain6>
	<AANLkTinrfJkK85v2epOY95YWaVyMBcxSF2xakHqsM7vh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinrfJkK85v2epOY95YWaVyMBcxSF2xakHqsM7vh@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jeremy.kerr@canonical.com>, Eric Miao <eric.miao@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Shaju Abraham <shaju.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 22, 2010 at 12:08:17AM -0300, Grant Likely wrote:
> On Tue, Sep 21, 2010 at 6:45 PM, Thomas Gleixner <tglx@linutronix.de> wrote:

> > Add all the I2C, SPI based irq extenders to that list. They seem to
> > pop up all over the place in rapid speed even in x86. We are happy
> > citizens of the embedded horror^Wuniverse now.

> *shudder*

> What's the irq handling latency on those?  Glad I haven't had to deal
> with any of them yet.

Milisecondish, but depends on bus congestion and bus type.  You need to
schedule a thread which then does one but typically more register I/O
operations on the device (read one or more IRQ status registers, and
typically write back to acknowledge the interrupts as well).  These tend
for obvious reasons to be for low volume interrupts like jack detection.

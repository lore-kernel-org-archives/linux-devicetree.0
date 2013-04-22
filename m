From: Will Deacon <will.deacon@arm.com>
Subject: Re: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Mon, 22 Apr 2013 17:41:12 +0100
Message-ID: <20130422164112.GB3076@mudshark.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, rob.
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Mon, Apr 22, 2013 at 04:27:22PM +0100, Lorenzo Pieralisi wrote:
> Code relying on the reg property size to be 4-bytes will break when
> dtb compiled for 64-bit kernels are used to boot a 32-bit system so
> kernel code relying on that (bogus) assumption must be updated properly.

So that code currently includes kvmtool, and I think it's unfair to break
it:

	- kvmtool can boot either 32-bit or 64-bit guests under a 64-bit
	  kernel and only AFF0 is exposed by the KVM host (containing the
	  vcpu id). This allows us to use a single cell for the reg
	  property, regardless of the guest payload.

	- It always sets the #address-cells property correctly, so if it
	  passes a 32-bit reg property, then #address-cells will be 0x1

	- This scheme worked fine with older kernels

Why can't we instead allow the kernel to zero extend single-cell CPU reg
properies on 64-bit systems? We can always check them against the logical
map and barf if they don't match what's sitting in the hardware, without
penalising machines which don't make use of the upper bits. Given that
people *will* run 32-bit OSs on 64-bit CPUs (a use-case which we allow), I
don't think penalising 64-bit software is the right thing to do.

Thoughts? I notice Catalin has some patches queued for arm64 which
unconditionally use of_property_read_u64, but I have a patch to honour the
#address-cells property instead.

Will

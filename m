From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/6] dts, kbuild: Implement support for dtb vendor subdirs
Date: Fri, 19 Sep 2014 15:08:56 +0100
Message-ID: <20140919140856.GG2295@e104818-lin.cambridge.arm.com>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
 <CAL1qeaGCeRyeKLo70E264bZcamOfBKoN9Y8_NDCjV5j4DoOw1Q@mail.gmail.com>
 <20140919123056.GC20170@rric.localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140919123056.GC20170@rric.localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robert Richter <rric@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Michal Marek <mmarek@suse.cz>, Arnd Bergmann <arnd@arndb.de>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Andrew Bresticker <abrestic@google.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 19, 2014 at 01:30:56PM +0100, Robert Richter wrote:
> On 16.09.14 20:49:18, Andrew Bresticker wrote:
> > > Robert Richter (6):
> > >   dts, arm64: Add dtbs_install make target
> > >   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
> > >   dts, arm/arm64: Remove dtbs build rules in sub-makes
> > >   dts, kbuild: Implement support for dtb vendor subdirs
> > >   dts, arm64: Move dts files to vendor subdirs
> > >   dts, arm: Remove $(MACHINE) variable from dtbs make recipes
> > 
> > I've tested this for arm64 and by adding a vendor sub-directory
> > locally for arm.  This series is also the base for my MIPS DT vendor
> > sub-directory series
> > (http://www.linux-mips.org/archives/linux-mips/2014-09/msg00217.html).
> > So, for the entire series,
> > 
> > Tested-by: Andrew Bresticker <abrestic@chromium.org>
> 
> Andrew, thanks for testing and great this also works on mips.
> 
> Anyone willing to take the patches for 3.18? Are any further acks
> needed?

For the arm64 bits in this series:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

I think the patches can be merged via arm-soc.

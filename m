From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Tue, 23 Apr 2013 10:09:43 +0100
Message-ID: <20130423090942.GA17593@mudshark.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130422164112.GB3076@mudshark.cambridge.arm.com>
 <20130422180057.GB17071@e102568-lin.cambridge.arm.com>
 <201304222118.41262.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201304222118.41262.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Mon, Apr 22, 2013 at 08:18:41PM +0100, Arnd Bergmann wrote:
> On Monday 22 April 2013, Lorenzo Pieralisi wrote:
> > > Thoughts? I notice Catalin has some patches queued for arm64 which
> > > unconditionally use of_property_read_u64, but I have a patch to honour the
> > > #address-cells property instead.
> > 
> > Basically you want me to rule out passing a dtb with cpus node having
> > #address-cells == 2 to a 32-bit kernel, correct ? Or put it another way:

No, I'm not proposing that! I don't see why we couldn't make the same change
for 32-bit kernels and honour the address-cells field there too.

> > 
> > - a 32-bit kernel must always get passed a dtb with cpus node
> >   #address-cells == 1. 
> 
> Why that? For other registers, we allow leading zeroes. This is
> already required for MMIO registers on LPAE capable machines.

Indeed, we should probably allow any old #address-cells and parse the reg
property accordingly. Of course, if any bits above bit 31 are non-zero, then
we should complain loudly on an AArch32 system.

> >   If the system is ARMv8 with CPUs having
> >   MPIDR_EL1[63:32] != 0x0, well, running 32-bit kernel on it is not
> >   the safest thing to do anyway.
> 
> I would assume the hypervisor to provide a virtual MPIDR_EL1 for
> a 32 bit kernel in that case.

Correct, but that doesn't help with the bare-metal/host case (where we will
need to scream, as described above).

Also, when I mentioned the mpidr check, I was just referring to the boot
CPU -- you're right about the secondaries.

Will

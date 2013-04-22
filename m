From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Mon, 22 Apr 2013 19:00:59 +0100
Message-ID: <20130422180057.GB17071@e102568-lin.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130422164112.GB3076@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130422164112.GB3076-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Content-Disposition: inline
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
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Will,

On Mon, Apr 22, 2013 at 05:41:12PM +0100, Will Deacon wrote:
> Hi Lorenzo,
> 
> On Mon, Apr 22, 2013 at 04:27:22PM +0100, Lorenzo Pieralisi wrote:
> > Code relying on the reg property size to be 4-bytes will break when
> > dtb compiled for 64-bit kernels are used to boot a 32-bit system so
> > kernel code relying on that (bogus) assumption must be updated properly.
> 
> So that code currently includes kvmtool, and I think it's unfair to break
> it:
> 
> 	- kvmtool can boot either 32-bit or 64-bit guests under a 64-bit
> 	  kernel and only AFF0 is exposed by the KVM host (containing the
> 	  vcpu id). This allows us to use a single cell for the reg
> 	  property, regardless of the guest payload.
> 
> 	- It always sets the #address-cells property correctly, so if it
> 	  passes a 32-bit reg property, then #address-cells will be 0x1
> 
> 	- This scheme worked fine with older kernels
> 
> Why can't we instead allow the kernel to zero extend single-cell CPU reg
> properies on 64-bit systems? We can always check them against the logical
> map and barf if they don't match what's sitting in the hardware, without
> penalising machines which don't make use of the upper bits. Given that
> people *will* run 32-bit OSs on 64-bit CPUs (a use-case which we allow), I
> don't think penalising 64-bit software is the right thing to do.
> 
> Thoughts? I notice Catalin has some patches queued for arm64 which
> unconditionally use of_property_read_u64, but I have a patch to honour the
> #address-cells property instead.

Basically you want me to rule out passing a dtb with cpus node having
#address-cells == 2 to a 32-bit kernel, correct ? Or put it another way:

- a 32-bit kernel must always get passed a dtb with cpus node
  #address-cells == 1. If the system is ARMv8 with CPUs having
  MPIDR_EL1[63:32] != 0x0, well, running 32-bit kernel on it is not
  the safest thing to do anyway.
- a 64 bit kernel can get passed a dtb blob with configurable
  #address-cells [1,2]. If MPIDR_EL1[63:32] is == 0, #address-cells can be
  set to 1 and the OS must zero extend the reg property. #address-cells
  == 1 implies -> zero extension required in the OS.

It makes sense. I disagree on the check you mentioned, we are not able
to probe MPIDR_EL1, so if the kernel gets passed wrong reg values we have
a problem, logical_map depends on DT, if DT assumes MPIDR_EL1[63:32] is
0 but it is not there is no way we can recover.

I will update the bindings and arm32 parsing code if nobody objects.

Lorenzo

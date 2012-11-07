From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Wed, 7 Nov 2012 15:35:30 +0000
Message-ID: <20121107153529.GT23305@mudshark.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106215044.GB21764@mudshark.cambridge.arm.com>
 <20121107102349.GC17831@e102568-lin.cambridge.arm.com>
 <20121107110542.GH23305@mudshark.cambridge.arm.com>
 <20121107120052.GD17831@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121107120052.GD17831-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2012 at 12:00:52PM +0000, Lorenzo Pieralisi wrote:
> On Wed, Nov 07, 2012 at 11:05:42AM +0000, Will Deacon wrote:
> > No, I was thinking about what happens if the devicetree doesn't contain an
> > mpidr property that matches the boot cpu. In this case, we will fail to
> > assign logical ID 0, right? If this happens, we should complain about an
> > invalid devicetree and try to fall back on the logical_map that was
> > generated earlier on.
> 
> Good point. What I could do, I can assign the MPIDR of the boot CPU to
> the logical index 0 before even starting to parse the DT (that's what it
> is done in smp_setup_processor_id(), with a couple of twists). Then, if I
> find a node that matches the boot CPU mpidr I just skip over it. This
> way the boot CPU MPIDR will always be correct the only difference with
> the current approach will be that instead of generating the secondaries
> MPIDRs we will read them from DT.

That should work, although I'm not sure why you can't just give up
altogether and use the initial mapping from smp_setup_processor_id?

> The problem with this approach is that if we need a pointer (phandle) to the
> boot CPU DT node through the MPIDR and the boot CPU node is botched or missing
> we still behave as if the DT CPU nodes were ok.

Does any code do this? Wouldn't it be much better to lookup logical CPU 0 if
you want to find anything out about the boot CPU?

> I think I'd better stick a warning condition in there if the boot CPU
> node is not present or botched (from a MPIDR perspective at least).

Definitely!

Will

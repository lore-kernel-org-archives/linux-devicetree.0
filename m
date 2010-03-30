From: "Dave P. Martin" <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Subject: RE: RFC: ARM Boot standard for passing device tree blob
Date: Tue, 30 Mar 2010 14:32:24 +0100
Message-ID: <000001cad00d$6f7f0cb0$4044010a@Emea.Arm.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
	<fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
	<alpine.LFD.2.00.1003261435460.694@xanadu.home>
	<fa686aa41003261252u7dc31bb6nca2e77ae8feb4355@mail.gmail.com>
	<20100326230343.GC29179@n2100.arm.linux.org.uk>
	<000001cacf32$66d4b190$4044010a@Emea.Arm.com>
	<20100330002638.GI9876@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100330002638.GI9876-yetKDKU6eevNLxjTenLetw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Jamie Lokier' <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: 'Russell King - ARM Linux' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, David Rusling <David.Rusling-5wv7dgnIgG8@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Jamie Lokier [mailto:jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org] 
> Sent: 30 March 2010 01:27

[...]

> > It could be worth clarifying that the L1 I-cache is the 
> _only_ cache 
> > which is permitted to be enabled at kernel entry, and that 
> all other 
> > caches in the system must be disabled.
> 
> Catalin said that on some platforms, the L2 cache is 
> unavoidably enabled by the time of kernel boot and it cannot 
> be turned off.
> So the above cannot be satisfied.

OK, good catch--- that slipped my mind.

I think the real requirement is that the kernel needs to be able to do
I-side/D-side synchronisation at L1 (so that the kernel decompression phase
works).  Other than this, we shouldn't need to do anything except access RAM
until the device tree framework has discovered the cache configuration.

So it seems adequate to require that:

* The MMU must be off

* For architected caches (i.e., those managed via CP15 operations):
	* I-caches may be turned on
	* D-caches and unified caches must be clean, invalidated and turned
off

* For non-architectured caches (those managed via implementation-specific
mechanisms):
      * Wherever possible, these caches should be clean, invalidated and
turned off.  Otherwise:
	* external unified caches must be clean and invalidated (the common
case)
	* external Harvard caches must be clean, invalidated and turned off
(don't know if we have observed external Harvard caches in any design)

I'll try and get additional clarification from my side on whether we're
missing any important issue here.

Cheers
---Dave

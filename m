From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: of_iomap() matched with plan iounmap()
Date: Mon, 22 Aug 2011 16:07:25 +0200
Message-ID: <201108221607.25179.arnd@arndb.de>
References: <20110818170226.GA16721@huya.qualcomm.com>
	<201108191426.19152.arnd@arndb.de>
	<20110819.062609.1865751197015675220.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110819.062609.1865751197015675220.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 19 August 2011, David Miller wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Date: Fri, 19 Aug 2011 14:26:18 +0200
> 
> > We could of course change all existing users of of_iounmap on sparc to use
> > the simpler prototype, because it also just calls iounmap.
> 
> Check again, on sparc64 it needs the resource to release it.
> 
> Only the 32-bit version on sparc evaluates to just a plain iounmap().

Ok, I see.

On Friday 19 August 2011, David Brown wrote:
> What if we left the SPARC calls alone, and changed of_iomap() into
> of_dt_iomap() and could then make of_dt_iounmap().  Or, it could just
> be of_dt_map(), and of_dt_unmap().

I think at some point in the future, we will have a mass-renaming
of of_* to dt_* or similar, which would result in a silly name.

Also, the of_iomap() name is modeled after pci_iomap/pci_iomap.

How about renaming the sparc of_ioremap/of_iounmap pair to
resource_iomap/resource_iounmap? I believe that it is not
(any more) tied to device tree based probing at all, and also
could be useful for other subsystems on non-sparc architectures.

	Arnd

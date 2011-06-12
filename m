From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 16:19:31 +0100
Message-ID: <20110612151931.GK10283@n2100.arm.linux.org.uk>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612112219.GD16318@ibawizard.net>
	<20110612115820.GF10283@n2100.arm.linux.org.uk>
	<201106121615.24059.arnd@arndb.de>
	<20110612145751.GA4013@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110612145751.GA4013-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 12, 2011 at 08:57:51AM -0600, Grant Likely wrote:
> On Sun, Jun 12, 2011 at 04:15:23PM +0200, Arnd Bergmann wrote:
> > But when you have both atag and DT and the atag overrides the DT, that
> > means we have incorrect information in the DT, and code might later
> > rely on that information.
> > 
> > IMHO when we allow passing a DT to a kernel while booting from an
> > existing boot loader that only knows about atag, the code that loads
> > the DT should be responsible for updating the DT with the atag information,
> > not pass two conflicting sets of data into the actual kernel.
> 
> I completely agree here.  I /started/ from the position that ATAGs and
> DTB would coexist, and after extensive debate[1] my opinion turned around
> to it should be one or the other.  Otherwise there are all kinds of
> questions about accuracy of the information and which takes
> precedence.

And we've ended up with a fucked up situation which is extremely
fragile, and actually makes me _NOT_ want to convert any existing
platforms to use DT in the least.

This I view as a fundamental blocker which needs addressing before
anyone can make use of DT on ARM.

DT is _not_ the authoritive source of information on systems with
ATAGs.

Imagine this situation: you have your PC.  It provides memory information
through the E820 interface.  You convert your kernel to use DT and it
only uses the information passed from the DT blob, which it loaded as
part of your kernel off disk.

However, your RAM size has changed.  Should the kernel continue to believe
the memory information found in the encapsulated DT blob, or should it
continue to get it from the E820 interface?

It's precisely the same problem here.  The E820 interface _has_ to take
precedence because that is the _authoritive_ source of information.

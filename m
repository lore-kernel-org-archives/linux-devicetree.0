From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Mon, 14 Jun 2010 08:38:28 +0100
Message-ID: <20100614073828.GA6095@n2100.arm.linux.org.uk>
References: <AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
	<4C13430B.5000907@firmworks.com>
	<1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop>
	<4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<1276408773.1962.574.camel@pasglop>
	<AANLkTinwL0XtMNG13inr_1UliOlqZkyr4dlvG-ZGL9JT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinwL0XtMNG13inr_1UliOlqZkyr4dlvG-ZGL9JT-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 13, 2010 at 11:23:45PM -0600, Grant Likely wrote:
> >> Or perhaps the MMU and caches can be turned off for the duration of the
> >> callback.
> >> I don't have the details of ARM MMUs and caches reloaded into my head
> >> yet. =A0Maybe next week...

We've had these kinds of questions in the past.  Doing what you're asking
above is not really an option - it requires:

1. disable all IRQs
2. setup 1:1 MMU mappings for code to turn off MMU
   (requires new page table)
3. disable imprecise exceptions
4. flush caches and TLBS
5. jump to 1:1 mapping area for code to disable MMU
6. disable caches and mmu
7. call function
8. flush caches and TLBs
9. re-enable caches and mmu
10. re-enable imprecise exceptions
11. switch back to original MMU mappings
12. re-enable all IRQs

This is fine if you don't care at all about interrupt latency.
Unfortunately, most people do care about interrupt latency because
that directly affects interactivity and system performance.  The
called function could not enable interrupts or exceptions - as the
CPU vectors are in virtual space, disabling the MMU effectively
makes them disappear.

Moreover, with the MMU and caches disabled, the CPU performance is
extremely poor, so the called function will run slowly.

So, disabling the MMU isn't really viable.

Now, if the external code was fully PIC, we could then run it with
the MMU enabled.  However, this wouldn't really help - the external
code could not access any devices without knowledge of how the kernel
setup the V:P translations.

So you'd need to pass some kind of data structure giving locations of
devices to the called code - but then what if the kernel doesn't have
the device mapped?

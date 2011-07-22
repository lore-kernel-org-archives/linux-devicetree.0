From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: Same parts of DT being probed twice
Date: Fri, 22 Jul 2011 20:22:17 +0100
Message-ID: <CAGq3pz4xYhA751FJ9P4_Fg9EuzWFTiYaqCG_rG3nLBhb8rzpQA@mail.gmail.com>
References: <CAGq3pz5V0psn1QgUV7VGKCusc4kO+128OQAzUfmqSec4i2R8vw@mail.gmail.com>
	<20110722173522.GA5974@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110722173522.GA5974-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22 July 2011 18:35, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> of_platform_bus_probe() from the root of the tree is the wrong
> approach for registering 'deep' devices. =A0of_platform_bus_probe() only
> knows how to deal with platform_devices. =A0The moment something
> non-trivial appears in between, it no longer works. =A0What you really
> want from the description you've given is the following struct device
> hierarchy:
>
> platform_device(representing the pci bus)
> =A0 --->pci_dev(representing the isa bridge)
> =A0 =A0 =A0--->isa_device(representing the "via,vx855-gpio")
>
> To make this work, of_platform_bus_probe() creates the pci bus
> instance. =A0The pci bus /driver/ is responsible for creating the isa
> bridge, and similarly the isa driver must be responsible for creating
> the gpio controller instance. =A0Most of the pci support code that you
> need should already be there, but I haven't looked at what ISA is
> doing.

OK, thanks for the explanation.

In this case we don't need to create a platform_device for the vx855
gpio device - it is already handled through probing of the PCI bus
which is discovered through other means. I only added it in the list
as an item inbetween the root and gpio-leds.

> The gpio-leds node should be at the root of the tree, and everything
> gets a lot easier if you switch to using the new of_platform_populate()
> instead of of_platform_bus_probe().

That sounds more sensible. I'll check with our firmware guy when he
gets back from his break and continue from there.

However, even after fixing that, we will still be left with the
generic x86 code probing pci and isa. This creates a huge array of
platform devices (which are useless, or are devices that we already
have other device instances for), and seems to take quite a while
during boot. Is commit 9079b35364e75 wrong in some way? It has your
acked-by, but seems to go against what you wrote above.

Thanks,
Daniel

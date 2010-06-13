From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Sun, 13 Jun 2010 15:48:07 +1000
Message-ID: <1276408087.1962.552.camel@pasglop>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
	<33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
	<4C13430B.5000907@firmworks.com> <1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop> <4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2010-06-12 at 23:07 -0600, Grant Likely wrote:
> 
> What is needed to keep OFW alive?  I've got no problem with doing so
> if it isn't invasive, and as long as the same boot entry interface can
> be used.

Well, no. OF has a well defined "client interface" which is what gets us
in prom_init.c on powerpc when r5 is non NULL. You can use it to do
things like access devices or the device-tree.

We use that to suck the device-tree, which we flatten, and then re-enter
the kernel with the "common" entry interface.

If you want to keep OF alive, you -can- probably do that too, but it's
more tricky. You need to keep the memory where OF resides reserved, OF
might need special MMU translations, you maybe need to install hooks in
OF itself for it to be able to manipulate some of those, etc...

> What is the use-case for having a dynamic device tree?  I can see
> keeping OFW alive being useful for some debug facilities, but once the
> kernel has started, I'm really not interested in relying on firmware
> to manage the hardware.  (but then again it's no secret that I'm
> suspicious of anything that depends on runtime interaction with
> firmware).

As we all are :-)

I see one genuine use of dynamic device-tree though, which is in a
virtualized environment (where the host can be Linux itself). Hotplug
can then be a matter of getting new nodes & properties fed down to the
OS by the hypervisor/firmware.

pSeries somewhat works like that, but using weirdo rtas calls. We could
do something saner for kvm or whatever other hypervisors we have some
amount of control onto, where bits of compiled dtb can be handed down
representing a sub-hierarchy of the tree.

Cheers,
Ben.

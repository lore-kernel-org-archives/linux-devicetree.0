From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: Device tree bindings for linux ramoops use
Date: Fri, 6 Jan 2012 16:58:23 +0000
Message-ID: <20120106165823.GB3466@page>
References: <CAOesGMiKBQM61DkLFoTcvMFWV2UCgomLQYDX65_Tkmtoy_hGCg@mail.gmail.com>
 <4F06A120.8080505@firmworks.com>
 <CAOesGMgstHqtTo0X9Y-SSU+VTUxYRrXW=3h=EhH-biMeDXik8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgstHqtTo0X9Y-SSU+VTUxYRrXW=3h=EhH-biMeDXik8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2012 at 08:28:51AM -0800, Olof Johansson wrote:
> On Thu, Jan 5, 2012 at 11:22 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> >
> > On 1/5/2012 6:39 PM, Olof Johansson wrote:
> >>
> >> Hi,
> >>
> >> I'm considering how to best describe the data that ramoops needs in
> >> the device tree.
> >>
> >> The idea is really about describing a memory area that is (likely to
> >> be) nonvolatile across reboots. Said area is not to be included in the
> >> regular memory map of the system (i.e. not covered by /memory).
> >>
> >> I have a few options on where to do it. It's not really a hardware
> >> device per se, so it's a gray area for the device tree alltogether.
> >>
> >> How about something like?
> >>
> >> compatible = "linux,ramoops"
> >> linux,ramoops-start =<start address of preserved ram>
> >> linux,ramoops-size = ...
> >> linux,ramoops-record-size = ...
> >> linux,ramoops-include-oopses = ... (this one is a bit of a corner
> >> case, it's truly a software setting -- probably leave it out)
> >>
> >> Anybody have a better idea?
> >
> >
> > If it is addressable, it should appear as a device node underneath the node
> > that creates the address space in which it appears, and the start and size
> > should be described by a "reg" property.
> 
> A yes, of course.
> 
> I got on the wrong track due to the lack of use of resources in the
> linux platform_driver.

But you still need some ramoops specific configuration though right?  
Could this be represented with a generic binding for the onchip RAM as 
has already proposed then inside the chosen node something like:

	chosen {
		ramoops {
			linux,ramoops-record-size = <12>;
			linux,ramoops-include-oopses = <1>;
			/* phandle to ram, offset, size */
			linux,ramoops-ram = <&iram 0x1000 0x200>;
		};
	};

to decouple the runtime configuration from the hardware binding?

Jamie

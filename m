From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree bindings for linux ramoops use
Date: Fri, 6 Jan 2012 15:05:30 -0700
Message-ID: <20120106220530.GI7457@ponder.secretlab.ca>
References: <CAOesGMiKBQM61DkLFoTcvMFWV2UCgomLQYDX65_Tkmtoy_hGCg@mail.gmail.com>
 <4F06A120.8080505@firmworks.com>
 <CAOesGMgstHqtTo0X9Y-SSU+VTUxYRrXW=3h=EhH-biMeDXik8g@mail.gmail.com>
 <20120106165823.GB3466@page>
 <CAOesGMi54byaL6K_aJU0rm9yLMX-GngydyyjHpYC9_2BvQwEoA@mail.gmail.com>
 <20120106175357.GC3466@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120106175357.GC3466@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2012 at 05:53:57PM +0000, Jamie Iles wrote:
> On Fri, Jan 06, 2012 at 09:47:22AM -0800, Olof Johansson wrote:
> > On Fri, Jan 6, 2012 at 8:58 AM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> > > On Fri, Jan 06, 2012 at 08:28:51AM -0800, Olof Johansson wrote:
> > >> On Thu, Jan 5, 2012 at 11:22 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> w=
rote:
> > >> >
> > >> > On 1/5/2012 6:39 PM, Olof Johansson wrote:
> > >> >>
> > >> >> Hi,
> > >> >>
> > >> >> I'm considering how to best describe the data that ramoops needs =
in
> > >> >> the device tree.
> > >> >>
> > >> >> The idea is really about describing a memory area that is (likely=
 to > >> >> be) nonvolatile across reboots. Said area is not to be included=
 in the
> > >> >> regular memory map of the system (i.e. not covered by /memory).
> > >> >>
> > >> >> I have a few options on where to do it. It's not really a hardware
> > >> >> device per se, so it's a gray area for the device tree alltogethe=
r.
> > >> >>
> > >> >> How about something like?
> > >> >>
> > >> >> compatible =3D "linux,ramoops"
> > >> >> linux,ramoops-start =3D<start address of preserved ram>
> > >> >> linux,ramoops-size =3D ...
> > >> >> linux,ramoops-record-size =3D ...
> > >> >> linux,ramoops-include-oopses =3D ... (this one is a bit of a corn=
er
> > >> >> case, it's truly a software setting -- probably leave it out)
> > >> >>
> > >> >> Anybody have a better idea?
> > >> >
> > >> >
> > >> > If it is addressable, it should appear as a device node underneath=
 the node
> > >> > that creates the address space in which it appears, and the start =
and size
> > >> > should be described by a "reg" property.
> > >>
> > >> A yes, of course.
> > >>
> > >> I got on the wrong track due to the lack of use of resources in the
> > >> linux platform_driver.
> > >
> > > But you still need some ramoops specific configuration though right?
> > > Could this be represented with a generic binding for the onchip RAM as
> > > has already proposed then inside the chosen node something like:
> > >
> > > =A0 =A0 =A0 =A0chosen {
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ramoops {
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,ramoops-record-s=
ize =3D <12>;
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,ramoops-include-=
oopses =3D <1>;
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* phandle to ram, off=
set, size */
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,ramoops-ram =3D =
<&iram 0x1000 0x200>;
> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> > > =A0 =A0 =A0 =A0};
> > >
> > > to decouple the runtime configuration from the hardware binding?
> > =

> > Only the ramoops-include-oopses is really the runtime configuration,
> > so that alone in /chosen could be a good idea. But I would rather have
> > the "partition" described as a device with a compatible field that the
> > driver can bind against.
> =

> I can see why that would be nice too, but to me this feels different to =

> say MTD partitions as it really is Linux specific and it doesn't seem =

> unreasonable that someone may want to include ramoops support when =

> debugging something, but for another application, use the whole of the =

> onchip RAM as a buffer.  Requiring modifications for the DT on identical =

> hardware platforms but different applications doesn't feel quite right =

> to me.  Seeing as chosen is special that doesn't feel too bad.

I agree.  This is pretty low level core stuff.  The actual ramoops
region could be anywhere as Olof says; in regular ram, in sram,
somewhere else, but the common case is really just memory mapped ram
that Linux needs to be told "hands off".  I would be fine with
properties in /chosen and using /memreserve/ sections to inhibit the
kernel from using them if they are in main memory.  There can still be
nodes for the actual device, but that doesn't need to be explicitly
connected to the ramoops properties in /chosen.  Implicitly by base
address is fine by me.

g.

> =

> Jamie
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

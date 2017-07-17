From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Mon, 17 Jul 2017 14:12:59 +0100
Message-ID: <20170717131259.GJ26488@arm.com>
References: <20170715003836.GA113132@beast>
 <CAKv+Gu9n0cpznPxiQPYj0_+DALXTdevbvoYgM87A7ej2kdcizA@mail.gmail.com>
 <CAGXu5j+fX-E9ngW3MBhRFgpKBLzpyhR0TCx=ovosXOAqogzMMA@mail.gmail.com>
 <CAKv+Gu82xiv0Yy79Hb=JCqmJNYoxxSt5HRu5j4TeSeznCvg_+w@mail.gmail.com>
 <20170717115557.GA29650@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170717115557.GA29650@remoulade>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Redfearn <matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 12:56:10PM +0100, Mark Rutland wrote:
> On Sun, Jul 16, 2017 at 05:42:25PM +0100, Ard Biesheuvel wrote:
> > On 16 July 2017 at 03:13, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > On Sat, Jul 15, 2017 at 5:42 AM, Ard Biesheuvel
> > > <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > >> (+ Mark, Will, Catalin)
> > >>
> > >> On 15 July 2017 at 01:38, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >>> Document then /chosen/kaslr-seed property (and its interaction with the
> > >>> EFI_RNG_PROTOCOL API).
> > >>>
> > >>> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
> > >>>  1 file changed, 20 insertions(+), 2 deletions(-)
> > >>
> > >> For the textual changes:
> > >>
> > >> Acked-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>
> > >> *However*, documenting the /chosen/kaslr-seed property promotes it
> > >> from a stub<->kernel private interface to an external ABI between the
> > >> kernel and the bootloader, and we need to reach agreement on whether
> > >> doing so is desirable first IMHO.
> > >
> > > Oh! I thought that was the point (having a bootloader provide kaslr
> > > entropy). And that in the EFI case, it was the stub doing it.
> > 
> > It was the opposite, actually,  The /chosen node is the most
> > appropriate way for the EFI stub to communicate a seed value to the
> > kernel proper, given how it is needed extremely early in the boot.
> > (Using UEFI config tables like we do for the /dev/random seed is not
> > possible for this)
> > 
> > So as a side effect, other bootloaders can use the same mechanism. I'm
> > fine with that, but it needs to be an explicit decision by the
> > maintainers imo.
> 
> I was under the impression that we'd already assumed other bootloaders could
> set this, so I don't have a problem promoting this to a defined public
> interface.
> 
> I guess we just need Will and Catalin to agree.

If we expose an undocumented property, then I think it's ABI the moment
somebody starts using it, irrespective of whether or not we document it
later. For example, if somebody outside of the stub was using this and we
changed the ABI in a way that broke things for them, I'd have a hard time
defending that.

So Documentation is good, but I don't think it really changes anything wrt
ABI guarantees.

Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

(I'm assuming this goes via some DT tree).

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

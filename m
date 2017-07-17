From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Mon, 17 Jul 2017 12:56:10 +0100
Message-ID: <20170717115557.GA29650@remoulade>
References: <20170715003836.GA113132@beast>
 <CAKv+Gu9n0cpznPxiQPYj0_+DALXTdevbvoYgM87A7ej2kdcizA@mail.gmail.com>
 <CAGXu5j+fX-E9ngW3MBhRFgpKBLzpyhR0TCx=ovosXOAqogzMMA@mail.gmail.com>
 <CAKv+Gu82xiv0Yy79Hb=JCqmJNYoxxSt5HRu5j4TeSeznCvg_+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu82xiv0Yy79Hb=JCqmJNYoxxSt5HRu5j4TeSeznCvg_+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Kees Cook <keescook@chromium.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Matt Redfearn <matt.redfearn@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 16, 2017 at 05:42:25PM +0100, Ard Biesheuvel wrote:
> On 16 July 2017 at 03:13, Kees Cook <keescook@chromium.org> wrote:
> > On Sat, Jul 15, 2017 at 5:42 AM, Ard Biesheuvel
> > <ard.biesheuvel@linaro.org> wrote:
> >> (+ Mark, Will, Catalin)
> >>
> >> On 15 July 2017 at 01:38, Kees Cook <keescook@chromium.org> wrote:
> >>> Document then /chosen/kaslr-seed property (and its interaction with the
> >>> EFI_RNG_PROTOCOL API).
> >>>
> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
> >>>  1 file changed, 20 insertions(+), 2 deletions(-)
> >>
> >> For the textual changes:
> >>
> >> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> >>
> >> *However*, documenting the /chosen/kaslr-seed property promotes it
> >> from a stub<->kernel private interface to an external ABI between the
> >> kernel and the bootloader, and we need to reach agreement on whether
> >> doing so is desirable first IMHO.
> >
> > Oh! I thought that was the point (having a bootloader provide kaslr
> > entropy). And that in the EFI case, it was the stub doing it.
> 
> It was the opposite, actually,  The /chosen node is the most
> appropriate way for the EFI stub to communicate a seed value to the
> kernel proper, given how it is needed extremely early in the boot.
> (Using UEFI config tables like we do for the /dev/random seed is not
> possible for this)
> 
> So as a side effect, other bootloaders can use the same mechanism. I'm
> fine with that, but it needs to be an explicit decision by the
> maintainers imo.

I was under the impression that we'd already assumed other bootloaders could
set this, so I don't have a problem promoting this to a defined public
interface.

I guess we just need Will and Catalin to agree.

FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

As an aside, we might want to make a split between /chosen properties which are
Linux-specific (e.g. this), and those which are somewhat generic (e.g.
stdout-path), since other OSs may/should respect those generic ones.

Mark.

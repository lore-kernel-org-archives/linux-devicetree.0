From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Sun, 13 Jun 2010 23:23:45 -0600
Message-ID: <AANLkTinwL0XtMNG13inr_1UliOlqZkyr4dlvG-ZGL9JT@mail.gmail.com>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
	<33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
	<4C13430B.5000907@firmworks.com> <1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop> <4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com> <1276408773.1962.574.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1276408773.1962.574.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

[cc'ing linux-arm-kernel]

On Sat, Jun 12, 2010 at 11:59 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Sat, 2010-06-12 at 19:39 -1000, Mitch Bradley wrote:
>
>> Minimally, OFW needs to own some memory that the kernel won't steal.
>> OFW on ARM is position-independent, so it can be tucked up at the top of=
 memory
>> fairly easily.
>
> Amen :-)
>
>> To call back into OFW, the virtual mapping for that memory needs to be
>> reestablished.
>
> That's a nasty part unless ARM provides a usable "real mode" which
> allows MMIO accesses, which I -think- it does. I don't remember the
> details that much.
>
> Maybe we could define a binding tho where we could somewhat standardize
> the portion of the virtual address space used by OF. IE. from the top of
> the address space down to the max size it requires. It might require
> some games to play with the fixmap on ARM side tho...
>
> Another option would be something more RTAS-like where a specific call
> can be done by the OS itself to 'relocate' (not physically but virtually
> in this case) OF into the OS preferred location. Be prepared to have
> multiple of these called though as kernels kexec into one another.

This sounds reasonable to me.

>> Or perhaps the MMU and caches can be turned off for the duration of the
>> callback.
>> I don't have the details of ARM MMUs and caches reloaded into my head
>> yet. =A0Maybe next week...
>
> Forgot most of it too. Looks like it's about time I read the ARM
> architecture again, this sounds like fun :-)
>
> BTW. I notice no ARM list is CCed on this discussion ... maybe we should
> fix that ?

cc'ing linux-arm-kernel in all my replies

>> Also, for debugging, OFW typically needs access to a UART. =A0If the OS =
is
>> using the UART, it's often possible for OFW to use it just by turning of=
f interrupts and
>> polling the UART.
>
> That might not be a big deal unless the OS plays with the clocks which
> it -does- tend to do. It might be worth defining some kind of property
> OF puts in the UART node to inform the OS not to play games and keep
> that one enabled, though that could affect power management, so might
> need to be conditional on some nvram option (debug-enabled?)
>
>> The use case for a dynamic device tree is not compelling.
>
> Right, generally not, except in virtualized environments (see my other
> response).
>
> Now, the -one- thing that WILL happen if we have something like OF that
> remains alive is of course vendors will try to use it as a HAL. You know
> as well as I do that it -will- happen :-)
>
> There's two reasons that typically happen. The misguided "good" one
> which is to think it helps keeping a single/more maintainable kernel
> image by stuffing the horrible details of nvram, rtc, etc.. access,
> poweron/off GPIOs, clock control, etc... in there. The "bad" one which
> is to stash code you don't want to show the source code for (codec
> control, etc...).
>
> This is bad for so many reasons that I don't think I need to even start
> listing them :-) So that's something that will have to be strongly kept
> in check and fought I suspect.

With a stout 2x4 if needed.  I'm going to try very hard to dissuade
this.  Yet another reason why I only what one method for passing the
device tree into the kernel.

> To some extent, in fact, doing that sort of stuff in OF or even in RTAS
> like we do on power is even worse than ACPI-like tables. At least with
> those tables, the interpreter is in the operating system, thus can run
> with interrupts on, scheduling on, etc... With RTAS, or client interface
> calls, you'll end up with potentially huge slumps of CPU time "lost"
> into the bowels of the firmware.

Unfortunately, on the newer ARM SoCs, binary blobs are all over the
place anyway.  :-(

g.

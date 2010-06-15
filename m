From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Tue, 15 Jun 2010 12:02:24 +1000
Message-ID: <20100615020224.GK9323@yookeroo>
References: <4C13430B.5000907@firmworks.com>
	<1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop>
	<4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>
	<20100614124438.GF9323@yookeroo>
	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1006141044510.13427-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 14, 2010 at 10:59:20AM -0400, Nicolas Pitre wrote:
> On Mon, 14 Jun 2010, David Gibson wrote:
> =

> > On Sun, Jun 13, 2010 at 11:02:15PM -0600, Grant Likely wrote:
> > [sni]
> > > > That's sort of a self-fulfilling prophecy. =A0If the OS doesn't tru=
st the
> > > > firmware, there is no pressure for the firmware to "get it right".
> > > =

> > > Firmware will not get it right.  Period.  There will always be
> > > something wrong.  It is never right on PCs.  It will never be right on
> > > the other architectures.
> > =

> > Yes, yes, yes.  And there is a great deal of empirical evidence to
> > back that assertion.
> > =

> > >  That goes for OSes too, but upgrading an OS
> > > isn't as risky as upgrading firmware.  That isn't to say that it can't
> > > be close, but every firmware feature that the OS depends on is a
> > > feature that could force a risky firmware upgrade when the bug in it
> > > is discovered.
> > =

> > Indeed.  In fact, the general rule of thumb is really "put as much as
> > possible into the most easily replaced layer of the stack".  This is,
> > incidentally, why I've always been dubious about simple firmwares
> > supplying a flattened device tree rather than including the device
> > tree template in the kernel, cuboot style.
> =

> The biggest advantage, IMHO, for adding DT to ARM, is actually to =

> decouple the hardware config information and the kernel.  If in the end =

> the DT has to be shipped in the kernel then we're losing all this =

> advantage over the current state of things on ARM which still works =

> pretty well otherwise.

Right, which is why I'm just dubious, not dead against it.  If
firmware supplies a device tree that's so awful you have to replace
most of it, then you haven't won much over having a kernel wrapper
which uses ad-hoc logic to detect the board type from whatever random
clues the firmware leaves and selects a device tree from it's library
of them based on that.  On ARM this sort of approach is probably more
effective than powerpc, even, since you could use the machine number
to select from a bag of canned device trees and still have a
multi-board kernel.

> In the best case, the simple firmware simply has to retrieve the =

> flattened device tree from flash, and pass it to the kernel just like =

> some anonymous blob.  And the simple firmware only needs to provide a =

> way for that DT blob to be updatable, like through an upload of a =

> replacement blob that was prepared offline.  Just like a ramdisk image =

> or the like.

Yes, having the firmware DT independently updateable makes most of my
concerns about it go away.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

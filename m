From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/7] Add utilfdt for common functions
Date: Tue, 20 Sep 2011 18:12:41 +1000
Message-ID: <20110920081241.GM29197@yookeroo.fritz.box>
References: <1316463668-976-1-git-send-email-sjg@chromium.org>
	<1316463668-976-3-git-send-email-sjg@chromium.org>
	<20110920010859.GE29197@yookeroo.fritz.box>
	<CAPnjgZ0U_gYkQQR14UNZ0tAOT8jYxzwi_mEYXsT134m14m=8Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0U_gYkQQR14UNZ0tAOT8jYxzwi_mEYXsT134m14m=8Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 08:54:02PM -0700, Simon Glass wrote:
> Hi David,

[snip]
> > Building a shared library out of this is complete overkill. =A0In fact,
> > so is building a .a of it. =A0This is not an exported library for
> > general use, but just an internal mini-"library" for use by the fdtget
> > and fdtput functions. =A0Just have them both link with utilfdt.o.
> =

> I guess I misunderstood your comment on this patch in v2, referring I
> thought to the function to read an fdt:

Yeah, sorry, I don't think I was very clear.

> > Yes, you'll need to fix that for a general library version.  It
> > should indeed return an error rather than dying.
> =

> I took that to me it should be in a library, and of course it couldn't
> be in libfdt due to the OS use...

Well, I've contemplated adding such things to libfdt.  It should be
workable as long as they're in a separate module which could be left
out when building for constrained environments.  But I'd be much
pickier about the details of the interface in that case, I don't think
we're quite ready for this yet.

> It is used by the tests, ftdump, fdtget and fdtput. I didn't really
> want the tests to have to have -I.. and linking ../utilfdt.o.
> =

> So should I just make in an object file in the root that everything
> except dtc links with?

You know what.  On further consideration, just drop it into util.c,
which already has random handy but not exported functions shared
between dtc and ftdump.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

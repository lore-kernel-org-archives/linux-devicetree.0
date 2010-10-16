From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Sat, 16 Oct 2010 18:10:10 +1100
Message-ID: <20101016071010.GG5036@yookeroo>
References: <21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
	<b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
	<AANLkTinPWv94Xoz+mDxiE=KujQYAyQj9PsPWHEORypJ3@mail.gmail.com>
	<eba820f8-3e4f-4d57-9024-39cc562a99eb@VA3EHSMHS012.ehs.local>
	<AANLkTikWfMXEbdwFY6FNoMwuD6fC74Kohtr3QRJqSrM0@mail.gmail.com>
	<ed27a45d-3607-41e3-831f-1d7e3dd44379@SG2EHSMHS003.ehs.local>
	<AANLkTikzyDFiQZzPmeos6pf_DS33RvkfER+Mz0jceSJy@mail.gmail.com>
	<4da0557a-d204-4e38-8a82-b0996a9a5af1@SG2EHSMHS007.ehs.local>
	<AANLkTinzf3vhs_OUUeiVYOFbOPLFHA+dei810H2gyDGS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinzf3vhs_OUUeiVYOFbOPLFHA+dei810H2gyDGS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 05:58:06PM -0600, Grant Likely wrote:
> On Fri, Oct 15, 2010 at 2:20 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > The ambiguity between
> > bar; (referring to a property)
> > and
> > /trim-node/ bar; (referring to a node)
> >
> > Seems awkward, but perhaps unavoidable. =A0At the very least, I don't h=
ave anything better to suggest.. :)
> >
> > perhaps in an ideal world, open firmware would originally have distingu=
ished these by
> > having
> >
> > bar =3D; =A0 // Create an empty property
> > bar {}; =A0// Create an empty node
> >
> > or something...
> =

> Actually, none of this is OpenFirmware related.  This syntax was
> created for use with dtc which is completely independent of
> OpenFirmware.  Only the device tree structure and usage conventions
> are shared with dtc.

That's true.  However, I'm pretty sure there was actually a reason
related to existing OF usage why I made the syntax for an empty
property 'thing;' rather than 'thing =3D;'.  I no longer remember what
it was, though.

> However, we've already got a large userbase so making an incompatible
> source file format change would be unbelievably painful.

That too.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

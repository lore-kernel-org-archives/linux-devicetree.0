From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Wed, 3 Mar 2010 10:12:03 +1100
Message-ID: <20100302231203.GO23435@yookeroo>
References: <20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<fa686aa41003011349i367a423cx2c59953e6afc9b75@mail.gmail.com>
	<72f497af-412c-4a05-90c2-5df0be00d93f@VA3EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <72f497af-412c-4a05-90c2-5df0be00d93f-+Ck8Kgl/v09CYczPSvLbDrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 01, 2010 at 02:17:47PM -0800, Stephen Neuendorffer wrote:
> > -----Original Message-----
> > From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of G=
rant Likely
> > Sent: Monday, March 01, 2010 1:49 PM
> > To: Stephen Neuendorffer
> > Cc: Yoder Stuart-B08248; Wood Scott-B07421; devicetree-discuss@ozlabs.o=
rg; John Williams; Jeremy Kerr
> > Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
[snip]
> > This is never legal.  If deleting by label, it must be at the top
> > level.  It doesn't make sense to use a label reference inside a node
> > block, since the node block is already supposed to define where you
> > are working in the tree.
> > =

> > > =A0 =A0 =A0 =A0delete(bar); // May or may not be Illegal, since don't=
 know what bar-label references
> > =

> > No longer an issue since the previous line is illegal.
> > =

> > Also, must be either delete-node() or delete-prop() since nodes and
> > properties can use the same names.
> =

> So, is it true that a tree which is overlayed on another tree can be
> independently verified to be independent of internal ordering?  This
> would be nice if so.

Hrm, yes and no.  Most of our tests for duplicate labels and so forth
are only performed after all the overlay/merging is completed.

Which brings up another inconsistency in the current processing.
Although:

	/ {
		foo =3D "bar";
		foo =3D "baz";
	};

is illegal and will cause an error, the way that merge_nodes() is
implemented means that the following will be accepted:

	/ {
	};
	/ {
		foo =3D "bar";
		foo =3D "baz";
	};

(and the foo property will have the final value "baz").

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

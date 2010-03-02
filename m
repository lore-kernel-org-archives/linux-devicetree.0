From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 2 Mar 2010 11:06:56 -0600
Message-ID: <20100302170656.GA1051@loki.buserror.net>
References: <20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<4B8C2C4C.8070901@freescale.com>
	<fa686aa41003011418x339884c9md61c49948b31a8d1@mail.gmail.com>
	<1012f9aa-1642-41ab-b8cd-a4ab4a7b269e@VA3EHSMHS024.ehs.local>
	<fa686aa41003011603w12c0a7f1y88b5fc7a008af1d5@mail.gmail.com>
	<f9885aa5-5c11-4118-9980-f17378d7cbd5@SG2EHSMHS004.ehs.local>
	<fa686aa41003011808h586e3dc3x11ef14af9c6e5fb8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41003011808h586e3dc3x11ef14af9c6e5fb8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 01, 2010 at 07:08:19PM -0700, Grant Likely wrote:
> > Yes... I think this should just be allowed... or at the very least I do=
n't see a
> > reason to make this an error... =A0It does occur to me that it might be=
 useful to
> > explicitly note the 'extension' of a previous node, which asserts that =
it *must*
> > exist. =A0i.e.
> >
> > foo {
> > =A0 =A0 =A0 =A0bar + {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bar =3D 3;
> > =A0 =A0 =A0 =A0}
> > }
> >
> > Here it is explicitly clear that bar is an incomplete definition?
> =

> hmmm... I don't think I like this so much, and I don't yet see a use
> case where this is really a required feature.

I could see it being useful if instead of being an error if bar (the node)
doesn't already exist, it is ignored.  In other words, "if there is a bar,
add this property to it, but don't create a new bar just for me".

-Scott

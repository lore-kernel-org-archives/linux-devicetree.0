From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 1 Mar 2010 16:42:06 -0700
Message-ID: <fa686aa41003011542i453156f4ib759c528518a0994@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
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
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 1, 2010 at 3:17 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt Likely
>> reworked to use nodes:
>> foo {
>> =A0 =A0 =A0 =A0 bar-label: bar {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D 2;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 delete(bar); // should be illegal
>> =A0 =A0 =A0 =A0 };
>> };
>
> Um, my original intent was:
> foo {
> =A0 =A0 =A0 =A0 bar-label: bar {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D 2;
> =A0 =A0 =A0 =A0 };
> =A0 =A0 =A0 =A0 delete(bar); // should be illegal
> };

Ah, yes.  And you are right, that should be illegal.

> So, is it true that a tree which is overlayed on another tree can be inde=
pendently verified to
> be independent of internal ordering? =A0This would be nice if so.

Yes, I think that is a valid statement, with the assumption that label
references at the top level are first resolved.

>> Not sure I follow. =A0It certainly isn't be valid to apply a label to a
>> command like delete().
>
> But the best thing of the above is that there is no longer a distinction =
between commands and data!
> delete is just a tag which gets interpreted during 'reduction' or 'overla=
y'.
>
> For instance, deleting a subnode could be:
>
> foo {
> =A0 =A0 =A0 =A0bar {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0delete;
> =A0 =A0 =A0 =A0}
> }
>
> I guess this ends up conflicting with a property named 'delete' though.

Right.  It should be something syntactically distinct.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Sun, 17 Jan 2010 00:06:37 -0700
Message-ID: <fa686aa41001162306x7c4e3dedy196409a4c8420e35@mail.gmail.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988778@az33exm25.fsl.freescale.net>
	<fa686aa41001122206l232b270er58323a6409e575e9@mail.gmail.com>
	<4B4E0AC7.7090502@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B4E0AC7.7090502-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2010 at 11:02 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrot=
e:
> Grant Likely wrote:
>> It's not worth toying with. =A0Just create a new compatible value for th=
is
>> new binding and be done with
>> it. =A0When a driver gets modified to handle the new behaviour, then it
>> can be also changed to bind against the new compatible value too.
>
> I agree that a new compatible is warranted from a theoretical perspetive,
> though from a practical compatibility perspective one should consider the
> odds of something breaking because old code chokes on the new bits, versus
> the old code not recognizing the new compatible and thus not binding the
> device at all.

Letting old drivers bind against new bindings that aren't actually the
same isn't good practice and leaves little recourse if we really do
need to differentiate between them in the future.  Teaching the
current driver to match against the new value is a one line change.
Choosing a new compatible value is so inexpensive, trivial, and safe
that I think it is a no-brainer decision.

> Is there any interest in standardizing this with a new compatible, or sho=
uld
> it be FSL-only?

Instead of trying to come up with a new "generic/standard" compatible
value, just adopt the name of the first part to use the new binding as
the standard compatible value.  If the binding catches on then great,
new parts will just claim compatibility with the old.  If it does not,
then we won't have wasted time trying to predict the future and
wrangling about what a so-called generic binding should look like.

So, instead of trying to do something like the following for, say, a
future 16 core version of the p4080:

compatible =3D "fsl,p4160-mpic", 'open-pic-enhanced";

Do this instead:

compatible =3D "fsl,p4160-mpic", "fsl,p4080-mpic"

This also has the advantage of the meaning of a fsl,p4080-mpic
compatible device is grounded in some real piece of hardware, not in
something made up who's definition can change over time.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Tue, 12 Jan 2010 23:24:45 -0700
Message-ID: <fa686aa41001122224t2eeec9acy15b40420ebe18541@mail.gmail.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988778@az33exm25.fsl.freescale.net>
	<fa686aa41001122206l232b270er58323a6409e575e9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001122206l232b270er58323a6409e575e9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2010 at 11:06 PM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Tue, Jan 12, 2010 at 11:36 AM, Yoder Stuart-B08248
> <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>> > The advantage of the above approach is backwards compatibility.
>>> > Existing interrupt specifiers (and device trees) are valid with
>>> > this proposal.
>>>
>>> Actually they're not, like BenH pointed out.
>>
>> The proposal is backwards compatible. =A0An existing interrupt
>> specifier =A0(e.g. interrupts =3D <24 2>;) retains its exact
>> same meaning. =A0Old device trees do not need to change
>> to comply with the proposal.
>
> You also need to deal with the case of old drivers incorrectly binding
> to and trying to understand the new data.
>
>> I'm not directly familiar with the case Ben pointed out, but
>> it sounded like Apple used the 1st cell in some non-standard
>> way.
>>
>> It is true that openpic drivers would need to change to handle
>> the new specifier-- minimally masking the level/sense field
>> to 2 bits.
>
> Which makes the new binding incompatible with old kernels/drivers
> which just leads to confusion. =A0It's not worth toying with. =A0Just
> create a new compatible value for this new binding and be done with
> it. =A0When a driver gets modified to handle the new behaviour, then it
> can be also changed to bind against the new compatible value too.

Oh, and BTW, this is *exactly* why I advocate being explicit about
what part the node describes instead of depending on some generic
name.  ie. "fsl,p4080-mpic" instead of "chrp,open-pic".  So that you
can deal with part specific oddities and so you can create new
bindings when necessary.  Nodes can still put backwards compatible
entries in the compatible list after the specific device when
appropriate so that existing drivers can still bind to them.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

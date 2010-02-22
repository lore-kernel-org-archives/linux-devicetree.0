From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 22 Feb 2010 14:59:25 -0700
Message-ID: <fa686aa41002221359m4d857e4cn3a1c56c32a24d21d@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA305B2021A-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
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
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2010 at 9:13 AM, Yoder Stuart-B08248
<B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> > That still leaves node and property deletion to cover. =A0In keeping
>> > with the above approach, I'd like to do that in the form of
>> "negative
>> > redefinitions" of properties or nodes. =A0A neat syntax for
>> that doesn't
>> > immediately occur to be for that yet, though.
>>
>> hmmm. =A0I'll think more about it too. =A0I agree that a negative
>> redefinition sounds like a reasonable approach. =A0I do want the ability
>> to drop nodes easily. =A0It would make it easy to handle SoC or FPGA
>> design variants.
>
> We had a similar problem in the Freescale Embedded Hypervisor
> to control the generation of guest device trees. =A0 We defined
> several 'magic' properties that had special meaning in
> the context of a node update.

heh, so the functionality is definitely needed, but boy is that ugly!
:-)  I really do think there needs to be a syntactically distinct
method of deleting nodes and properties.  Magic property names that
look like normal properties worry me.

What about something like this:  Right now nodes are defined by <name>
{ [<property>|<node>]; ... }; and properties are defined by <name>; or
<name> =3D <value>;  To differentiate a command from either a node or
property definition, perhaps round braces could be used:

so for the definition:
a-node {
        property-1;
        property-2 =3D "blah";
        child-1 {
                ...
        };
};

you could delete property-2 and node-1 with:
a-node {
        delete-node(child-1);
        delete-property(property-2);
};

> We also had the need to prepend to a <stringlist> so that
> compatible properties could be updated.
>
> =A0 prepend-stringlist =A0<stringlist> The value is a string list that
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sp=
ecifies on or more property name/value
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pa=
irs.

This is a bit of a harder problem.  I've go no ideas on how to handle
this in a syntactically elegant way.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 1 Mar 2010 16:33:29 -0700
Message-ID: <fa686aa41003011533x3d2d00abyb8d7cf33344a3bde@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<fa686aa41003011349i367a423cx2c59953e6afc9b75@mail.gmail.com>
	<4B8C3C78.5010206@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B8C3C78.5010206-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 1, 2010 at 3:15 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>>
>> Yes, multiple sibling nodes with the same name are not allowed by dtc.
>> =A0I believe multiple siblings of the same name is legal with
>> OpenFirmware, but that is at least partially because in OpenFirmware
>> the @<addr> portion isn't necessarily part of the name. =A0(Imagine
>> having triplets and naming them Sally@1, Sally@2 and Sally@3!)
>>
>>
>
> I'm not sure how to parse the above because the word "name" seems to be u=
sed
> somewhat informally.
>
> The Open Firmware situation is this:
>
> a) At a given level of the tree, there can be any number of nodes with the
> same value for the "name" property. =A0For example, you could plug in sev=
eral
> PCI Ethernet adapters and each would have "ethernet" as the value of the
> "name" property. =A0In general, the "name" property is not intended as a
> unique identifier, but rather as a mnemonic for human convenience. =A0The
> unique identifier is the first component of the "reg" property (within the
> context of the parent node). =A0The whole schema for reg properties is dr=
iven
> by this uniqueness requirement, along with the observation that the compu=
ter
> hardware must have some physical means of addressing specific devices. =
=A0The
> "reg" properties mimic physical addresses on various bus domains.
>
> b) A fully-qualified device specifier component includes both the name
> property value and the reg property value (AKA the unit address), for
> example "ethernet@5".
>
> c) It is possible to have a "wildcard" device node that contains an Open
> Firmware driver for a given device, but its bus has not been fully probed=
 so
> you don't yet know the addresses (reg properties) for the actual devices.
> =A0In that case, you can have a "name" property but no "reg" property. =
=A0You
> can have a wildcard node "disk" and some explicit nodes "disk@1", "disk@2"
> as siblings. =A0When searching the device tree, nodes with reg properties=
 take
> precedence over wildcard nodes, so the wildcard node is a "fallback" to u=
se
> if you can't find an explicit "name@reg" match. =A0In principle, you could
> have several wildcard nodes with the same name at the same level of the
> tree, but if so, the search would find only the most recently defined one,
> so for all practical purposes it is as if only one exists.
>
> Wildcard nodes are useful for Open Firmware driver binding, and could
> potentially be used for OS driver binding for either hot-plugged or
> late-probed devices. =A0Whether or not they fit well into the dtc scheme,=
 I
> can't say.

Thanks for the clarification.  The flat tree does stay with the Open
Firmware standard, however it does have the quirk that the name value
in the flat tree includes the reg address.  This is mostly because
when Linux on PowerPC reads the tree out of Open Firmware and creates
the flat representation it stores the full path including the reg
address.  The dts representation duplicates that behaviour.

I haven't entirely decided whether or not wildcard nodes are a good
idea in the flat representation, but I am leaning in that direction.
You already know about the discussion on how to handle Ethernet PHYs
at an unknown address.  That may very well be the way we decide to
handle it.

However, the node name issue does raise a question about dtc.  Right
now it doesn't do any checks in this regard, but an argument could be
made that dtc should warn or fail if a dts file sets the @<reg>
component in a way inconsistent with the first entry in the reg
property.  Perhaps dtc should also automatically add @<reg> when the
node name string omits it.  (again, this only applies to the flat
representation).

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

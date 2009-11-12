From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI bus node location
Date: Thu, 12 Nov 2009 01:00:59 -0700
Message-ID: <fa686aa40911120000w5aa446fbjc589a1aeb052099e@mail.gmail.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<A3A4CAD4-BE74-4CD4-BFFA-FE616DF38811@semihalf.com>
	<20091111000540.GB3235@yookeroo.seuss>
	<8239D9E6-E390-4DED-81C1-77FACF05C1D4@semihalf.com>
	<20091112020343.GK3235@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091112020343.GK3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2009 at 7:03 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Nov 11, 2009 at 03:16:56PM +0100, Rafal Jaworowski wrote:
>>
>> On 2009-11-11, at 01:05, David Gibson wrote:
>>
>> >>The current approach seems a bit of a maintenance problem: the PCI
>> >>bridges control reg need to specify the whole address instead of
>> >>just an offset, which is more error prone in case of changes (when a
>> >
>> >Well, yes. =A0And worse, it means there's two places that need to be
>> >adjusted rather than one, if the the IMMR is relocated (which it can
>> >be). =A0But it's a trade-off of this versus the inconvenience of dealing
>> >with separate "control" and "bridge" nodes for the PCI and following
>> >phandles between them.
>>
>> Would the technique with additional control node and a phandle
>> complicate bindings handling much? The clear benefit is the ability
>> to truly reflect hierarchy of devices available within IMMR/CCSR
>> block.
>>
>> >>number of places need to be adjusted etc.). What would need to be
>> >>done/extended for the ranges prop you mention to allow for better
>> >>handling cases like this?
>> >
>> >I don't really understand the question. =A0As Grant has said the
>> >"correct" approach is to have one node representing the control
>> >registers - located under the IMMR ("soc") node - and another
>> >representing the PCI host bridge itself (which would be in its present
>> >location). =A0There would need to be phandles linking the two. =A0It
>> >doesn't really need any extension to the device tree semantics itself
>> >- just a more complex binding for this device.
>>
>> Maybe I misunderstood Grant, my impression was that there was
>> possible some 'fixing' of ranges properties (which would be
>> alternative to the control node approach).
>
> Well.. the other approach would be for the "soc" node to have, in
> addition to a range for the IMMR registers, extra ranges for all the
> bridged ranges (PCI or localbus, or whatever). =A0That has its own
> problems because it means either we need a complicated encoding, or
> it's less obvious which devices have registers in the IMMR space and
> which have registers elsewhere. =A0We need more complex conventions
> about which range is which in the soc node's "ranges" property and so
> forth.

No, the encoding isn't complex at all.  And I think it become very
obvious which range is getting used for by each 'reg' property.  It
just has the ugliness of having to describe PCI BARs in the IMMR node.
 It would look like this (borrowing heavily from the 5200):

immr@f0000000 {
        #size-cells =3D <1>;
        #address-cells =3D <1>;
        ranges =3D <0 f0000000 0x00010000  # 16k Internal register range
                  80000000 80000000 0x40000000>; # 1GB range for PCI windows
        pci@0xd00 {
                #size-cells =3D <2>;
                #address-cells =3D <3>;
                reg =3D <0xd00 0x100>;
                /* 3 range entries; prefetchable, non-prefetchable, & IO. */
                ranges =3D <0x42000000 0 0x80000000    0x80000000    0 0x20=
000000
                          0x02000000 0 0xa0000000    0xa0000000    0 0x1000=
0000
                          0x01000000 0 0x00000000    0xb0000000    0
0x01000000>;
        }
}

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

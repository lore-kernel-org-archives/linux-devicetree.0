From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Tue, 13 Dec 2011 11:03:57 -0700
Message-ID: <CACxGe6sh+ofJWSA8xpDazEKVOUOpaHK45Qm8C20zpyRaLT77Mg@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20111212232903.GC2616@gallagher> <CACxGe6t50zJNpo=QWPzgFMpQ6Cfi9YZyrKuMSTrrA2oYiLF2Pw@mail.gmail.com>
 <4EE792DF.1010701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EE792DF.1010701@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Sascha Hauer <kernel@pengutronix.de>, Mike Turquette <mturquette@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2011 at 11:01 AM, Rob Herring <robherring2@gmail.com> w=
rote:
> Grant,
>
> On 12/13/2011 11:54 AM, Grant Likely wrote:
>> On Mon, Dec 12, 2011 at 4:29 PM, Jamie Iles <jamie@jamieiles.com> wr=
ote:
>>> Hi Grant,
>>>
>>> I'm still going through these and trying to digest them but a coupl=
e of
>>> quick questions/comments.
>>>
>>> Jamie
>>>
>>> On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
>>>> diff --git a/Documentation/devicetree/bindings/clock/clock-binding=
s.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> new file mode 100644
>>>> index 0000000..e40c436
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> @@ -0,0 +1,114 @@
>>>> +This binding is a work-in-progress, and are based on some experim=
ental
>>>> +work by benh[1].
>>>> +
>>>> +Sources of clock signal can be represented by any node in the dev=
ice
>>>> +tree. =A0Those nodes are designated as clock providers. =A0Clock =
consumer
>>>> +nodes use a phandle and clock specifier pair to connect clock pro=
vider
>>>> +outputs to clock inputs. =A0Similar to the gpio specifiers, a clo=
ck
>>>> +specifier is an array of one more more cells identifying the cloc=
k
>>>> +output on a device. =A0The length of a clock specifier is defined=
 by the
>>>> +value of a #clock-cells property in the clock provider node.
>>>> +
>>>> +[1] http://patchwork.ozlabs.org/patch/31551/
>>>> +
>>>> +=3D=3DClock providers=3D=3D
>>>> +
>>>> +Required properties:
>>>> +#clock-cells: =A0 =A0 =A0 =A0 =A0 Number of cells in a clock spec=
ifier; typically will be
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set to 1
>>>
>>> I'm not sure I fully understand what the extra cells actually mean =
for
>>> clocks. =A0I think the first integer is the clock output to use but=
 some
>>> of the versatile and highbank ones only have a phandle or is it mor=
e
>>> implementation defined? =A0The clock-output-names description hints=
 at
>>> recommended, so I find this a little confusing, but that could just=
 be
>>> me!
>>
>> I'm following convention here that has been established with
>> interrupts, gpios, and others. =A0Sometimes more information is need=
ed
>> that just the clock number. =A0Using #clock-cells gives a clock prov=
ider
>> the option of having additional fields for clock flags or other data=
=2E
>> This is very much implementation defined. =A0Simple clock providers =
that
>> only have a single clock output can easily use #clock-cells =3D <0>.
>> Providers with multiple outputs will need to use 1 or more cells.
>>
>
> Aren't you off by 1 here? The minimum cells is 1 to hold the phandle =
of
> the source/parent. Multiple outputs will need a cell size of 2 (typic=
ally).

No.  The #clock-cells does not include the phandle.  Never did.

g.

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Wed, 20 Jun 2012 09:56:22 +0100
Message-ID: <4FE19036.1060008@linaro.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com> <4FE0A546.1010707@linaro.org> <4FE0B79D.4090201@wwwdotorg.org> <4FE1772A.2010806@linaro.org> <4FE17E24.8050702@nvidia.com> <4FE18371.2020602@linaro.org> <4FE1877C.4090103@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FE1877C.4090103@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "arnd@arndb.de" <arnd@arndb.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20/06/12 09:19, Laxman Dewangan wrote:
> On Wednesday 20 June 2012 01:31 PM, Lee Jones wrote:
>> On 20/06/12 08:39, Laxman Dewangan wrote:
>>> On Wednesday 20 June 2012 12:39 PM, Lee Jones wrote:
>>>> On 19/06/12 18:32, Stephen Warren wrote:
>>>>> On 06/19/2012 10:13 AM, Lee Jones wrote:
>>>>>>> On 19/06/12 15:28, Laxman Dewangan wrote:
>>>>>>>>> Device's regulator matches their hardware counterparts with t=
he
>>>>>>>>> property "regulator-compatible" of each child regulator node =
in
>>>>>>>>> place of the child node.
>>>>>>>>> Add the property "regulator-compatible" for each regulator wi=
th
>>>>>>>>> their name.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Laxman Dewangan<ldewangan@nvidia.com>
>>>>>>>>> ---
>>>>>>>>> Changes from V1:
>>>>>>>>> - This is new change in V2.
>>>>>>>>>
>>>>>>>>> arch/arm/boot/dts/db8500.dtsi | 128
>>>>>>>>> +++++++++++++++++++++++++++++++----------
>>>>>>>>> 1 files changed, 97 insertions(+), 31 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm/boot/dts/db8500.dtsi
>>>>>>>>> b/arch/arm/boot/dts/db8500.dtsi
>>>>>>>>> index 4ad5160..9548f80 100644
>>>>>>>>> --- a/arch/arm/boot/dts/db8500.dtsi
>>>>>>>>> +++ b/arch/arm/boot/dts/db8500.dtsi
>>>>>>>>> @@ -203,107 +203,149 @@
>>>>>>>>>
>>>>>>>>> db8500-prcmu-regulators {
>>>>>>>>> compatible =3D "stericsson,db8500-prcmu-regulator";
>>>>>>>>> + #address-cells =3D<1>;
>>>>>>>>> + #size-cells =3D<0>;
>>>>>>> Why are these and the reg properties required?
>>>>> DT nodes should be named after the type of object they describe (=
e.g.
>>>>> "regulator") rather than the name of the object they're describin=
g
>>>>> (e.g.
>>>>> "vape").
>>>>>
>>>>> Once you've made that change, you end up with many nodes with the=
 same
>>>>> name in the same parent, so you need to make their names unique.
>>>>> You do
>>>>> this by adding a "unit address" to each of them - "@0", "@1", ...=
 But,
>>>>> in order to be "allowed" to use such a unit address, you need a r=
eg
>>>>> property that matches the unit address, and #address-cells/#size-=
cells
>>>>> in the parent node.
>>>> I don't like it. By doing this you are preventing any regulator fr=
om
>>>> being registered by of_platform_populate(). Also, the nodes are al=
ready
>>>> placed under an identifying node "db8500-prcmu-regulators", so we =
know
>>>> they are regulators, making the regulator@x, the reg property and =
the
>>>> *-cells properties unnecessary cruft.
>>>>
>>>> I'd prefer to have the second label removed and just to call the
>>>> regulators by their correct name. The property names become
>>>> functionally
>>>> redundant after the previous patch has been applied in any case.
>>>>
>>>> Something like this:
>>>>
>>>>> db8500-prcmu-regulators {
>>>>> compatible =3D "stericsson,db8500-prcmu-regulator";
>>>>>
>>>>> // DB8500_REGULATOR_VAPE
>>>>> - db8500_vape_reg: db8500_vape {
>>>>> + db8500_vape {
>>>>> + regulator-compatible =3D "db8500_vape";
>>>>> regulator-name =3D "db8500-vape";
>>>>> regulator-always-on;
>>>>> };
>>>
>>> You will require a label so that it can refer by the consumer.
>> Don't they both act as labels? Thus if you removed the second one, t=
he
>> phandle will be taken from the remaining label? It's not something I=
've
>> tried, so I'm happy to be wrong here.
>>
>> If I'm wrong about that, can't we just omit the reg and *-size
>> properties? They are meaningless and restrictive.
>>
>
> We need to have the label. The name can not act as label. I tried
> following and got compilation error for dts file.
> Tried following way
>
> reg_vdd1 {
> regulator-compatible =3D "vdd1";
> :::::::::::::::::
> };
>
> reg_vdd2: regulator@1 {
> regulator-compatible =3D "vdd2";
> :::::::::::::::::
> };
>
> reg_vddctrl: regulator@2 {
> regulator-compatible =3D "vddctrl";
> :::::::::::::::::
> vin-supply =3D <&reg_vdd1>;
> };
>
> And got build error as
> **********
> DTC: dts->dtb on file "arch/arm/boot/dts/tegra30-cardhu.dts"
> ERROR (phandle_references): Reference to non-existent node or label
> "reg_vdd1"
>
> ERROR: Input tree has errors, aborting (use -f to force output)
> *******

Yes, I just did the same experiment. Shame. :(

> Are you OK to have the first patch with adding property
> "regulator-compatible" on each of child node so that I can go ahead w=
ith
> this patch and regulator core/documentation patch along with changes =
in
> my board to enable regulators.
> Once we will conclude on the child name either like vdd1 or regulator=
@0,
> we can have modification accordingly.

Yes I'm fine with it.

It's only the unnecessary reg and *-size properties I'm opposed to.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

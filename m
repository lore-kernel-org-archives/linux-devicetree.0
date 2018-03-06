Return-Path: <SRS0=tUeM=F4=samsung.com=a.hajda@kernel.org>
Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties for
 typec power delivery
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <dbdabf13-3baf-0354-b8ec-61320e114333@samsung.com>
Date: Tue, 6 Mar 2018 12:54:46 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB3917B47072CEC815AB6AE06A89D90@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
	<CGME20180226120532epcas5p3c4b0258ec0677939f4241b24da5f48bc@epcas5p3.samsung.com>
	<1519645759-12701-11-git-send-email-jun.li@nxp.com>
	<20522804-65ab-5d48-716a-c199e4c095fc@samsung.com>
	<VI1PR0402MB39175D757B94FB52CB5A09F889DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
	<133b5194-26ff-071a-d3d1-2bfca1375cae@samsung.com>
	<VI1PR0402MB3917B47072CEC815AB6AE06A89D90@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 06.03.2018 10:38, Jun Li wrote:
> Hi
>> -----Original Message-----
>> From: Andrzej Hajda [mailto:a.hajda@samsung.com]
>> Sent: 2018年3月5日 17:59
>> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org;
>> robh+dt@kernel.org; heikki.krogerus@linux.intel.com; linux@roeck-us.net
>> Cc: mark.rutland@arm.com; yueyao@google.com; Peter Chen
>> <peter.chen@nxp.com>; garsilva@embeddedor.com; o_leveque@orange.fr;
>> shufan_lee@richtek.com; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
>> Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties for
>> typec power delivery
>>
>> On 05.03.2018 08:00, Jun Li wrote:
>>>> -----Original Message-----
>>>> From: Andrzej Hajda [mailto:a.hajda@samsung.com]
>>>> Sent: 2018年2月27日 16:41
>>>> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org;
>>>> robh+dt@kernel.org; heikki.krogerus@linux.intel.com;
>>>> robh+linux@roeck-us.net
>>>> Cc: mark.rutland@arm.com; yueyao@google.com; Peter Chen
>>>> <peter.chen@nxp.com>; garsilva@embeddedor.com;
>> o_leveque@orange.fr;
>>>> shufan_lee@richtek.com; linux-usb@vger.kernel.org;
>>>> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
>>>> Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties
>>>> for typec power delivery
>>>>
>>>> On 26.02.2018 12:49, Li Jun wrote:
>>>>> In case of usb-c-connector with power delivery support, add
>>>>> bingdings supported by current typec driver, so user can pass all
>>>>> those properties via dt.
>>>>>
>>>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>>>> ---
>>>>> Changes for v2:
>>>>> - Added typec properties are based on general usb connector bindings[1]
>>>>>   proposed by Andrzej Hajda.
>>>>> - Use the standard unit suffixes as defined in property-units.txt.
>>>>>
>>>>> [1]
>>>>>
>> https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpa
>>>> t
>>>>
>> chwork.kernel.org%2Fpatch%2F10231447%2F&data=02%7C01%7Cjun.li%40
>>>> nxp.co
>>>>
>> m%7Cccf14a36ca6445ee5f1108d57dbde3c7%7C686ea1d3bc2b4c6fa92cd99
>>>> c5c30163
>>>>
>> 5%7C0%7C0%7C636553176880292197&sdata=2Pi0AtiwAqHQE3rGl%2Bo49K
>>>> 7yZZcp%2B
>>>>> 5bvJAknRBMGTrk%3D&reserved=0
>>>>>
>>>>>  .../bindings/connector/usb-connector.txt           | 43
>>>> ++++++++++++++++++++++
>>>>>  1 file changed, 43 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/connector/usb-connector.txt
>>>>> b/Documentation/devicetree/bindings/connector/usb-connector.txt
>>>>> index e1463f1..242f6df 100644
>>>>> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
>>>>> +++
>> b/Documentation/devicetree/bindings/connector/usb-connector.txt
>>>>> @@ -15,6 +15,30 @@ Optional properties:
>>>>>  - type: size of the connector, should be specified in case of USB-A,
>> USB-B
>>>>>    non-fullsize connectors: "mini", "micro".
>>>>>
>>>>> +Required properties for usb-c-connector with power delivery support:
>>>>> +- port-type: should be one of "source", "sink" or "dual".
>>>>> +- default-role: preferred power role if port-type is "dual"(drp),
>>>>> +should be
>>>>> +  "sink" or "source".
>>>> Since port carries data and power, it would be better to explicitly
>>>> mention it in names of properties which can be ambiguous.
>>>> Maybe instead of 'port-type' you can use 'power-role', for example.
>>> Port-type is align with the name of typec coding and ABI, 'power-role'
>>> is more like for the current role rather than the port's ability.
>> I am not sure what are you exactly mean by "coding and ABI", but I guess it is
>> just about Power-Delivery part of USB-C. And if you want to put this property
>> into USB node without mark it is related to PD part of USB connector, you
>> risk confusion with possible USB data related properties.
> Understood your concern, I am following typec naming conventions,
> for typec, port-type property has the same meaning as
> /sys/class/typec/portx/port_type
> which is not only for power, also for data, there are dedicated
> sys files power_role for power and data_role for data.
>
>> Simple question, what if somebody wants to add property describing USB
>> data capabilities (DFP, UFP, DRD), how should it be named?
>>
> Then we may use data-role?

Few lines above you have said -role is "for the current role rather than
the port's ability" :)

Generally my intention was to avoid such inconsistencies, for example by
using consistently
prefixes (for example: power and data) and suffixes (for example: mode
and role), which are used in specs.
We would have then:
- power_mode - for PD capabilities,
- power_role - for default/initial role,
- data_mode - for data capabilities,
- data_role - for default/initial role (as I understand specs this
property is redundant, as initial data_role is determined by power_role).

Of course if there is already well established convention, we shouldn't
change it, is there any, sysfs is well established?

>
>>>> Other thing is that default-role is required only in case of DRP, so
>>>> maybe better would be to squash it in power-role, for example:
>>>>     power-role: should be on of "source", "sink", "dual-source",
>>>> "dual-sink", in case of dual roles suffix determines preferred role.
>>> I don't know how much this squash can benefit, "dual-source/sink" is
>>> not directly showing its meaning by name.
>> Some benefit is simpler binding, no conditionally-required property.
>>
> There is already string definition for port type and preferred role parse 
> static const char * const typec_port_types[] = {
>          [TYPEC_PORT_DFP] = "source",
>          [TYPEC_PORT_UFP] = "sink",
>          [TYPEC_PORT_DRP] = "dual",
> };

I am little bit confused about enums, according typec specs DFP and UFP
are associated with flow of USB data, but DRP is about power -
Dual-Role-Power - quite misleading.
As I understand from the context it is about power capabilities.
Shouldn't be TYPEC_PORT_DFP replaced with TYPEC_PORT_SRC or
TYPEC_PORT_SOURCE, similarly UFP ?

> And I think there will be other conditionally-required properties
> to be extended later, are we going to name all of them by this way?
> Either way is OK for me, I am not sure if there is principle like we
> should avoid conditionally-required property, if we should, maybe
> "dual-preferred-source/sink" is better.

I have no strong feelings about it, it is just an idea.

>
> Hi Heikki,
> Do you have any comments/preference here?
>
>> Another question is that USB TypeC specification describes 7 different
>> "behavioral models" [1]:
>> - Source-only
> Maps "source"
>
>> - Source (Default) – strong preference toward being a Source but
>> subsequently capable of becoming a Sink using USB PD swap mechanisms.
> Only present Rp(source) when attach, can be sink only by power swap.
> Seems current code doesn't support this, to be extended.
>
>> - Sink-only
> Maps to "sink"
>
>> - Sink (Default) – strong preference toward being a Sink but subsequently
>> capable of becoming a Source using USB PD swap mechanisms.
> Only present Rd while attachment, can be source only by power swap support.
> Seems current code doesn't support this, to be extended.
>
>> - DRP: Toggling (Source/Sink)
> Maps to "dual"
>
>> - DRP: Sourcing Device
> "dual" but without USB host function(to be extended).
>
>> - DRP: Sinking Host
>>
> "dual" but without USB device function(to be extended).
>
>> How it maps to your proposed props?
>>
>> [1]: USB Type-C specification release 1.3, chapter 4.5.1.4.
>>
> Current typec and tcpm hasn't cover the full features like this.

So maybe it would be good to extend list of values, or clarify, for
example that 'source' means without PR_Swap (ie. Source-only), or maybe
add property indicating device is pr_swap capable, whatever suits better.

Regards
Andrzej

>
> Thanks
> Jun Li
>> Regards
>> Andrzej
>>
>>>>> +- src-pdos: An array of u32 with each entry providing supported
>>>>> +power
>>>>> +  source data object(PDO), the detailed bit definitions of PDO can
>>>>> +be found
>>>>> +  in "Universal Serial Bus Power Delivery Specification" chapter
>>>>> +6.4.1.2
>>>>> +  Source_Capabilities Message, the order of each entry(PDO) should
>>>>> +follow
>>>>> +  the PD spec chapter 6.4.1. Required for power source and power
>>>>> +dual
>>>> role.
>>>>> +- snk-pdos: An array of u32 with each entry providing supported
>>>>> +power
>>>>> +  sink data object(PDO), the detailed bit definitions of PDO can be
>>>>> +found in
>>>>> +  "Universal Serial Bus Power Delivery Specification" chapter
>>>>> +6.4.1.3 Sink
>>>>> +  Capabilities Message, the order of each entry(PDO) should follow
>>>>> +the PD
>>>>> +  spec chapter 6.4.1. Required for power sink and power dual role.
>>>> We should avoid magic numbers, magic numbers are bad :) If we really
>>>> need to use PDOs here, I think we can re-use PDO_* macros [1] - DTC
>>>> should be able to parse it, maybe some lifting will be necessary.
>>>>
>>>> [1]:
>>>>
>> https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fel
>>>> ix
>>>>
>> ir.bootlin.com%2Flinux%2Fv4.16-rc3%2Fsource%2Finclude%2Flinux%2Fusb%
>> 2Fpd.h%23L161&data=02%7C01%7Cjun.li%40nxp.com%7Cccf14a36ca6445e
>> e5f1108d57dbde3c7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
>> 7C636553176880292197&sdata=72HA33wgRyd2PMoPnZOlMatI2CuadplkYN
>>>> DDGKFSUB0%3D&reserved=0
>>>>> +- max-snk-microvolt: The max voltage the sink can support in micro
>>>>> +volts,
>>>>> +  required for power sink and power dual role.
>>>>> +- max-snk-microamp: The max current the sink can support in micro
>>>>> +amps,
>>>>> +  required for power sink and power dual role.
>>>>> +- max-snk-microwatt-hours: The max power the sink can support in
>>>>> +micro
>>>>> +  Watt-hours, required for power sink and power dual role.
>>>>> +- op-snk-microwatt-hours: Sink required operating power in micro
>>>>> +Watt-hours,
>>>>> +  if source offered power is less then it, Capability Mismatch is
>>>>> +set,
>>>>> +  required for power sink and power dual role.
>>>> What is the relation between above properties and PDOs specified
>> earlier?
>>>> Are you sure all these props are required?
>>>>
>>> Sorry, with latest tcpm code, those props are not required, will remove
>> them.
>>> Jun Li
>>>> And general remark regarding all above properties. For me, most of
>>>> them are specific not to the port but to devices responsible for
>>>> power
>>>> management: chargers, pmics,....
>>>> In many cases these properties are redundant with devices capabilities.
>>>> On the other side I guess in many cases it may be convenient to put
>>>> them here, so I am not sure what is better :)
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>> +
>>>>>  Required nodes:
>>>>>  - any data bus to the connector should be modeled using the OF
>>>>> graph
>>>> bindings
>>>>>    specified in bindings/graph.txt, unless the bus is between parent
>>>>> node and @@ -73,3 +97,22 @@ ccic: s2mm005@33 {
>>>>>  		};
>>>>>  	};
>>>>>  };
>>>>> +
>>>>> +3. USB-C connector attached to a typec port controller(ptn5110),
>>>>> +which has power delivery support and enables drp.
>>>>> +
>>>>> +typec: ptn5110@50 {
>>>>> +	...
>>>>> +	usb_con: connector {
>>>>> +		compatible = "usb-c-connector";
>>>>> +		label = "USB-C";
>>>>> +		port-type = "dual";
>>>>> +		default-role = "sink";
>>>>> +		src-pdos = <0x380190c8>;
>>>>> +		snk-pdos = <0x380190c8 0x3802d0c8>;
>>>>> +		max-snk-microvolt = <9000>;
>>>>> +		max-snk-microamp = <2000>;
>>>>> +		max-snk-microwatt-hours = <18000>;
>>>>> +		op-snk-microwatt-hours = <9000>;
>>>>> +	};
>>>>> +};

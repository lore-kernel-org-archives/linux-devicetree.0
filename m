Return-Path: <SRS0=DixT=JU=mentor.com=Vladimir_Zapolskiy@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: sram: Add 'clocks' as an optional
 property
References: <1530054453-10393-1-git-send-email-festevam@gmail.com>
 <20180703222142.GA15061@rob-hp-laptop>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <f4505aac-7e1f-9f1b-6f3a-6c3478ea9e12@mentor.com>
Date: Wed, 4 Jul 2018 09:40:30 +0300
MIME-Version: 1.0
In-Reply-To: <20180703222142.GA15061@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, vz@mleia.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob, Fabio,

On 07/04/2018 01:21 AM, Rob Herring wrote:
> On Tue, Jun 26, 2018 at 08:07:33PM -0300, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@nxp.com>
>>
>> Some SoCs (like i.MX53) need to specify the SRAM clock in the
>> device tree via the clocks property.
>>
>> Add an entry to the optional property section.
>>
>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>> ---
>> Changes since v1:
>> - Add space before : and use the more common "list of phandle
>> and clock specifier pairs" term - Vladimir
>>
>>  Documentation/devicetree/bindings/sram/sram.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
>> index 267da44..ae6ca34 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.txt
>> +++ b/Documentation/devicetree/bindings/sram/sram.txt
>> @@ -50,6 +50,8 @@ Optional properties in the area nodes:
>>  		 manipulation of the page attributes.
>>  - label : the name for the reserved partition, if omitted, the label
>>            is taken from the node name excluding the unit address.
>> +- clocks : a list of phandle and clock specifier pairs that controls the
>> +	   SRAM clock.
> 
> A list controlling THE (single) SRAM clock?
> 
> Once we start needing clocks, power, or other setup, we really should 
> have specific compatible strings (and binding docs) for the SRAM. I'll 
> take a single clock though.
> 

There are SRAM devices, which take multiple power or clock supplies [1],
where one clock or power domain control enables a segment on SRAM, however
a number of (enabled) segments form a single continuous IO memory space,
hence it could make sense to pluralize clocks in the generic document,
particular device specifics can be described separately.

[1] For reference IRAM on NXP LPC32xx has multiple power controls.

--
Best wishes,
Vladimir

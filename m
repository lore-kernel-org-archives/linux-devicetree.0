Return-Path: <SRS0=vODr=JT=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180703222142.GA15061@rob-hp-laptop>
References: <1530054453-10393-1-git-send-email-festevam@gmail.com> <20180703222142.GA15061@rob-hp-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Jul 2018 19:41:40 -0300
Message-ID: <CAOMZO5DFT8V2qEbgBvN7eVJ5NwwLcPx7+UMswR8Qd25kgd7AxQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: sram: Add 'clocks' as an optional property
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 3, 2018 at 7:21 PM, Rob Herring <robh@kernel.org> wrote:

>> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
>> index 267da44..ae6ca34 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.txt
>> +++ b/Documentation/devicetree/bindings/sram/sram.txt
>> @@ -50,6 +50,8 @@ Optional properties in the area nodes:
>>                manipulation of the page attributes.
>>  - label : the name for the reserved partition, if omitted, the label
>>            is taken from the node name excluding the unit address.
>> +- clocks : a list of phandle and clock specifier pairs that controls the
>> +        SRAM clock.
>
> A list controlling THE (single) SRAM clock?

Yes, it is a single SRAM clock.

Will reword it.

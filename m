Return-Path: <SRS0=nuAk=I6=gmail.com=pku.leo@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180612040031.GI2452@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com> <20180525111920.24498-2-wen.he_1@nxp.com>
 <CADRPPNRx2ePL1eteMboAZ7ZvoxrVO1Jn+Koo7TatLQyquymTiQ@mail.gmail.com>
 <AM6PR0402MB3382F4C81800D91761DA619FE2670@AM6PR0402MB3382.eurprd04.prod.outlook.com>
 <20180605163043.GX16230@vkoul-mobl> <CADRPPNQzn=1Nvp0h3xdTU7DdwFKN1grxyUKhESCV5u8V9FeMjg@mail.gmail.com>
 <20180612040031.GI2452@vkoul-mobl>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 12 Jun 2018 11:32:10 -0500
Message-ID: <CADRPPNRif6wMsFmYF2a3xVHc0yRHjjkAfPxiOHF+z_kgWq8ovg@mail.gmail.com>
Subject: Re: [v5 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Content-Type: text/plain; charset="UTF-8"
To: Vinod <vkoul@kernel.org>
Cc: Wen He <wen.he_1@nxp.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 11, 2018 at 11:00 PM, Vinod <vkoul@kernel.org> wrote:
> On 05-06-18, 12:24, Li Yang wrote:
>> On Tue, Jun 5, 2018 at 11:30 AM, Vinod <vkoul@kernel.org> wrote:
>> > On 04-06-18, 09:53, Wen He wrote:
>> >
>> >>
>> >> > > +// SPDX-License-Identifier: GPL-2.0
>> >> > > +// Copyright 2018 NXP
>> >> >
>> >> > I know the SPDX tag is recommended to be the 1st line, but copyright normally
>> >> > goes below the file description not above.
>> >
>> > I do not think that is specified anywhere.. can you point it?
>>
>> No.  It is not documented.  But the majority of the source files in
>> Linux are using this header format like below, so I assume it is
>> something like a convention.
>>
>> /*
>>  * {filename --} file description
>>  *
>>  * Copyright ...
>>  *
>>  * License ...
>>  */
>>
>> The Documentation/process/license-rules.rst only mentioned about the
>> requirement for SPDX tags.  So I think we should keep the format for
>> other part of the header.
>
> And Linus said this https://lkml.org/lkml/2017/11/25/133

Thanks for the information.  It is new to me.  So probably we can keep
the original template but just change * based comment to // based
comment, like:

// SPDX-License-Identifier: ...
//
// {filename --} file description
//
// Copyright ....

Regards,
Leo

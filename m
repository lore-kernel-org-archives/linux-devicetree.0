From: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Date: Tue, 5 Feb 2019 17:08:14 +0000
Message-ID: <20190205170812.GA18748@global.cadence.com>
References: <20190129160337.24350-1-piotrs@cadence.com>
 <20190129161040.20299-1-piotrs@cadence.com>
 <20190129182100.2fcb4e9f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129182100.2fcb4e9f@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, BrianNorris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The 01/29/2019 18:21, Boris Brezillon wrote:
  
>> +Optional properties:
>> +Driver calculates controller timings base on NAND flash memory timings and
>> +the following delays in picoseconds.
>> +  - cdns,if-skew : Skew value of the output signals of the NAND Flash interface
>> +  - cdns,nand2-delay : Delay value of one NAND2 gate from which
>> +    the delay element is build
>> +  - cdns,board-delay : Estimated Board delay. The value includes the total
>> +    round trip delay for the signals and is used for deciding on values
>> +    associated with data read capture. The example formula for SDR mode is
>> +    the following:
>> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
>> +    + DQ PAD delay
>
>The unit of those props is not defined, and if possible I'd like to
>avoid specifying custom timing adjustment values in the DT. Looks like
>some of these values are SoC specific (depends on the integration of
>this IP in a SoC) and others are board specific. For SoC specific
>values, this should be attached to the SoC specific compatible at the
>driver level. For board-specific values, I'd prefer to have a generic
>way to describe boards constraints.
Moving SoC specific delays from DTS to the driver data is clear for me. I do not know how to handle a board delay. Could you give me an example how it may be implemented? Where this board related stuff could be placed?

-- 
--
Regards
Piotr Sroka

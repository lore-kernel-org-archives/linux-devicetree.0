From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: dmaengine: xilinx_dma: add optional
 xlnx,sg-length-width property
Date: Thu, 9 Aug 2018 08:36:00 +0200
Message-ID: <CAN8YU5Pwn-dqU=QwiG=Wmg2QbEj2Z5U-uEQZcc3huZw-w568jA@mail.gmail.com>
References: <20180802141012.19970-1-andrea.merello@gmail.com>
 <20180802141012.19970-3-andrea.merello@gmail.com> <20180807145603.GA1664@rob-hp-laptop>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807145603.GA1664@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod <vkoul@kernel.org>, dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, v4-000linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 7, 2018 at 4:56 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Aug 02, 2018 at 04:10:08PM +0200, Andrea Merello wrote:
>> The width of the "length register" cannot be autodetected, and it is now
>> specified with a DT property. Add DOC for it.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
>> ---
>> Changes in v2:
>>       - change property name
>>       - property is now optional
>>       - cc DT maintainer
>> Changes in v3:
>>       - reword
>>       - cc DT maintainerS and ML
>> Changes in v4:
>>       - specify the unit, the valid range and the default value
>> ---
>>  Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>> index a2b8bfaec43c..aec4a41a03ae 100644
>> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>> @@ -41,6 +41,10 @@ Optional properties:
>>  - xlnx,include-sg: Tells configured for Scatter-mode in
>>       the hardware.
>>  Optional properties for AXI DMA:
>> +- xlnx,sg-length-width: Should be set to the width in bits of the length
>> +     register as configured in h/w. Takes values {8...26}. If the property
>> +     is missing or invalid then the default value 23 is used. This is the
>> +     maximum value that is supported by all IP versions.
>
> If 23 is the max, then why is the range 8-26?

26 In the max possible value and it is supported by some HW IP flavours.
23 is the max value supported by ALL HW IP flavours

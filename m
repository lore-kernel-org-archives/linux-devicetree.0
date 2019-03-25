From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: mtd: Add binding documentation
 for Hyperbus memory devices
Date: Mon, 25 Mar 2019 18:40:41 +0530
Message-ID: <43af4200-7734-733a-a227-f3b75bf40457@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-3-vigneshr@ti.com>
 <ca3326cb-1b37-cf9a-f196-3288a539d064@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca3326cb-1b37-cf9a-f196-3288a539d064@cogentembedded.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tudor.ambarus@microchip.com, nsekhar@ti.com, Mason Yang <masonccyang@mxic.com.tw>
List-Id: devicetree@vger.kernel.org

Hi,

On 24/03/19 9:48 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:
> 
>> Add DT binding documentation for Hyperbus memory devices. Only
>> Hyperflash is supported at the moment.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>> new file mode 100644
>> index 000000000000..cb408f80b868
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>> @@ -0,0 +1,6 @@
>> +Bindings for Hyperflash NOR flash chips compliant with Cypress Hyperbus
>> +specification and supports Cypress CFI specification 1.5 command set.
>> +
>> +Required properties:
>> +- compatible : "cypress,hyperflash" for Hyperflash NOR chips
> 
>    What about "cfi-flash", shouldn't it be also specified?

Oh, right. I missed that. Hyperflash is CFI compliant.
Will add that next time. Thanks!

> 
>> +- reg : Address where flash's memory mapped space
> 
> MBR, Sergei
> 

-- 
Regards
Vignesh

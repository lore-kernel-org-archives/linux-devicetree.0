From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: Re: [PATCH 01/14] DEVICETREE: Add bindings for PIC32 interrupt
 controller
Date: Wed, 25 Nov 2015 22:01:14 -0700
Message-ID: <5656921A.7000109@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-2-git-send-email-joshua.henderson@microchip.com>
 <20151122211453.GA13180@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20151122211453.GA13180@rob-hp-laptop>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Cristian Birsan <cristian.birsan@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/22/2015 2:14 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:13PM -0700, Joshua Henderson wrote:
>> From: Cristian Birsan <cristian.birsan@microchip.com>
>>
>> Document the devicetree bindings for the interrupt controller on Microchip
>> PIC32 class devices. This also adds a header defining associated interrupts
>> and related settings.
>>
>> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> ---
>>  .../microchip,pic32mz-evic.txt                     |   65 ++++++
>>  .../interrupt-controller/microchip,pic32mz-evic.h  |  238 ++++++++++++++++++++
>>  2 files changed, 303 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
>>  create mode 100644 include/dt-bindings/interrupt-controller/microchip,pic32mz-evic.h
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
>> new file mode 100644
>> index 0000000..12fb91f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
>> @@ -0,0 +1,65 @@
>> +Microchip PIC32MZ Interrupt Controller
>> +======================================
>> +
>> +The Microchip PIC32MZ SOC contains an Enhanced Vectored Interrupt Controller
>> +(EVIC) version 2. It handles internal and external interrupts and provides
>> +support for priority, sub-priority, irq type and polarity.
>> +
>> +Required properties
>> +-------------------
>> +
>> +- compatible: Should be "microchip,evic-v2"
> 
> This should be more specific like "microchip,pic32mz-evic". You can keep 
> this one in addition if you like for matching.
> 
> Rob
> 

Agreed.  Due to feedback, we are settling on microchip,pic32mzda-evic and similar for all compatible properties in this patch series.  I don't see a need to keep a more abstract name around here if you don't.

Josh

Return-Path: <SRS0=i3KD=PE=nvidia.com=talho@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: firmware: Add bindings for Tegra210 BPMP
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
 <1544643088-17678-5-git-send-email-talho@nvidia.com>
 <20181220201845.GA14624@bogus>
From: Timo Alho <talho@nvidia.com>
Message-ID: <e4df650b-904b-1eaf-7f92-1e55b91c228e@nvidia.com>
Date: Thu, 27 Dec 2018 13:19:12 +0200
MIME-Version: 1.0
In-Reply-To: <20181220201845.GA14624@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Sivaram Nair <sivaramn@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>



On 20.12.2018 22.18, Rob Herring wrote:
> On Wed, Dec 12, 2018 at 09:31:28PM +0200, Timo Alho wrote:
>> The BPMP is a specific processor in Tegra210 chip, which is designed
>> for boot process handling, assisting in entering deep low power states
>> (suspend to ram), and offloading DRAM memory clock scaling on some
>> platforms.
>>
>> Signed-off-by: Timo Alho <talho@nvidia.com>
>> ---
>>   .../bindings/firmware/nvidia,tegra210-bpmp.txt     | 36 ++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
>> new file mode 100644
>> index 0000000..de1fb62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
>> @@ -0,0 +1,36 @@
>> +NVIDIA Tegra210 Boot and Power Management Processor (BPMP)
>> +
>> +The Boot and Power Management Processor (BPMP) is a co-processor found
>> +in Tegra210 SoC. It is designed to handle the early stages of the boot
>> +process as well as to assisting in entering deep low power state
>> +(suspend to ram), and also offloading DRAM memory clock scaling on
>> +some platforms. The binding document defines the resources that would
>> +be used by the BPMP T210 firmware driver, which can create the
>> +interprocessor communication (IPC) between the CPU and BPMP.
>> +
>> +Required properties:
>> +- name : Should be bpmp
>> +- compatible
>> +    Array of strings
>> +    One of:
>> +    - "nvidia,tegra210-bpmp"
>> +- reg: physicall base address and length for HW synchornization primitives
> 
> s/physicall/physical/
> 
>> +       1) base address and length to Tegra 'atomics' hardware
>> +       2) base address and length to Tegra 'semaphore' hardware
>> +- interrupts: specifies the interrupt number for receiving messages ("rx")
>> +              and for triggering messages ("tx")
>> +
>> +Optional properties:
>> +- #clock-cells : Should be 1 for platforms where DRAM clock control is
>> +                 offloaded to bpmp.
>> +
>> +Example:
>> +
>> +bpmp {
> 
> bpmp@70016000
> 
>> +	compatible = "nvidia,tegra210-bpmp";
>> +	reg = <0x0 0x70016000 0x0 0x2000
>> +	       0x0 0x60001000 0x0 0x1000>;
>> +	interrupts = <0 6 IRQ_TYPE_NONE>,
>> +		     <0 4 IRQ_TYPE_EDGE_RISING>;
>> +	interrupt-names = "tx", "rx";
>> +};
>> -- 
>> 2.7.4
>>

Thanks for the comments Rob. I'll clean up the typos in next series.

-Timo

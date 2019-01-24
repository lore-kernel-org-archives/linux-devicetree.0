Return-Path: <SRS0=zFo5=QA=linux.intel.com=thor.thayer@kernel.org>
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCHv2 4/4] arm64: dts: stratix10: Add OCRAM EDAC node
References: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
 <1548179287-21760-5-git-send-email-thor.thayer@linux.intel.com>
 <4763af33-0cae-bc82-8963-41554ee56ea5@kernel.org>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <e02b1065-c81a-80f3-1790-f8f7dbfe4831@linux.intel.com>
Date: Thu, 24 Jan 2019 09:42:13 -0600
MIME-Version: 1.0
In-Reply-To: <4763af33-0cae-bc82-8963-41554ee56ea5@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dinh Nguyen <dinguyen@kernel.org>, bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 1/23/19 10:56 AM, Dinh Nguyen wrote:
> 
> 
> On 1/22/19 11:48 AM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Add the OCRAM ECC node following the Arria10 format.
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
>> v2  No changes
>> ---
>>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> index 8253a1a9e985..a625dc472b91 100644
>> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> @@ -494,6 +494,13 @@
>>   				interrupts = <16 4>, <48 4>;
>>   			};
>>   
>> +			ocram-ecc@ff8cc000 {
>> +				compatible = "altr,socfpga-a10-ocram-ecc";
> 
> Are you absolutely sure there are no differences in the Stratix10 versus
> A10? I wonder if it would be safer to have a platform specific binding
> for Stratix10 rather than re-using A10. It would prevent from having to
> change bindings later.
> 
> Dinh
> 

They are the same functionally. However, you bring up a good point. 
There are differences related to the underlying architecture - 32bit vs 
64bit.

I will respin this series (except for the first fixup patch) with new 
bindings for S10.

Thanks,

Thor

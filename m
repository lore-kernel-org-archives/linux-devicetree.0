Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 3/6] arm64: dts: stratix10: Add SDRAM node
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
 <1537385941-11582-4-git-send-email-thor.thayer@linux.intel.com>
 <a454c7fb-be98-7573-7fd8-54a41c86c703@kernel.org>
 <be83e407-cd7d-79cf-7666-ec2c2bf4ff26@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <8e45767d-7325-d9f8-6662-da85a8c51344@kernel.org>
Date: Mon, 24 Sep 2018 17:27:02 -0500
MIME-Version: 1.0
In-Reply-To: <be83e407-cd7d-79cf-7666-ec2c2bf4ff26@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: thor.thayer@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 09/24/2018 03:42 PM, Thor Thayer wrote:
> On 09/24/2018 10:40 AM, Dinh Nguyen wrote:
>>
>>
>> On 09/19/2018 02:38 PM, thor.thayer@linux.intel.com wrote:
>>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>>
>>> Add the SDRAM node to follow the Arria10 layout and
>>> bindings. The Arria10 SDRAM functions expect this
>>> node.
>>>
>>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>>> ---
>>>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> index 78b4b06e8935..ee1d4b8ba631 100644
>>> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> @@ -467,6 +467,11 @@
>>>               status = "disabled";
>>>           };
>>>   +        sdr: sdr@ffc25000 {
>>
>> Should this be "sdr: sdr@f8011100" ?
>>
> Whoops. Yes, you are correct. I'll fix and resubmit. Thanks!
> 

Feel free to add my ack when you resubmit.

Also, I noticed the same error in socfpga_arria10.dtsi, can you send a
patch to fix that too?

Thanks,
Dinh

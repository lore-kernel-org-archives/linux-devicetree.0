From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] ARM: dts: socfpga: Fix SDRAM node address for Arria10
Date: Fri, 26 Oct 2018 15:52:07 -0500
Message-ID: <426902dc-4a25-9707-da45-8612ccbd674c@kernel.org>
References: <1537888870-357-1-git-send-email-thor.thayer@linux.intel.com>
 <0e965db7-78e7-afba-2b6e-0ccd1b73ae36@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <0e965db7-78e7-afba-2b6e-0ccd1b73ae36@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/26/2018 03:14 PM, Thor Thayer wrote:
> Gentle ping.
> 
> On 9/25/18 10:21 AM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> The address in the SDRAM node was incorrect. Fix this to agree with the
>> correct address and to match the reg definition block.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 54b4a8f57848b("arm: socfpga: dts: Add Arria10 SDRAM EDAC DTS
>> support")
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
>>   arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)

This is already in arm-soc/next/dt and should land in v4.20-rc1.

Dinh

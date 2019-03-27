From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
Date: Wed, 27 Mar 2019 14:08:16 +0100
Message-ID: <74e84d99-dc7e-2779-fed0-e6a9e8324ba7@baylibre.com>
References: <20190325173501.22863-1-narmstrong@baylibre.com>
 <20190325173501.22863-2-narmstrong@baylibre.com>
 <518678c1-2e1d-ca27-55bd-0dd10965354f@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <518678c1-2e1d-ca27-55bd-0dd10965354f@xs4all.nl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/03/2019 13:39, Hans Verkuil wrote:
> On 3/25/19 6:34 PM, Neil Armstrong wrote:
>> The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
>> the other one is AO-CEC-A described by the current bindings.
>>
>> The registers interface is very close but the internal architecture
> 
> registers -> register
> 
>> is totally different.
>>
>> The other difference is the closk source, the AO-CEC-B takes the
> 
> closk -> clock
> 
>> "oscin", the Always-On Oscillator clock, as input and embeds a
>> dual-divider clock divider to provide the precise 32768Hz base
>> clock for CEC communication.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/media/meson-ao-cec.txt    | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> index 8671bdb08080..d6e2f9cf0aaf 100644
>> --- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> +++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> @@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
>>  to handle communication between HDMI connected devices over the CEC bus.
>>  
>>  Required properties:
>> -  - compatible : value should be following
>> -	"amlogic,meson-gx-ao-cec"
>> +  - compatible : value should be following depending on the SoC :
>> +  	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
>> +  	"amlogic,meson-gx-ao-cec"
>> +	For G12A (AO_CEC_B module) :
>> +	"amlogic,meson-g12a-ao-cec"
> 
> The driver uses "amlogic,meson-g12a-ao-cec-b", so there is a mismatch between
> the bindings and the driver.
> 
> Please repost since it is important that the two correspond.

Indeed, thanks for spotting this, I'll fix the typos and the compatible in v2

Neil

> 
> Thanks!
> 
> 	Hans
> 
>>  
>>    - reg : Physical base address of the IP registers and length of memory
>>  	  mapped region.
>>  
>>    - interrupts : AO-CEC interrupt number to the CPU.
>>    - clocks : from common clock binding: handle to AO-CEC clock.
>> -  - clock-names : from common clock binding: must contain "core",
>> -		  corresponding to entry in the clocks property.
>> +  - clock-names : from common clock binding, must contain :
>> +		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
>> +		- "core"
>> +		For G12A (AO_CEC_B module) :
>> +		- "oscin"
>> +		corresponding to entry in the clocks property.
>>    - hdmi-phandle: phandle to the HDMI controller
>>  
>>  Example:
>>
> 

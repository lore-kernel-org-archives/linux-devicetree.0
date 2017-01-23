From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 04/18] ARM64: dts: meson-gxbb-p20x: Fix Wifi node name
Date: Mon, 23 Jan 2017 17:57:22 +0100
Message-ID: <0f610d70-1fa1-56fe-cf11-4aea5ea1df7b@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-5-afaerber@suse.de>
 <20170123165018.w4jkyckyrltfyhz3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123165018.w4jkyckyrltfyhz3@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 23.01.2017 um 17:50 schrieb Rob Herring:
> On Fri, Jan 20, 2017 at 11:21:04PM +0100, Andreas Färber wrote:
>> bcrmf -> brcmf
>>
>> Fixes: ab3943fe57a2 ("ARM64: dts: meson-gxbb: Add P20x Wifi SDIO support")
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> index 4a96e0f6f926..5183c5ce90c6 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> @@ -193,7 +193,7 @@
>>  	vmmc-supply = <&vddao_3v3>;
>>  	vqmmc-supply = <&vddio_boot>;
>>  
>> -	brcmf: bcrmf@1 {
>> +	brcmf: brcmf@1 {
> 
> wifi@1

Good point.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)

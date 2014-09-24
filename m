From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/2] ARM: zynq: DT: Add missing reference for ADC
Date: Wed, 24 Sep 2014 19:06:30 +0200
Message-ID: <f6b47676-f664-4b01-8c70-a526eb8d1931@BY2FFO11FD011.protection.gbl>
References: <fced9e56dc4ef8df9ead34f6444c010cc31c7a61.1411567289.git.michal.simek@xilinx.com>
 <20140924161814.GG13679@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924161814.GG13679@xsjandreislx>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/24/2014 06:18 PM, S=C3=B6ren Brinkmann wrote:
> On Wed, 2014-09-24 at 04:01PM +0200, Michal Simek wrote:
>> Add missing reference for ADC node.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>  arch/arm/boot/dts/zynq-7000.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zy=
nq-7000.dtsi
>> index 772381fe07bb..fc90f47f9c03 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -64,7 +64,7 @@
>>  		interrupt-parent =3D <&intc>;
>>  		ranges;
>>
>> -		adc@f8007100 {
>> +		adc: adc@f8007100 {
> I think we enumerated all labels. I.e. 'adc0' is probably better.

I was thinking about it and the reason I didn't use that adc0 was
that it is unique and it is just one in PS. Maybe there could be anothe=
r adc in PL
but it will be probably automated not to use adc key world.
=46or PL part names was depending on user description.

Anyway logic was not to use enumerated label for unique IPs.

Thanks,
Michal

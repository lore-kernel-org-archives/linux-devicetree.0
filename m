From: Raashid Muhammed <raashidmuhammed@zilogic.com>
Subject: Re: [PATCH 2/2] ARM: dts: at91: Modify information in LED nodes.
Date: Fri, 24 Jun 2016 19:34:45 +0530
Message-ID: <87d1n6fzrk.fsf@zilogic.com>
References: <1466775069-606-1-git-send-email-raashidmuhammed@zilogic.com>
 <1466775069-606-2-git-send-email-raashidmuhammed@zilogic.com>
 <20160624134010.GN5809@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20160624134010.GN5809@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, nicolas.ferre@atmel.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, plagnioj@jcrosoft.com, Raashid Muhammed <raashidmuhammed@zilogic.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Alexandre Belloni writes:

> Hi,
>
> On 24/06/2016 at 19:01:09 +0530, Raashid Muhammed wrote :
>> Add power led node and rename status led node.
>>
>
> Well, I'm ok with the change but this does more:
>
>> Signed-off-by: Raashid Muhammed <raashidmuhammed@zilogic.com>
>> Reviewed-by: Vijay Kumar B. <vijaykumar@bravegnu.org>
>> ---
>>  arch/arm/boot/dts/at91-sam9_l9260.dts | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/at91-sam9_l9260.dts b/arch/arm/boot/dts/at91-sam9_l9260.dts
>> index be409f2..814753a 100644
>> --- a/arch/arm/boot/dts/at91-sam9_l9260.dts
>> +++ b/arch/arm/boot/dts/at91-sam9_l9260.dts
>> @@ -106,11 +106,16 @@
>>  	leds {
>>  		compatible = "gpio-leds";
>>
>> -		b0 {
>> -			label = "b0";
>> -			gpios = <&pioA 6 GPIO_ACTIVE_HIGH>;
>> -			linux,default-trigger = "heartbeat";
>> +		pwr_led {
>> +			label = "sam9-l9260:yellow:pwr";
>> +			gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "cpu0";
>>  		};
>>
>> +		status_led {
>> +			label = "sam9-l9260:green:status";
>> +			gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
>> +			linux,default-trigger = "timer";
>
> This trigger is also switched from heartbeat to timer, is this
> intentional?

Yes, that is intentional. I should have included that in the commit
message.

--
Sent with my mu4e

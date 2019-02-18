From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: rk3288 Tinker Board (S) sdcard changes
Date: Mon, 18 Feb 2019 20:08:24 +0000
Message-ID: <9ec51eb3-72d5-4bfe-0e66-31dda51bd6a0@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
 <1660942499.343639.1550435365757@email.ionos.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1660942499.343639.1550435365757-uEpKuDZ350hmhno068Nerg@public.gmane.org>
Content-Language: en-PH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Stefan,

If the change to make sure that power is set to vccio_sd work, and so I 
have to do another patch, I'll make sure I update.

David.

On 17/02/2019 20:29, Stefan Wahren wrote:
> Hi David,
>
> we need a better patch subject here e.g.
>
> ARM: dts: rk3288-tinker: Fix SD card detection
>
> plus a Fixes tag for the commit we want to fix.
>
>> David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> hat am 17. Februar 2019 um 13:15 geschrieben:
>>
>>
>> This patch makes some minor changes to how the sd card is
>> described in the device tree for the ASUS Tinker Board (S). In
>> particular on the Tinker Board S, when booted from the eMMC, and with
>> no card in the sd slot, and the log has endless messages about not
>> being able to detect the card.
>>
>> Several methods to remove this error have been tried, the only one
>> that works is the broken-cd and so that is what is applied here.
>>
>> Alas the ASUS schematic is not clear enough to indicate if the card
>> detect is wired up to the cpu, the schematic does not show internal
>> wiring on the Tinker Board!
>>
>> Now this error didn't show up on the Tinker Board, as that machine
>> only boots where there is a sd card installed. However as the TB and
>> TBS are so similar it is expected that the Tinker Board also doesn't
>> have a functioning card detect. Hence the change here is made to the
>> dtsi file, so it applies to both TB and TBS.
>>
>> The disable-wp is also removed, it doesnt seem needed on the micro
>> sdcard slots, and without thisn the card can still be written
>> to. Hence this flag is also removed.
>>
>> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/rk3288-tinker.dtsi | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> index 2b38075a2917..fceaeed44e34 100644
>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> @@ -432,9 +432,7 @@
>>   	bus-width = <4>;
>>   	cap-mmc-highspeed;
>>   	cap-sd-highspeed;
>> -	card-detect-delay = <200>;
>> -	disable-wp;			/* wp not hooked up */
> I think we should keep as long as it doesn't hurt.
>
>> +	broken-cd;
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>>   	status = "okay";
>> -- 
>> beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

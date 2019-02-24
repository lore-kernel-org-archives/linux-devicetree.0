From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] ARM: dts: rk3288-tinker.dtsi: Fix SD card detection
Date: Sun, 24 Feb 2019 19:35:25 +0000
Message-ID: <5387a001-1036-bb5c-e781-18e87ca6e7bd@davidjohnsummers.uk>
References: <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
 <20190222184708.32004-1-beagleboard@davidjohnsummers.uk>
 <AM3PR03MB096656098C6CB4712C73C095AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <AM3PR03MB096656098C6CB4712C73C095AC790-XQTXrJX/giFAc9da7WRX18eAHadYHfrlvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
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
To: Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/02/2019 19:26, Jonas Karlman wrote:
> On 2019-02-22 19:47, David Summers wrote:
>> The Problem:
>>
>> On ASUS Tinker Board S, when booting from the eMMC, and there is no
>> card sd slot, then there are constant errors.
>>
>> Cause:
>>
>> Thanks must go to Robin Murphy @ ARM for idenifying the problem. The
>> rk808 on the Tinker Board and Tinker Board S has many regulators, one
>> vccio_sd powers the IO for the sd card. Unfortunatly this is also used
>> in the card detect. Now when no card is install, the regulator is
>> powered down. This means that the card detect floats, and this means
>> random card detection.
>>
>> The Solution:
>>
>> Make sure that the sd IO is always powered, this means card detection
>> is always active, which is what should be done on a board with an sd
>> slot, which both the Tinker Board and Tinker Board S are. Hence change
>> is made to the .dtsi which takes effect on all Tinker Boards as
>> required.
>>
>> The change also adds "regulator-boot-on" the Tinker Board boot from
>> uboot, and the sd card is always one option. Hence the IO must be
>> powered in uboot, and so setting this flag.
>>
>> Also removed is "disable-wp" the micro sd card which are used have no
>> write  protection, so the concept doesn't mean anything, and the
>> Tinker Boards work without this. Hence it is removed to simply.
>>
>> This change came from ArchLinux Arm, but we note it is the fix also
>> used by Armbian:
>>
>> https://github.com/Miouyouyou/RockMyy/blob/master/patches/kernel/v5.0/DTS/0016-ARM-DTSI-rk3288-tinker-Setting-up-the-SD-regulators.patch
>>
>> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/rk3288-tinker.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> index aa107ee41b8b..6b7e55085b0c 100644
>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> @@ -254,6 +254,8 @@
>>   			};
>>   
>>   			vccio_sd: LDO_REG5 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>>   				regulator-min-microvolt = <1800000>;
>>   				regulator-max-microvolt = <3300000>;
>>   				regulator-name = "vccio_sd";
>> @@ -431,7 +433,6 @@
>>   	cap-mmc-highspeed;
>>   	cap-sd-highspeed;
>>   	card-detect-delay = <200>;
>> -	disable-wp;			/* wp not hooked up */
> I think disable-wp correctly describes that wp is not expected to work and should not be removed.
>
>  From comment in mmc_sd_get_ro():
> "Some systems don't feature a write-protect pin and don't need one.
> E.g. because they only have micro-SD card slot. For those systems
> assume that the SD card is always read-write."
>
> Without disable-wp core will call dw_mci_get_ro() to get wp status.
>
>
> This patch also fixes reboot when booting from sd-card and having emmc zeroed out.
>
> Tested-by: Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>
>
> Regards,
> Jonas
>
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>>   	status = "okay";

Hi Jonas,

Thanks for testing - did you get an error with "disable-wp" ?

We tested this with @TheSaint On ArchLinux Arm, and it worked!

With the "regulator-boot-on" and on reboot, it should keep power on the 
sd card - so reboot should work.

Regards,

David.

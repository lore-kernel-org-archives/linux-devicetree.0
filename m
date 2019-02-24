From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] ARM: dts: rk3288-tinker.dtsi: Fix SD card detection
Date: Sun, 24 Feb 2019 20:10:50 +0000
Message-ID: <e1f1a93e-505b-bf53-a253-5c1ddaeaebf8@davidjohnsummers.uk>
References: <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
 <20190222184708.32004-1-beagleboard@davidjohnsummers.uk>
 <AM3PR03MB096656098C6CB4712C73C095AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
 <5387a001-1036-bb5c-e781-18e87ca6e7bd@davidjohnsummers.uk>
 <AM3PR03MB09663F32FC40000E42C1A722AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <AM3PR03MB09663F32FC40000E42C1A722AC790-XQTXrJX/giFAc9da7WRX18eAHadYHfrlvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
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

On 24/02/2019 19:56, Jonas Karlman wrote:
> On 2019-02-24 20:35, David Summers wrote:
>> On 24/02/2019 19:26, Jonas Karlman wrote:
>>> On 2019-02-22 19:47, David Summers wrote:
>>>> The Problem:
>>>>
>>>> On ASUS Tinker Board S, when booting from the eMMC, and there is no
>>>> card sd slot, then there are constant errors.
>>>>
>>>> Cause:
>>>>
>>>> Thanks must go to Robin Murphy @ ARM for idenifying the problem. The
>>>> rk808 on the Tinker Board and Tinker Board S has many regulators, one
>>>> vccio_sd powers the IO for the sd card. Unfortunatly this is also used
>>>> in the card detect. Now when no card is install, the regulator is
>>>> powered down. This means that the card detect floats, and this means
>>>> random card detection.
>>>>
>>>> The Solution:
>>>>
>>>> Make sure that the sd IO is always powered, this means card detection
>>>> is always active, which is what should be done on a board with an sd
>>>> slot, which both the Tinker Board and Tinker Board S are. Hence change
>>>> is made to the .dtsi which takes effect on all Tinker Boards as
>>>> required.
>>>>
>>>> The change also adds "regulator-boot-on" the Tinker Board boot from
>>>> uboot, and the sd card is always one option. Hence the IO must be
>>>> powered in uboot, and so setting this flag.
>>>>
>>>> Also removed is "disable-wp" the micro sd card which are used have no
>>>> write  protection, so the concept doesn't mean anything, and the
>>>> Tinker Boards work without this. Hence it is removed to simply.
>>>>
>>>> This change came from ArchLinux Arm, but we note it is the fix also
>>>> used by Armbian:
>>>>
>>>> https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2FMiouyouyou%2FRockMyy%2Fblob%2Fmaster%2Fpatches%2Fkernel%2Fv5.0%2=
FDTS%2F0016-ARM-DTSI-rk3288-tinker-Setting-up-the-SD-regulators.patch&amp;d=
ata=3D02%7C01%7C%7Cf5937082939e4163c84b08d69a8f3b61%7C84df9e7fe9f640afb435a=
aaaaaaaaaaa%7C1%7C0%7C636866337295767294&amp;sdata=3DtK8QE3bsG9LW%2FJcvFzLK=
a8%2BPj5u%2F8exbEn8m2vqKly0%3D&amp;reserved=3D0
>>>>
>>>> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
>>>> ---
>>>>    arch/arm/boot/dts/rk3288-tinker.dtsi | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/=
rk3288-tinker.dtsi
>>>> index aa107ee41b8b..6b7e55085b0c 100644
>>>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>>>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>>>> @@ -254,6 +254,8 @@
>>>>    			};
>>>>    =

>>>>    			vccio_sd: LDO_REG5 {
>>>> +				regulator-always-on;
>>>> +				regulator-boot-on;
>>>>    				regulator-min-microvolt =3D <1800000>;
>>>>    				regulator-max-microvolt =3D <3300000>;
>>>>    				regulator-name =3D "vccio_sd";
>>>> @@ -431,7 +433,6 @@
>>>>    	cap-mmc-highspeed;
>>>>    	cap-sd-highspeed;
>>>>    	card-detect-delay =3D <200>;
>>>> -	disable-wp;			/* wp not hooked up */
>>> I think disable-wp correctly describes that wp is not expected to work =
and should not be removed.
>>>
>>>   From comment in mmc_sd_get_ro():
>>> "Some systems don't feature a write-protect pin and don't need one.
>>> E.g. because they only have micro-SD card slot. For those systems
>>> assume that the SD card is always read-write."
>>>
>>> Without disable-wp core will call dw_mci_get_ro() to get wp status.
>>>
>>>
>>> This patch also fixes reboot when booting from sd-card and having emmc =
zeroed out.
>>>
>>> Tested-by: Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>
>>>
>>> Regards,
>>> Jonas
>>>
>>>>    	pinctrl-names =3D "default";
>>>>    	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>>>>    	status =3D "okay";
>> Hi Jonas,
>>
>> Thanks for testing - did you get an error with "disable-wp" ?
>>
>> We tested this with @TheSaint On ArchLinux Arm, and it worked!
>>
>> With the "regulator-boot-on" and on reboot, it should keep power on the
>> sd card - so reboot should work.
> I tested both with and without "disable-wp" removed and both works withou=
t error.
> SD-card reboots now works as it should thanks to "regulator-always-on" an=
d "regulator-boot-on", I only tested using both.
>
> On a side note I have also been testing [1] to make reboot with UHS signa=
l voltage work and will send out a RFC v2
> after I have concluded testing on my other devices supporting UHS signal =
voltage.
>
> [1] https://github.com/Kwiboo/linux-rockchip/compare/patch-rk-5.x-tinker-=
uhs%5E%5E%5E...patch-rk-5.x-tinker-uhs
>
> Regards,
> Jonas

Thanks.

Glad your are testing - and I hope the uhs tests work.

Alas for us to test uhs - and our user on Arch isn't so experienced. I =

could push him to try different speeds - but to be honest I expect it to =

be beyond his comfort zone.

But its good to here you confirm "disable-wp" works. To my mind it says =

we are sure that=A0 all three changes in the patch are are correct.

Hopefully this will be straight forward to Heiko to accept. Its the =

simple patch of the 3 to accept ;)

Regards,

David.

>> Regards,
>>
>> David.
>>
>>

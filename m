From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [rtc-linux] [PATCH 5/6] rtc: max77620: add support for max77620/max20024
 RTC driver
Date: Mon, 11 Jan 2016 18:47:34 +0530
Message-ID: <5693AB6E.4090700@nvidia.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com> <1452177524-23192-6-git-send-email-ldewangan@nvidia.com> <CAJKOXPd938soaa5M0GFo5HpVCYzAS1w8j8Hko3Ja9mx47NYkEQ@mail.gmail.com> <568F8D7E.10500@nvidia.com> <20160108125117.GM6588@sirena.org.uk> <568FB3DD.4090503@nvidia.com> <20160108133648.GQ6588@sirena.org.uk> <568FBB6D.2020904@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <568FBB6D.2020904@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Friday 08 January 2016 07:06 PM, Laxman Dewangan wrote:
>
> On Friday 08 January 2016 07:06 PM, Mark Brown wrote:
>> * PGP Signed by an unknown key
>>
>> On Fri, Jan 08, 2016 at 06:34:29PM +0530, Laxman Dewangan wrote:
>>
>>> If we get the parent device, regmap handle and interrupt number from 
>>> mfd
>>> core independent of the PMIC (MAX77620 or MAX77686), then same 
>>> driver can be
>>> used here.
>>> Two way which I can think of here:
>> Parent device is just dev->parent, you can use dev_get_regmap() to get a
>> regmap given a struct device and you can use platform resources to pass
>> the interrupts to the children from the MFD (there's some examples,
>> wm831x is one).
>>
>>
>
> I think it should work with named regmap. mfd whould init regmap with 
> name and rtc driver should ask with same name.
>
> I saw three drivers which looks same:
> rtc-max77620.c (new from me) and already available rtc-max77686.c, 
> rtc-max77802.c
>
> Seems I can develop IP based rtc driver as rtc-max77xxx.c

I came with one of issue when doing this.

The RTC driver parent is not the same parent for which i2c slave address 
get registered.
There is two slave address from max77620, 0x3C (for general) and 0x68 
for RTC.

In max77620 mfd driver, we make dummy i2c client for 0x68 and initialize 
regmap with this address.

Now on mfd_add_devices, we pass the device for 0x3c and hence the RTC 
driver treat the parent as the 0x3c device but actually it should be 
0x68 to get the proper regmap.


Two approach:
1. If we add the option to pass parent_dev when adding cells form 
mfd_add_devices and select the parent device based on this option then 
it can be easily handle.
     Add parent_dev structure in struct mfd_cell and then change the 
parent in mfd_add_device() if cells has parent device.

2. Register the RTC driver with different mfd_add_devices with dummy i2c 
client device.
So two times mfd_add_devices.


IMO, approach 1 looks good to me.

Any opinion?



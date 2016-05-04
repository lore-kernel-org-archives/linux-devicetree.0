From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v4 3/7] phy: Add set_mode callback
Date: Wed, 4 May 2016 13:20:36 -0500
Message-ID: <572A3D74.3080907@lechnology.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-4-git-send-email-david@lechnology.com>
 <20160504181030.GA4327@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160504181030.GA4327@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, petr@barix.com, sergei.shtylyov@cogentembedded.com, khilman@kernel.org, nsekhar@ti.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/04/2016 01:10 PM, Bin Liu wrote:
> Hi,
>
> On Thu, Apr 14, 2016 at 01:35:14PM -0500, David Lechner wrote:
>> The initial use for this is for PHYs that have a mode related to USB OTG.
>> There are several SoCs (e.g. TI OMAP and DA8xx) that have a mode setting
>> in the USB PHY to override OTG VBUS and ID signals.
>>
>> Of course, the enum can be expaned in the future to include modes for
>> other types of PHYs as well.
>>
>> Suggested-by: Kishon Vijay Abraham I <kishon@ti.com>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>
>> v4 changes:
>>
>> * This is a new patch to avoid exporting a symbol from the phy-da8xx-usb driver.
>>
>>
>>   drivers/phy/phy-core.c  | 15 +++++++++++++++
>>   include/linux/phy/phy.h | 15 +++++++++++++++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index e7e574d..fe0344c 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
>> @@ -342,6 +342,21 @@ int phy_power_off(struct phy *phy)
>>   }
>>   EXPORT_SYMBOL_GPL(phy_power_off);
>>
>> +int phy_set_mode(struct phy *phy, enum phy_mode mode)
>> +{
>> +	int ret;
>> +
>> +	if (!phy || !phy->ops->set_mode)
>> +		return 0;
>> +
>> +	mutex_lock(&phy->mutex);
>> +	ret = phy->ops->set_mode(phy, mode);
>> +	mutex_unlock(&phy->mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_set_mode);
>
> Sorry for my late comments, have been busy on other things.
>
> As I commented in v2, isn't it a better idea to not adding this callback
> and let the da8xx phy driver set the mode register in _probe() based on
> DT dr_mode?
>
> musb core only calls the *optional* _set_mode() during init, so I don't
> see any problem if the phy set the mode in its probe.
>
> Regards,
> -Bin.
>

As was already discussed, the mode can be changed via sysfs as well as 
during probe, so this callback is needed for that case.

This is something I actually plan on using because the device I am using 
(LEGO MINDSTORMS EV3) is not wired for OTG, so the callback is needed to 
override the ID and VBUS signals when switching between host and 
peripheral mode.

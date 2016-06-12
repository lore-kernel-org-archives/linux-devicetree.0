From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Sun, 12 Jun 2016 09:18:07 +0800
Message-ID: <eb90a778-5e8a-91f4-c1ec-e0886a961882@rock-chips.com>
References: <1465290954-15852-1-git-send-email-frank.wang@rock-chips.com>
 <1465290954-15852-2-git-send-email-frank.wang@rock-chips.com>
 <20160608200419.GA12468@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608200419.GA12468@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bob,

On 2016/6/9 4:04, Rob Herring wrote:
> On Tue, Jun 07, 2016 at 05:15:53PM +0800, Frank Wang wrote:
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v4:
>>   - Used 'phy-supply' instead of 'vbus_*-supply'.
>>
>> Changes in v3:
>>   - Added 'clocks' and 'clock-names' optional properties.
>>   - Specified 'otg-port' and 'host-port' as the sub-node name.
>>
>> Changes in v2:
>>   - Changed vbus_host optional property from gpio to regulator.
>>   - Specified vbus_otg-supply optional property.
>>   - Specified otg_id and otg_bvalid property.
>>
>>   .../bindings/phy/phy-rockchip-inno-usb2.txt        |   62 ++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

 From the latest comments of Heiko, the devicetree bindings need to add 
a new property to handle multiple phy, and I will send out a new patch 
later today.

BR.
Frank

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

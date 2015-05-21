From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] doc: dt: add documentation for nxp,lpc1850-usb-otg-phy
Date: Thu, 21 May 2015 16:09:39 +0200
Message-ID: <CAGhQ9VyDvQHPfaU0k8GbKka1Sv3Ni0SXy2ZmusyChr4r4yA-Ow@mail.gmail.com>
References: <1431797277-4906-1-git-send-email-manabian@gmail.com>
	<1431797277-4906-3-git-send-email-manabian@gmail.com>
	<555DD6C8.7040804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555DD6C8.7040804-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 21 May 2015 at 14:59, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>
>
> On Saturday 16 May 2015 10:57 PM, Joachim Eastwood wrote:
>>
>> Add binding documentation for nxp,lpc1850-usb-otg-phy. This PHY
>
>
> %s/nxp,lpc1850-usb-otg-phy/NXP LPC18xx/43xx USB OTG PHY

Sure.

>>
>> can found on NXP LPC18xx and LPC43xx devices.
>
>
> Fix $subject to something like 'dt_bindings: Add NXP LPC18xx/43xx USB OTG
> PHY bindings'

okey.

>>
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   .../bindings/phy/nxp,lpc1850-usb-otg-phy.txt          | 19
>> +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
>> b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
>> new file mode 100644
>> index 000000000000..3da60ca04a42
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
>
>
> phy-lpc18xx-usb-otg.txt?

Fine by me.

Thanks for your comments, Kishon.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

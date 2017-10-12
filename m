From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 2/3] usb: core: add a wrapper for the USB PHYs
 on the root-hub
Date: Thu, 12 Oct 2017 23:00:40 +0200
Message-ID: <CAFBinCBY6oNiy0nSMgQLCTQM-YpwVEQvW+umCyyVxDU2Jz9uzw@mail.gmail.com>
References: <20171008211713.18696-3-martin.blumenstingl@googlemail.com> <Pine.LNX.4.44L0.1710091314310.6996-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1710091314310.6996-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alan,

thank you for taking the time to review my patches!

On Mon, Oct 9, 2017 at 7:16 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Sun, 8 Oct 2017, Martin Blumenstingl wrote:
>
>> Many SoC platforms have separate devices for the USB PHY which are
>> registered through the generic PHY framework. These PHYs have to be
>> enabled to make the USB controller actually work. They also have to be
>> disabled again on shutdown/suspend.
>
> ...
>
>> --- /dev/null
>> +++ b/drivers/usb/core/phy.h
>> @@ -0,0 +1,7 @@
>> +struct usb_phy_roothub;
>> +
>> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
>> +int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
>> +
>> +int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
>> +int usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
>
> Have you considered the possibility that a phy might need three power
> states, for on, off, and suspended?
I have not considered this yet - on the Mediatek platform (tested by
Chunfeng Yun) _power_{on,off} works fine for a suspend/resume cycle.
the other platform this was tested on is Amlogic Meson GXL/GXM,
however we don't have suspend support there

the underlying code relies on the generic PHY framework, which has
*runtime PM* support, but no suspend/resume PM functions - see [0]

> Alan Stern
>


Regards,
Martin


[0] http://elixir.free-electrons.com/linux/v4.14-rc4/source/include/linux/phy/phy.h#L131
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

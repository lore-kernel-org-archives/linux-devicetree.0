From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 4/6] ARM: dts: sun7i: Enable USB DRC on
 pcDuino 3
Date: Thu, 20 Aug 2015 09:36:33 +0200
Message-ID: <55D58381.7040801@redhat.com>
References: <1439563477-12295-1-git-send-email-hdegoede@redhat.com>
 <1439563477-12295-5-git-send-email-hdegoede@redhat.com>
 <20150820064545.GM30520@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150820064545.GM30520@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Ralph Willekes <benadski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08/20/2015 08:45 AM, Maxime Ripard wrote:
> On Fri, Aug 14, 2015 at 04:44:35PM +0200, Hans de Goede wrote:
>> From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
>>
>> Enable the otg/drc usb controller on the pcDuino 3.
>>
>> Note this board has the otg-vbus connected directly to the 5v-dcc of
>> the board, so there is no vbus0 regulator, nor vbus0-det.
>
> Can it do OTG then?

Yes.

> If VBUS is tied to the 5v, there's no way for the
> board to shut it down when acting as peripheral, right?

Correct, the idea is to power it over otg when using it
as a peripheral, or at least power it from a usb port of
the machine for which it is a peripheral. Note that the
original cubieboard (both A10 and A20 versions) have the
same issue.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

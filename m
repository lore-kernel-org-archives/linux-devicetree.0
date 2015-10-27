From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [REPOST PATCH 0/3] dwc2 patches to allow wakeup on Rockchip
 rk3288
Date: Tue, 27 Oct 2015 02:05:02 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC3A9725@US01WEMBX2.internal.synopsys.com>
References: <1436207224-21849-1-git-send-email-dianders@chromium.org>
 <CAD=FV=W-iT48ah4WJDpAGqeNMkcTp3gMMddKYVz0ad-QXVz3fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Petr Mladek <pmladek-AlSwsSmVLrQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthew Garrett <mjg59-JW9irJGTvgXQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll@a>
List-Id: devicetree@vger.kernel.org

On 10/21/2015 9:23 AM, Doug Anderson wrote:
> John,
> 
> On Mon, Jul 6, 2015 at 11:27 AM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> This series of patches, together with
>> <https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
>> dts change allow us to wake up from a USB device on rk3288 boards.
>> The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
>> The chromeos-3.14 kernel tested included a full set of dwc2 backports
>> from upstream, so this is expected to function upstream once we get
>> everything setup there.
>>
>>
>> Douglas Anderson (3):
>>   USB: Export usb_wakeup_enabled_descendants()
>>   Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
>>   USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
>>
>>  Documentation/devicetree/bindings/usb/dwc2.txt |  4 +++
>>  drivers/usb/core/hub.c                         |  7 ++--
>>  drivers/usb/dwc2/core.h                        |  2 ++
>>  drivers/usb/dwc2/platform.c                    | 45 ++++++++++++++++++++++++--
>>  include/linux/usb/hcd.h                        |  5 +++
>>  5 files changed, 58 insertions(+), 5 deletions(-)
> 
> This series was posted a while ago.  Do you have any comments on it?
> Should I repost it?
> 
> Thanks!
> 
> -Doug
> 


Sorry, I must have missed it earlier.

Could you repost based on latest and I'll review.

Regards,
John


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

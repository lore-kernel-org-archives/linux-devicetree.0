From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/15] usb: phy: add notify suspend and resume callback
Date: Fri, 13 Dec 2013 14:23:35 +0800
Message-ID: <CAL411-o7YBzQitOPZodnp6OsRrUZf2LPzbWUY6AJpHo29x2FzQ@mail.gmail.com>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-8-git-send-email-peter.chen@freescale.com> <20131213042722.GG867@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131213042722.GG867-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 13, 2013 at 12:27 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Fri, Dec 13, 2013 at 09:23:37AM +0800, Peter Chen wrote:
>> They are used to notify PHY that the controller enters suspend
>> or finishes resume.
>>
>> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  include/linux/usb/phy.h |   23 +++++++++++++++++++++++
>>  1 files changed, 23 insertions(+), 0 deletions(-)
>>
>> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
>> index 6c0b1c5..a747960 100644
>> --- a/include/linux/usb/phy.h
>> +++ b/include/linux/usb/phy.h
>> @@ -116,6 +116,11 @@ struct usb_phy {
>>                       enum usb_device_speed speed);
>>       int     (*notify_disconnect)(struct usb_phy *x,
>>                       enum usb_device_speed speed);
>> +     int     (*notify_suspend)(struct usb_phy *x,
>> +                     enum usb_device_speed speed);
>> +     int     (*notify_resume)(struct usb_phy *x,
>> +                     enum usb_device_speed speed);
>> +
>
> I still don't think this is necessary. Why don't you just call
> usb_phy_set_suspend() directly ? And why do you need the extra speed
> argument ?
>
> --

It is different with PHY's power/clock.

Eg, for .notify_resume, it needs to be called after host controller finishes
 sending resume signal. If its operation is executed before controller sends
resume signal, the disconnect operation during the resume will not be detected.

.notify_suspend and .notify_resume needs to be called during ehci suspend/
resume operation for mxs-phy typed controller.

For mxs-phy, this operation is only needed for high speed connection,
and to aligned with .nofity_connect/.notify_disconnect, I added the speed
argument. If the user doesn't need it, it can pass USB_SPEED_UNKNOWN like
below post.

http://marc.info/?l=linux-usb&m=138418998118519&w=2

BR,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

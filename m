From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] musb: sunxi-glue: Fix sunxi-musb driver
 not auto-loading
Date: Tue, 22 Mar 2016 21:52:41 +0100
Message-ID: <56F1B099.1000005@redhat.com>
References: <1458598418-16959-1-git-send-email-hdegoede@redhat.com>
 <56F1A748.6070808@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F1A748.6070808-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 22-03-16 21:12, Andreas F=E4rber wrote:
> Hi Hans,
>
> Am 21.03.2016 um 23:13 schrieb Hans de Goede:
>> Add a missing MODULE_DEVICE_TABLE() line which was causing the
>> sunxi-musb glue to not auto-load when build as a module.
>
> "built"

Thanks.

> Should this get a Fixes: header for backporting to stable?

Actually while looking for the commit id, it looks like someone
else has already beat me to it, and this is already fixes
in Linus' tree, so self NACK for this one.

Regards,

Hans


>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/usb/musb/sunxi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
>> index 4b472b8..9af9431 100644
>> --- a/drivers/usb/musb/sunxi.c
>> +++ b/drivers/usb/musb/sunxi.c
>> @@ -756,6 +756,7 @@ static const struct of_device_id sunxi_musb_matc=
h[] =3D {
>>   	{ .compatible =3D "allwinner,sun8i-a33-musb", },
>>   	{}
>>   };
>> +MODULE_DEVICE_TABLE(of, sunxi_musb_match);
>>
>>   static struct platform_driver sunxi_musb_driver =3D {
>>   	.probe =3D sunxi_musb_probe,
>
> Has anyone looked into my earlier report about the module filename no=
t
> having musb-? I did not see any response and haven't rechecked v4.5.0=
=2E
>
> Regards,
> Andreas
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

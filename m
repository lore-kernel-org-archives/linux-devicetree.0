From: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
Date: Thu, 29 Dec 2016 19:22:12 +0100
Message-ID: <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
 <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <650d2371-57da-2494-7628-5a8bc5b756bf-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/26/2016 11:47 AM, Guenter Roeck wrote:
> On 12/23/2016 02:12 PM, Alexander Koch wrote:
>> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
>> permissions. This fixes checkpatch.pl warnings.
>>
>> Signed-off-by: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
>
> Please do not bother with those warnings and ignore checkpatch.
> We are in the process of doing an automated conversion.

Okay, so I shall create v3 of the patchset, without these changes. I've
found a typo in the 4th patch so I thought about going v3 anyways.

I've tested operation modes 1-3 on real hardware today and found no
issues so far, so I hope v3 will have good chances of getting accepted.


Cheers,

Alex

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

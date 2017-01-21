From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: (lm70) Add support for TI TMP122/124
Date: Sat, 21 Jan 2017 15:11:02 -0800
Message-ID: <C0A9E7E0-D4AB-4154-BC47-656F8E1FE77E@gmail.com>
References: <20170121192010.30681-1-f.fainelli@gmail.com> <20170121192010.30681-3-f.fainelli@gmail.com> <8ada15e2-2b99-02c3-e731-c469a3d6c3bf@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8ada15e2-2b99-02c3-e731-c469a3d6c3bf-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:HARDWARE MONITORING" <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On January 21, 2017 12:25:21 PM PST, Guenter Roeck <linux@roeck-us=2Enet> w=
rote:
>On 01/21/2017 11:20 AM, Florian Fainelli wrote:
>> Add support for Texas Instruments TMP122/124 which are nearly
>identical to
>> their TMP121/123 except that they also support programmable
>temperature
>> thresholds=2E
>>
>> Signed-off-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>
>
>Applied to -next=2E

Thanks was fast, thanks!

>
>Any plans to add support for the thresholds ?

Yes, as mentioned in the cover letter, need to get SPI_3WIRE working with =
the SPI controller (spi-ep93xx) to verify the thresholds do work=2E

Cheers

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

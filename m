From: Stefan Wahren <wahrenst-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [PATCH RFC 2/3] ARM: regulator: add Freescale MXS regulator driver
Date: Wed, 10 Sep 2014 19:24:09 +0200
Message-ID: <54108939.5050208@gmx.net>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de> <1410089869-6611-3-git-send-email-info@lategoodbye.de> <20140909182211.GG3896@leverpostej> <540F523D.4010904@lategoodbye.de> <20140910141853.GA4994@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140910141853.GA4994@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "stefan.wahren-eS4NqCHxEME@public.gmane.org" <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 10.09.2014 16:18, schrieb Mark Rutland:
>[...]
>
>>>> +       of_property_read_u32(np, "mxs-default-microvolt",
>>>> +                                  &val);
>>>> +
>>>> +       if (val)
>>>> +               mxs_set_voltage(rdev, val, val, NULL);
>>>
>>> As I mentioned in my comments on the binding, I'd like to know why this
>>> is necessary and if it is why it shouldn't be a standardised property.
>>
>>   From my understanding the standardised properties only defines a range,
>> but no default state of the regulators. If the initialization from the
>> bootloader or a hardcoded initialization in the driver is okay then the
>> property is not necessary.
>
> Sure. My questions was why it is necessary to preconfigure the
> regulators at all rather than why it is necessary to do so in this
> manner.
>
> Mark.
>

sorry i don't have a clue. In the original code there isn't a comment 
about the reason. Currently there is no init of the vddio regulator by 
the kernel and everything works fine.

@Fabio: Do you have any doubts?

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

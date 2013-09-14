From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: si570: Add a driver for SI570 oscillators
Date: Sat, 14 Sep 2013 10:01:03 +0200
Message-ID: <523417BF.7030505@gmail.com>
References: <1379033737-30015-1-git-send-email-soren.brinkmann@xilinx.com> <1379033737-30015-2-git-send-email-soren.brinkmann@xilinx.com> <20130913170005.GB5681@roeck-us.net> <c6755ff6-104d-40fe-a753-0e165cff1e10@AM1EHSMHS004.ehs.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6755ff6-104d-40fe-a753-0e165cff1e10-dAX9Bq04yCSXHCJdrdq+zrjjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/13/2013 07:26 PM, S=C3=B6ren Brinkmann wrote:
> On Fri, Sep 13, 2013 at 10:00:05AM -0700, Guenter Roeck wrote:
>> On Thu, Sep 12, 2013 at 05:55:37PM -0700, Soren Brinkmann wrote:
>>> Add a driver for SILabs 570, 571, 598, 599 programmable oscillators=
=2E
>>> The devices generate low-jitter clock signals and are reprogrammabl=
e via
>>> an I2C interface.
>>>
>>> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> ---
[...]
>>> diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
>>> new file mode 100644
>>> index 0000000..960d689
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-si570.c
>>> @@ -0,0 +1,546 @@
[...]
>>> +	match =3D of_match_node(clk_si570_of_match, client->dev.of_node);
>>> +	if (!match)
>>> +		return -EINVAL;
>>
>> Seems unusual. Is this really needed ? It precludes the driver from =
being used
>> in a non-devicetree environment, for example. I would guess that the=
re is a match
>> if client->dev.of_node is set. Otherwise, this code would be needed =
in every
>> driver supporting devicetree, and I don't recall seeing that.
>>
>>> +	ddata =3D match->data;
>>> +
>> You should be able to get this information (ie the pointer to si570_=
device_data)
>> from id->driver_data. That would be more consistent with other i2c d=
evices.
> I think I copied this approach from the other clk-si... driver. I'll
> do some research on your suggestion and change it. Could you point me=
 to
> an example for your proposal?

Soeren,

I sent a patch for the match removal in clk-si5351 [1].
Mike must have missed it, I will resend soon.
You can take that as "an example for the proposal" above.

Sebastian

[1] https://lkml.org/lkml/2013/9/3/484

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

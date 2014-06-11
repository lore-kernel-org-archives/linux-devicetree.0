From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/8] DT: Add vendor prefix for Dialog Semiconductor Ltd.
Date: Wed, 11 Jun 2014 09:22:27 -0500
Message-ID: <CAL_JsqJJz2S4fn25pJK5UDG9j36JKnS++VQCMhbdxQd_4-2OFQ@mail.gmail.com>
References: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
	<bf4b6d7b061e66d3ca7f3dd44319b9e26ae7103f.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
	<CAMuHMdWirVk+jrz40yw4=zAOFH6VTX9CXcpO01e0rK8S8VGGHw@mail.gmail.com>
	<CAL_JsqK0RqYuZ8YB1sBZK7hMXvp6oEPfAu11m95F61_kGV3Ptg@mail.gmail.com>
	<2E89032DDAA8B9408CB92943514A0337A56F53A6@SW-EX-MBX01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2E89032DDAA8B9408CB92943514A0337A56F53A6-68WUHU125fLLPO1uwJ3ImwLouzNaz+3S@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Opensource [Adam Thomson]" <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 11, 2014 at 8:17 AM, Opensource [Adam Thomson]
<Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org> wrote:
>> On Wed, Jun 11, 2014 at 13:43, Rob Herring wrote:
>>
>> dlg is the correct one and seems to be the most widely used, so we
>> should go with that and mark the others deprecated.
>>
>> diasemi is documented for the da9210, but not used anywhere.
>>
>> There appears to be 2 different da9053 bindings. I'd guess the dialog
>> variant used on 2 i.MX boards is not used. Other i.MX boards use the
>> dlg version. I'm not sure what is going on with da9055. Please sort
>> these out.
>>
>
> The intention is to update the other Dialog drivers after we've agreed this
> prefix. With regards to da9055, what's the issue here as I believe that uses
> the 'dlg' prefix already?

In documentation it does, but I'm not sure how these strings are used:

drivers/mfd/da9055-core.c:              .of_compatible = "dialog,da9055-gpio",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-regulator",
drivers/mfd/da9055-core.c:              .of_compatible = "dialog,da9055-onkey",
drivers/mfd/da9055-core.c:              .of_compatible = "dialog,da9055-rtc",
drivers/mfd/da9055-core.c:              .of_compatible = "dialog,da9055-hwmon",
drivers/mfd/da9055-core.c:              .of_compatible =
"dialog,da9055-watchdog",

Rob

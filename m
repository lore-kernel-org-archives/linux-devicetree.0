From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Thu, 5 May 2016 09:25:21 -0700
Message-ID: <CA+rpMbKfZq2Z3Vn_z-oWnq+JfW4Vu3fQrnu4mnbGjBWL6+9XMA@mail.gmail.com>
References: <572284AB.102@gmail.com>
	<CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A@mail.gmail.com>
	<CA+rpMbJkWM+bsvXT77eyLGewtKHjX1inc0vjsWxYQTCgzmpDGg@mail.gmail.com>
	<CAL_Jsq+v3r1dNY1+CK=_Atyyysq=JAFfk0q7i6YVhKS1zTZMVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+v3r1dNY1+CK=_Atyyysq=JAFfk0q7i6YVhKS1zTZMVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 30, 2016 at 1:38 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Apr 29, 2016 at 1:39 AM, Gaurav Minocha
> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, Apr 28, 2016 at 3:32 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, Apr 28, 2016 at 4:46 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>>>
>>>> Determining which kernel config options need to be enabled for a
>>>> given devicetree can be a painful process.  Create a new tool to
>>>> find the drivers that may match a devicetree node compatible,
>>>> find the kernel config options that enable the driver, and
>>>> optionally report whether the kernel config option is enabled.
>>>
>>> I would find this more useful to output a config fragment with all the
>>> options enabled. The hard part there is enabling the options a given
>>> option is dependent on which I don't think kbuild takes care of.
>>
>> Do you mean to generate something like .config? If yes, then IMO it would
>> not be a correct configuration file.
>
> No, only a config fragment which is just some subset of config
> options. Then you could have a generic defconfig plus the fragment for
> a platform to get a working setup.

Okay, that seems like a useful option, that should be part of the tool itself.
Will discuss with Frank once he is back. Thanks!

>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

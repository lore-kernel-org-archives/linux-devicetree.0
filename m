From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: RFC: build config via DT names
Date: Tue, 13 Feb 2018 09:19:41 -0600
Message-ID: <CAL_JsqJXJA+Z7b6SoUx=MVK_C=vcMRAibapriOi+Wss6L1ahsw@mail.gmail.com>
References: <63f25fea-f163-f9cc-b5b2-f6f291d7f8d2@gmx.de> <d55f95cc-228b-e65f-b46c-2f314f4fa582@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d55f95cc-228b-e65f-b46c-2f314f4fa582-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Enrico Weigelt, metux IT consult" <metux-Mmb7MZpHnFY@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 5:13 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> + devicetree mail list
>
> On 02/10/18 07:52, Enrico Weigelt, metux IT consult wrote:
>> Hi folks,
>>
>> I've regularily have the task of configuring a kernel for a given DT.
>> To make this a little bit easier, I'd like to do this automatically.
>>
>> The tuff task here is getting a mapping between dt compatible strings
>> and corresponding CONFIG_* flags. Automatically extracting it from the
>> source code seems pretty tricky, especially w/ corner cases (eg. some
>> drivers support groups of devices, depending on config options) - IMHO
>> it will need some code changes anyways.
>>
>> Therefore I propose a simple approach using the existing Kconfig system:
>>
>> Add an extra (toplevel) menu and config flag naming scheme which
>> directly map DT compatible strings to config flags. For example:
>>
>>> fsl,mpc5200-gpio <=> CONFIG_DTDEV_FSL_MPC5200_GPIO
>>
>>> config CONFIG_DTDEV_FSL_MPC5200_GPIO
>>>    tristate "fsl,mpc5200-gpio"
>>>    select GPIO_MPC5200
>>
>> Note that these flags are separate from the actual drivers - they just
>> enable them automatically. Of course they'll have to be maintained by
>> the driver maintainers.
>>
>>
>> What do you think about this idea ?

Doubling the number of driver config options is not going to fly. How
would you handle multiple compatible strings per driver? We want fewer
config options, not more.

We have all the data, so we should be able to generate this which
dt_to_config tries to do. I think part of the problem is dt_to_config
works at the source level for everything. Really we need a more robust
way to map source files to config options and extracting match tables
from drivers. Perhaps doing the latter with coccinelle which can match
struct types, using the object files instead, or using module aliases
(though that doesn't work for built-in drivers).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

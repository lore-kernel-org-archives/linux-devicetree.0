From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config, use full path for dtx_diff
Date: Mon, 18 Jul 2016 21:40:16 -0500
Message-ID: <CAL_JsqJO98NsoG2RSSa7osZEzaiC8RrYigiwt_nJBCtUU1a8HA@mail.gmail.com>
References: <576DD6B9.2040303@gmail.com> <CAL_JsqKUFR4uX24rV3hoYCEEZ-osDvycM12v1ome3-R3jNORZw@mail.gmail.com>
 <578D6279.9020004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <578D6279.9020004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 6:12 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 07/18/16 15:18, Rob Herring wrote:
>> On Fri, Jun 24, 2016 at 7:56 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Do not require dtx_diff to be in $PATH.
>>>
>>> dt_to_config already needs to be run from the root directory of a kernel
>>> tree so use scripts/dtc/dtx_diff instead of dtx_diff.
>>
>> Okay, now I get a bit further. I get this message even if I set my
>> .config file on the command line:
>>
>> grep: ./.config: No such file or directory
>
> All of the following work for me:
>
>   scripts/dtc/dt_to_config --config .config arch/arm/boot/dts/highbank.dts
>
>   scripts/dtc/dt_to_config --config=.config arch/arm/boot/dts/highbank.dts
>
>   scripts/dtc/dt_to_config --config ./.config arch/arm/boot/dts/highbank.dts
>
>   scripts/dtc/dt_to_config --config=./.config arch/arm/boot/dts/highbank.dts
>
> What is the exact command line you are using?

scripts/dtc/dt_to_config -c .build-arm/.config --config-format
arch/arm/boot/dts/highbank.dts

>
> Just to confirm, you are in the root directory of the kernel source tree
> and your .config is in the same directory (since you specified "./.config").

I'm in the root, but .config is not.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

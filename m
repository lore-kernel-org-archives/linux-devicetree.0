From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Thu, 20 Apr 2017 12:16:56 +0200
Message-ID: <b0a76ac2-b524-23b3-ef58-22114e8bf209@collabora.com>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <CGME20170301112844epcas4p34012f1564f1145f8d8a8967f4fe9a821@epcas4p3.samsung.com>
 <20170301111943.12170-2-enric.balletbo@collabora.com>
 <58B7C9BF.1040708@samsung.com> <58E44698.5020605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58E44698.5020605-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/04/17 03:21, Chanwoo Choi wrote:
> Hi Enric,
> 
> On 2017년 03월 02일 16:29, Chanwoo Choi wrote:
>> Hi,
>>
>> On 2017년 03월 01일 20:19, Enric Balletbo i Serra wrote:
>>> From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>
>>> This is the driver for the USB Type C cable detection mechanism
>>> built into the ChromeOS Embedded Controller on systems that
>>> have USB Type-C ports.
>>>
>>> At present, this allows for the presence of display out, but in
>>> future, it may also be used to notify host and device type cables
>>> and the presence of power.
>>>
>>> Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>> Changes since v1:
>>>  Requested by Chanwoo Choi
>>>  - Rename files changing _ for -
>>>  - Remove the unneeded blank line on bottom of header.
>>>  - Remove kobject.h and cros_ec_commands.h includes.
>>>  - Remove the debug message as is not necessary.
>>>  - Use the tab for indentation instead of space for if sentence.
>>>  - Define each variable on different lines when the variables should be
>>>    initialized.
>>>  - Remove EXTCON_USB and EXTCON_USB_HOST as are not really used for now.
>>>  - Add one blank line to split out between state and property setting.
>>>  - Add the author information (header and module)
>>>
>>>  Enric Balletbo
>>>  - As Rob suggested to rename the compatible name to something indicating that
>>>    is USB Type C related I also renamed the file names, extcon-cros-ec ->
>>>    extcon-usbc-cros-ec, I think it's more clear.
>>>
>>>  drivers/extcon/Kconfig               |   7 +
>>>  drivers/extcon/Makefile              |   1 +
>>>  drivers/extcon/extcon-usbc-cros-ec.c | 415 +++++++++++++++++++++++++++++++++++
>>>  include/linux/mfd/cros_ec_commands.h |  75 +++++++
>>>  4 files changed, 498 insertions(+)
>>>  create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c
>>>
>>
>> Looks good to me.
>> Acked-by: Chanwoo Choi <cw00.chio-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> I think this patch should be handled with patches[1].
>> [1] https://lkml.org/lkml/2017/2/14/655
>>
>> I think that one maintainer among following subsystems
>> (mfd, chrome h/w platform, rtc and extcon)
>> will apply their git repository, and then one maintainer
>> will send the pull request of immutable branch for these patches.
>>
> 
> As I mentioned, these patch should be handled with related patches[1].
> [1] https://lkml.org/lkml/2017/2/14/655
> 
> So, I can't apply these patch on extcon git because there is a merge conflict
> and we should handle these patches with immutable branch between subsystem maintainer.
> 
> The v4.11-rc5 was released, if you want to apply this patch to the v4.12-rc1,
> please take care of these patches.
> 

CC'ied : Olof Johansson

Olof, Benson,

Could at least the following patch in this series [1] picked as soon as possible
if it's ok.

9630769 New          [01/13] mfd: cros_ec: Add helper for event notifier

This specific patch is blocking this and others like the rtc-cros-ec to land and
the series were send some time ago without received bad feedback.

[1] https://lkml.org/lkml/2017/3/17/321

Many thanks,
 Enric




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

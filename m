From: "'Arend Van Spriel' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Wed, 29 Jun 2016 20:51:44 +0200
Message-ID: <f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <CAOiHx=n6itfmvwYQh+jUSDNguQFkos=MzjkDWP=GsupdgvF6KQ@mail.gmail.com>
 <b49a9e4b-d591-d978-8005-413f39ebf2bd@redhat.com>
 <871t3gdj6p.fsf@purkki.adurom.net>
 <ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com>
Reply-To: arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRYNGWEWYDBBRVR2C5QKGQEMPNSXRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <ea10ff70-26e6-e151-5cea-c54bd12a054c-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29-6-2016 20:01, Hans de Goede wrote:
> Hi,
> 
> On 29-06-16 19:00, Kalle Valo wrote:
>> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
>>
>>> Hi,
>>>
>>> On 29-06-16 16:42, Jonas Gorski wrote:
>>>> Hi,
>>>>
>>>> On 29 June 2016 at 16:04, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> Add a brcm,nvram_file_name dt property to allow overruling the default
>>>>> nvram filename for sdio devices. The idea is that we can specify a
>>>>> board specific nvram file, e.g. brcmfmac43362-ap6210.txt for boards
>>>>> with an ap6210 wifi sdio module and ship this in linux-firmware, so
>>>>> that wifi will work out of the box, without requiring users to find
>>>>> and then manually install the right nvram file for their board.
>>>>
>>>> Directly defining a filename doesn't seem like a good OS-agnostic
>>>> approach. Maybe an alternative would be to add a model-property to the
>>>> nodes (this is allowed) and make brcmfmac to request
>>>> "FWFILENAME-<model>" as firmware if set? That would leave it to the OS
>>>> on how the filename is set.
>>>
>>> It only defines the base-filename, not the entire path, how / where
>>> this file is searched for / loaded-from is then left up to the os
>>
>> It's still a bad idea. The filename, including the path, should be
>> created in the driver. Can't you provide chipname (or similar) via
>> device tree and then the driver can choose what image to use?
> 
> No, the driver already does that, but this is not ...
> 
>> Can you tell more about the naming the firmware image, how does it work
>> exactly?
> 
> About firmware, this is about the nvram file which is board specific,
> rather then chip specific.

The nvram filename is determined pretty much the same as the firmware
filename, but indeed the nvram data is board specific. This is main
reason why we do not submit nvram files to linux-firmware, because we
simply do not have those files.

> Typical wifi devices will have some sort of non volatile storage
> on board to not only store the ethernet(mac) address, but also
> to contain e.g. info about the antenna gain so that the firmware
> and/or the driver can take the antenna gain into account and ensure
> that they never exceed the maximum allowed broadcast strength.
> 
> However on some embedded devices there is no non-volatile storage
> for the wifi (for cost reasons) and instead this configuration info
> (which is board / pcb specific) is loaded in the form of a
> file which contains the contents which would normally be in the
> non-volatile storage.
> 
> Since we are dealing with a per-board config-file here, which is
> loaded from the os filesystem we really need to specify a basename
> here as the list of possible boards is endless, so we cannot
> have a lookup table in the driver.

As Jonas mentioned the general principle of device tree is to be
agnostic with regards to OS and/or driver as you undoubtedly know. His
proposal seems like a usable solution for your problem while complying
to the device tree principle. So instead of overriding the default
brcmfmac should modify it when dt specifies the "module" property, ie:

no "module" in DT:	nvram filename = brcm/brcmfmac43362-sdio.txt
"module=ap6210" in DT:	nvram filename = brcm/brcmfmac43362-ap6210.txt

By the way, the example in the bindings file does not seem to specify a
basename, but path+basename+fileext.

Regards,
Arend

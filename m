From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name dt property
Date: Wed, 29 Jun 2016 20:00:14 +0300
Message-ID: <871t3gdj6p.fsf@purkki.adurom.net>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
	<CAOiHx=n6itfmvwYQh+jUSDNguQFkos=MzjkDWP=GsupdgvF6KQ@mail.gmail.com>
	<b49a9e4b-d591-d978-8005-413f39ebf2bd@redhat.com>
Reply-To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBAABBYH5Z65QKGQECES3UHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <b49a9e4b-d591-d978-8005-413f39ebf2bd-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Hans de
	Goede's message of "Wed, 29 Jun 2016 17:16:32 +0200")
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless@vger.kernel.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> Hi,
>
> On 29-06-16 16:42, Jonas Gorski wrote:
>> Hi,
>>
>> On 29 June 2016 at 16:04, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> Add a brcm,nvram_file_name dt property to allow overruling the default
>>> nvram filename for sdio devices. The idea is that we can specify a
>>> board specific nvram file, e.g. brcmfmac43362-ap6210.txt for boards
>>> with an ap6210 wifi sdio module and ship this in linux-firmware, so
>>> that wifi will work out of the box, without requiring users to find
>>> and then manually install the right nvram file for their board.
>>
>> Directly defining a filename doesn't seem like a good OS-agnostic
>> approach. Maybe an alternative would be to add a model-property to the
>> nodes (this is allowed) and make brcmfmac to request
>> "FWFILENAME-<model>" as firmware if set? That would leave it to the OS
>> on how the filename is set.
>
> It only defines the base-filename, not the entire path, how / where
> this file is searched for / loaded-from is then left up to the os

It's still a bad idea. The filename, including the path, should be
created in the driver. Can't you provide chipname (or similar) via
device tree and then the driver can choose what image to use?

Can you tell more about the naming the firmware image, how does it work
exactly?

-- 
Kalle Valo

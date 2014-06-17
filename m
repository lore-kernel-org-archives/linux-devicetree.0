From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] brcmfmac: Fix OOB interrupt not
 working for BCM43362
Date: Tue, 17 Jun 2014 18:37:05 +0200
Message-ID: <53A06EB1.4040805@broadcom.com>
References: <1402941407-8210-1-git-send-email-hdegoede@redhat.com> <1402941407-8210-5-git-send-email-hdegoede@redhat.com> <53A02B5A.3070409@broadcom.com> <53A05168.9010604@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBCKLZOXH5AIBBOO5QGOQKGQEDYH564Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <53A05168.9010604-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17-06-14 16:32, Hans de Goede wrote:
> Hi,
>
> On 06/17/2014 01:49 PM, Arend van Spriel wrote:
>> On 16-06-14 19:56, Hans de Goede wrote:
>>> It has taken me a long long time to get the OOB interrupt working on the
>>> AP6210 sdio wifi/bt module found on various Allwinner A20 boards. In the
>>> end I found these magic register pokes in the cubietruck kernel tree:
>>> https://github.com/cubieboard2/linux-sunxi/commit/7f08ba395617d17e7a711507503d89a50406fe7a
>>>
>>> I'm not entirely sure if this specific to the AP6210 module, or if this
>>> should be done for all BCM43362 sdio devices.
>>
>> Hi Hans,
>>
>> I was still not sure about this one so I asked around. Apart from the nvram settings I emailed earlier one more is needed:
>>
>> sd_gpout=1
>> sd_oobonly=1
>> sd_gpval=1
>> *muxenab=0x11*
>>
>> Could you give that a try?
>
> I seriously doubt that is going to do anything at all, all 4 these keywords do not
> show up when running strings on brcmfmac43362-sdio.bin, where as all the
> keywords used in the brcmfmac43362-sdio.txt shipped with the android on ap6210
> equipped boards do show up, confirming that the keywords are encoded in plain text
> in the firmware file.
>
> Let me know if want me to give it a try anyways and I'll do so.
>
> Perhaps these keywords need a newer firmware version then the one in the
> linux-firmware repository ?

I will checkout the firmware release and see what is built there.

Thanks,
Arend

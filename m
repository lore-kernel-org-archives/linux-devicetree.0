From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 5/5] ARM: dts: sun7i: Add dts file for
 Wits Pro A20 DKT
Date: Sun, 2 Aug 2015 15:00:37 +0200
Message-ID: <55BE1475.6040904@redhat.com>
References: <1438333194-21181-1-git-send-email-hdegoede@redhat.com>
 <1438333194-21181-6-git-send-email-hdegoede@redhat.com>
 <20150731102028.GE2564@lukather>
 <CAGb2v65TEogqYFAfen1VnOaiepvez5t8Oh+Q=OYsRS_aZUMO3A@mail.gmail.com>
 <55BB9E92.30604@redhat.com> <20150801093046.GX2564@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150801093046.GX2564@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01-08-15 11:30, Maxime Ripard wrote:
> On Fri, Jul 31, 2015 at 06:13:06PM +0200, Hans de Goede wrote:
>> mmc-pwrseq-simple supports multiple reset/enable gpios (by listing
>> them all as reset-gpios and setting GPIO_ACTIVE_LOW/HIGH depending
>> on which value they need to be to activate things).
>>
>> It also supports listing clocks which need to be enabled. I think
>> that it may be a good idea to use this to also enable the bluetooth
>> bits of the ap6210 module on the cubietruck. I know that the
>> actual bt is interfaced over an uart, and we really should have
>> a mechanism to enable/disable it separately, but for not this seems
>> like a good way to get bluetooth to work.
>>
>> We should ofcourse add a comment to the dts file that this is not a
>> 100% ideal solution, but other then that I think this should work
>> nicely. Maxime would enabling the bluetooth bits of this sdio
>> module via mmc-pwrseq be acceptable to you?
>
> As long as we have some comment on top, yep.
>
>> ChenYu if Maxime acks this solution I hope you can write a patch for
>> this, since you've been working on the bluetooth support before.
>
> Note that I'm in holidays starting today. I plan on doing my
> pull-requests for 4.3 later today, and will probably not be able to
> merge any patches during the next two weeks, which mean that your
> mmc-power seq patch for the cubietruck was probably the last one I was
> merging for the 4.3 merge window.

I just noticed that your last push to

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/log/?h=sunxi/for-next

Is not in your github sunxi-next branch, it would be good if you could
merge the last changes there (when your back from your holliday).

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

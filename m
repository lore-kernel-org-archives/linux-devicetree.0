From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/1] ARM: dts: sunxi: Fix simplefb not working in 4.7-rc1
Date: Thu, 9 Jun 2016 12:47:36 +0200
Message-ID: <21258fc0-0250-951b-2ee7-d022fb3c09ac@redhat.com>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
 <20160609074643.GA5242@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160609074643.GA5242@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09-06-16 09:46, Maxime Ripard wrote:
> Hi Hans,
>
> On Sat, Jun 04, 2016 at 08:05:23PM +0200, Hans de Goede wrote:
>> Hi Maxime,
>>
>> While testing 4.7-rc1 / linux-sunxi/sunxi-next on a A10s I noticed that
>> hdmi out is no longer working (screen goes black when the kernel turns
>> of unused clocks).
>>
>> This is caused by the dtsi for sun4i / sun5i / sun7i based boards now
>> listing pll3, without pll3 being added to the clocks list for the
>> simplefb nodes.
>
> Why not do just that then? It's more appropriate for a fix imho.

You mean just for sun5i-a10s, or for all of sun4i / sun5i-a10s and
sun7i ?

For sun4i and sun7i things are already fixed in next:

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?id=5a7f2310cc847a73852e70bc720a61ca9bf986a6
https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?id=c79255ca4d7b67cce4eac4dd532e097ce49f3679

It seems best to use those fixes, rather then come up with a separate
fix for 4.7.

My patch for fixing sun5i-a10s is inline with the 2 above patches,
which seems best, rather then doing something special for just sun5i-a10s.

I'll send a v2 of this patch with the spelling mistakes pointed out
by Peter Korsgaard fixed.

Regards,

Hans


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

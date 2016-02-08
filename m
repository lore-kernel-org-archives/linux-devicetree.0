From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: apq8016-sbc: Add DT node for the uSD SDHC interface
Date: Mon, 08 Feb 2016 15:02:02 -0800
Message-ID: <7h4mdibyc5.fsf@baylibre.com>
References: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
	<7hmvrgb06c.fsf@baylibre.com>
	<CAOi56cWWfJCFyC_ndRqhm6c0QeQF=nXkcK3RCVdCDXTBag=+ow@mail.gmail.com>
	<56B4DFC5.7030700@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B4DFC5.7030700-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (Georgi Djakov's message of "Fri, 5
	Feb 2016 19:45:41 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On 02/05/2016 12:44 AM, Kevin Hilman wrote:
>> On Thu, Feb 4, 2016 at 2:06 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>> Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
>>>
>>>> Add the necessary properties to enable the SD-card on db410c boards.
>>>>
>>>> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> I tried this with 2 different SD cards on my dragonboard 410c but it's
>>> not detecting either card.
>> 
>> To be more precise, I tried this patch on v4.5-rc1 and today's
>> linux-next using the default defconfig + CONFIG_MMC_SDHCI_MSM=y, and
>> see the same voltage errors on both.
>>
>
> Hi Kevin, thanks for trying this. I got the same with v4.5-rc2, but
> this is expected as it depends on the another recently merged patch
> in linux-next. Perhaps I should have mentioned this in the commit
> message.
>
> Anyway, just checked with next-20160205 and it works for me - tested
> with 3 different cards. Not sure why it does not work for you.
> Could you please check if you have the following patch in your tree:

I re-tested with next-20160205 and it seems to work fine.

Feel free to add

Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

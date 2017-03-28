From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM64: dts: meson-gx: Add MALI nodes for GXBB and
 GXL
Date: Tue, 28 Mar 2017 16:51:55 +0200
Message-ID: <9c4e31be-1008-4ca3-a7d2-a0389f6c57cd@baylibre.com>
References: <1490177935-9646-1-git-send-email-narmstrong@baylibre.com>
 <1490177935-9646-4-git-send-email-narmstrong@baylibre.com>
 <m237e2iirk.fsf@baylibre.com>
 <149064443540.54062.12740186024138662455@resonance>
 <m2d1d1bgml.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2d1d1bgml.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/28/2017 04:49 PM, Kevin Hilman wrote:
> Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> 
>> Quoting Kevin Hilman (2017-03-24 12:20:31)
>>> Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
>>>
>>>> The same MALI-450 MP3 GPU is present in the GXBB and GXL SoCs.
>>>>
>>>> The node is simply added in the meson-gxbb.dtsi file.
>>>>
>>>> For GXL, since a lot is shared with the GXM that has a MALI-T820 IP, this
>>>> patch adds a new meson-gxl-mali.dtsi and is included in the SoC specific
>>>> dtsi files.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>
>>> LGTM, I can apply this when the clk driver changes are merged (feel free
>>> to let me know when that happens, in case I'm not paying attention.)
>>
>> Applied to clk-meson, a stable branch, which has been merged into
>> clk-next.
>>
>> Kevin, the dtsi is all yours.
> 
> Thanks, I applied it...
> 
>>>
>>> <bikeshed>
>>> nit: This series (and previous ones) use MALI, but I believe the correct
>>> way is Mali. Could you standarize on that throughout the series?
>>> </bikeshed>
>>>
> 
> ... after s/MALI/Mali/ in the changelog.
> 
> Kevin
> 

Thanks Kevin,

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

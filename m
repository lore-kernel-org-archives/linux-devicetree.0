From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V4 PATCH 6/6] arm64: configs: enable configs for msm899(2/4)
 basic support
Date: Fri, 21 Oct 2016 15:32:08 -0700
Message-ID: <ba4e8128-40c1-e2ff-8eda-130cbb62e71e@redhat.com>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-7-git-send-email-jeremymc@redhat.com>
 <20161021182713.GY7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021182713.GY7509@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-21 11:27 AM, Bjorn Andersson wrote:
> On Fri 21 Oct 04:11 PDT 2016, Jeremy McNicoll wrote:
>
>> From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Given the mimimal hardware support for msm899(2/4) currently.
>> A few config options are needed to allow for continued
>> development and booting.
>>
>> The following are needed for continued development and
>> booting:
>>   -8x74 pinctrl for serial support
>
> I don't have the datasheet for 899[24], but I don't think this is a good
> idea. We need a 899[24] pinctrl driver for this.
>

Based on the downstream code, for serial it was sufficient.

There is a 8994 pinctrl driver on its away.

-jeremy

>>   -Enable Global Glock Controller (gcc)
>>
>
> Regards,
> Bjorn
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

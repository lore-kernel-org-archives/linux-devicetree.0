From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-nexbox-a95x: Enable USB Nodes
Date: Fri, 06 Oct 2017 16:10:43 -0700
Message-ID: <7hlgkn7tzg.fsf@baylibre.com>
References: <20171005132118.2150-1-peter@korsgaard.com>
        <89e9980a-2ca6-4509-b9d5-36aac433b9bd@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89e9980a-2ca6-4509-b9d5-36aac433b9bd-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Thu, 5 Oct 2017 15:23:34 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> On 05/10/2017 15:21, Peter Korsgaard wrote:
>> Enable both gxbb USB controllers and add a 5V regulator for the OTG port
>> VBUS, similar to p20x.
>> 
>> Signed-off-by: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>

[...]

> Indeed, I forgot to add USB to this board,
> Thanks
>
> Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Applied to v4.15/dt64,

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM64: dts: meson-gxbb: Add support for WeTek Hub and
 Play
Date: Thu, 19 Jan 2017 09:12:20 +0100
Message-ID: <61c3c24d-57cd-b81d-0225-5aae14352397@baylibre.com>
References: <1484736642-5451-1-git-send-email-narmstrong@baylibre.com>
 <1484736642-5451-3-git-send-email-narmstrong@baylibre.com>
 <m2mveox9mm.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2mveox9mm.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/18/2017 11:53 PM, Kevin Hilman wrote:
> Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> 
>> Adds support for the WeTek Hub and Play2 boards.
>> The Hub is an extremely small IPTv Set-Top-Box and the Play2 is a more
>> traditionnal Satellite or Terrestrial and IPTv Set-Top-Box.
>>
>> Both are based on the p200 Reference Design and out-of-tree support is
>> based on OpenELEC kernel at [1].
>>
>> [1] https://github.com/wetek-enigma/linux-amlogic
>>
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> Did you get the GPIO/button info from the LibreELEC tree or did you find
> some schematics someplace?  If you found any schematics, it would be
> nice to have links in the DTS files.
> 
> Kevin
> 

It was in the dts of the LibreELEC tree, I found no schematics so far.
I can respin a v2 with a link to the LibreELEC dts files.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxl: Add support for HwaCom AmazeTV
Date: Wed, 22 Feb 2017 15:47:46 +0100
Message-ID: <CAL9uMOGeoSe2SwK=5kmpt7kAgjkQta_CgkPqnc8F5W88_JzDhg@mail.gmail.com>
References: <20170212193247.22705-1-carlo@caione.org> <20170212193247.22705-3-carlo@caione.org>
 <20170222144406.zycqtc77dygavh3q@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170222144406.zycqtc77dygavh3q@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Upstreaming Team <linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 3:44 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Feb 12, 2017 at 08:32:47PM +0100, Carlo Caione wrote:

> I'm going to start asking people to use SPDX tags and you are the first. :)

Glad to be the first one :D

> SPDX-License-Identifier: GPL2.0+ OR MIT
>
> Note that is really MIT license and not X11 which has additional
> clauses.

ok

>> +
>> +/dts-v1/;
>> +
>> +#include "meson-gxl-s905x.dtsi"
>> +
>> +/ {
>> +     compatible = "hwacom,amazetv", "amlogic,s905x", "amlogic,meson-gxl";
>> +     model = "HWACOM AMAZETV (S905X)";
>
> Why yelling the model?

Because also the file that I used as template
(meson-gxl-nexbox-a95x.dts) was yelling it.
Capslock change in v2.

thanks,

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM64: dts: meson-axg: add ethernet mac controller
Date: Fri, 15 Dec 2017 09:46:49 +0800
Message-ID: <c0063df2-7388-ab5a-f33e-d60146445a60@amlogic.com>
References: <20171214030242.113152-1-yixun.lan@amlogic.com>
 <1513269947.2261.9.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513269947.2261.9.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jerome:

On 12/15/17 00:45, Jerome Brunet wrote:
> On Thu, 2017-12-14 at 11:02 +0800, Yixun Lan wrote:
>> ---
>> Changes in v2 since [1]:
>>  - rebase to kevin's v4.16/dt64 branch
>>  - add Neil's Reviewed-by
>>  - move clock info to board.dts instead of in soc.dtsi
> 
> You got this comment regarding the pwm clock setup. the setup of the pwm clocks
> depends on the use case, so should defined depending on the requirement on the
> board
> 
Yes, I thought it was a convention to put the clock into board.dts ..

I think it's more clear if you could have a three level hierarchy:
 arch.dtsi. soc.dtsi, board.dts
   most of clock and pinctrl could go to soc.dtsi

> This is not the case for the ethmac, the clock setup will be same for every
> board, unless I missed something. the clock bindings should be defined in
> meson-axg.dtsi, I think
> 
yes, clock should be same

I will send another series to fix this
also will fold the DT separation (for soc.dtsi vs board.dts)

>>  - drop "meson-axg-dwmac" compatible string, since we didn't use this
>>    we could re-add it later when we really need.
>>  - note: to make ethernet work properly,it depend on clock & pinctrl[2],
>>    to compile the DTS, the patch [3] is required.
>>    the code part will be taken via clock & pinctrl subsystem tree.
> 
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

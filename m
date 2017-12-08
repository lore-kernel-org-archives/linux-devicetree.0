From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] clk: meson-axg: add clocks dt-bindings required
 header
Date: Fri, 8 Dec 2017 22:22:36 +0800
Message-ID: <060fab5b-0832-198d-9aab-d986a909c449@amlogic.com>
References: <20171207095300.15384-1-yixun.lan@amlogic.com>
 <20171207095300.15384-3-yixun.lan@amlogic.com>
 <20171207221014.6qwcb43w5hms4ma5@rob-hp-laptop>
 <1512725587.17256.19.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512725587.17256.19.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Jian Hu <jian.hu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/08/17 17:33, Jerome Brunet wrote:
> On Thu, 2017-12-07 at 16:10 -0600, Rob Herring wrote:
>> On Thu, Dec 07, 2017 at 05:52:58PM +0800, Yixun Lan wrote:
>>> From: Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Add the required header for the clocks ID dt-bindings
>>> exported from various subsystem in the Meson-AXG SoC.
>>>
>>> Signed-off-by: Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  include/dt-bindings/clock/axg-clkc.h | 71
>>> ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
>>
>> Please add acks when posting new versions.
>>
>> Rob
> 
> Yixun, please be consistent about this. Maintainers are not going to dig
> through your previous revision to collect Tags
> 
> I believe Neil acked patch 3, didn't he ?
> 
> Please resend your series with the Tags collected
sorry, I missed Neil's ACK for the pacth [3/4]

let's just wait for a few more days, to see if there are more comments
coming up, then I would fold them together

> If not already done, please make sure patches 1-3 apply on top of rc1 and patch
> 4 on Kevin's dt64 branch.
> 
the above is already base on -rc2, and patch 4 can apply to kevin's dt64
cleanly

> Thanks
> Jerome
> 
> .
> 




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

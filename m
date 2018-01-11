From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-axg: add RMII pins for ethernet
 controller
Date: Thu, 11 Jan 2018 10:33:27 +0100
Message-ID: <593cbb66-7040-b27d-5109-702fb43dc18e@baylibre.com>
References: <20180111030411.197054-1-yixun.lan@amlogic.com>
 <1515659863.5048.112.camel@baylibre.com>
 <2fa28259-cce9-37fc-3bcd-6017a35a052a@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2fa28259-cce9-37fc-3bcd-6017a35a052a-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/01/2018 10:11, Yixun Lan wrote:
> Hi Jerome：
> 
> On 01/11/18 16:37, Jerome Brunet wrote:
>> On Thu, 2018-01-11 at 11:04 +0800, Yixun Lan wrote:
>>> Comparing to RGMII interface, the RMII interface require few pins.
>>> So it's worth describing them here.
>>>
>>> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>
>> The only axg platform we have upstream is the s400 and is using rgmii.
>> May I ask how this was tested ?
>>
> It's true that S400 using RGMII interface.
> 
> but, we have customer using RTL8201FR-VB/VD which is a RMII PHY,
> 
> This is actually tested with the 'eth_rmii_x_pins' group.
> 
> Yixun
> 

I pushed the same for GXBB,

Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

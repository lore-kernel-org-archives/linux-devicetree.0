From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds support
Date: Tue, 29 Mar 2016 20:32:38 +0200
Message-ID: <CAP71WjwPQn8OuCy+8iuQpDrUW2baQ0qzaviLEDixVzTmUP_BTw@mail.gmail.com>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
 <20160327055012.GD8929@tuxbot> <56FA8F47.7070200@linaro.org> <20160329145115.GO8929@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160329145115.GO8929@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 29, 2016 at 4:51 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>> Am ok, to change, did you get activity leds works with any of these strings
>> with WLAN or BT?
>>
>
> I did test them; rx, assoc and radio seems to work. Tx does not tickle
> the led, but should probably.
>
> I didn't find the spec for the baord, so I'm not sure what the LEDs
> should indicate. But it feels like radio or assoc makes most sense, and
> follows what we can do with the BT led.

this is in the 96boards 'specs' at [1], which states

-
The User LEDs shall be directly programmable from the SoC.
1. WiFi activity LED
2. Bluetooth activity LED
-

[1] http://www.96boards.org/ce-specification

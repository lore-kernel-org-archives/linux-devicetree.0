From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 09/18] ASoC: sti: Update DT example to match the driver
 code
Date: Wed, 4 May 2016 09:52:19 +0200
Message-ID: <5729AA33.6020305@st.com>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <6161197.8XCk69TI60@wuerfel>
 <20160426111532.GA5457@griffinp-ThinkPad-X1-Carbon-2nd>
 <5608365.uloflbeuqO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5608365.uloflbeuqO@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

hello Arnd, peter,

On 04/26/2016 01:44 PM, Arnd Bergmann wrote:
> On Tuesday 26 April 2016 12:15:32 Peter Griffin wrote:
>>>
>>>> If not what would you recommend instead? 
>>>
>>> It's still not clear to me what that bit in the syscfg register
>>> is for. Given the error message about "sti-audio-clk-glue",
>>> I suspect that this is actually a clock controller and that
>>> it should be using the clock binding with a separate driver
>>> instead of manipulating the regmap directly from the audio driver.
>>
>> Luckily I do have the datasheet for the audio-glue sysconf register.
>>
>> It says: -
>>
>> [11:8] PCM_CLK_SEL: Selects the frequency synthesizer clock or the external
>> PCM clock for each channel.
>>
>> The driver only ever sets this to 1 which selects the frequency synthesizer
>> clock. So the bitfield of the register which the driver is using (PCM_CLK_SEL)
>> is a clock mux.
> 
> Ok, that sounds like it could be either a really simple clock driver
> with just a few lines, or integrated into an existing clock driver
> if you already have one for this syscon node.
> 
> 	Arnd
> 
FYI, Name of this glue is related to the register name. But it does not
concern only clock...
 This glue register is used to :
- select clock source ( clock framework or external clock from GPIO)
=> one bit field per IP instance (player->clk_sel)
- select uniperiph player IP instance for PCM out.
(http://www.spinics.net/lists/alsa-devel/msg49034.html)

Regards
Arnaud
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

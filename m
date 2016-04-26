From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 09/18] ASoC: sti: Update DT example to match the driver code
Date: Tue, 26 Apr 2016 13:44:02 +0200
Message-ID: <5608365.uloflbeuqO@wuerfel>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org> <6161197.8XCk69TI60@wuerfel> <20160426111532.GA5457@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160426111532.GA5457@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 26 April 2016 12:15:32 Peter Griffin wrote:
> > 
> > > If not what would you recommend instead? 
> > 
> > It's still not clear to me what that bit in the syscfg register
> > is for. Given the error message about "sti-audio-clk-glue",
> > I suspect that this is actually a clock controller and that
> > it should be using the clock binding with a separate driver
> > instead of manipulating the regmap directly from the audio driver.
> 
> Luckily I do have the datasheet for the audio-glue sysconf register.
> 
> It says: -
> 
> [11:8] PCM_CLK_SEL: Selects the frequency synthesizer clock or the external
> PCM clock for each channel.
> 
> The driver only ever sets this to 1 which selects the frequency synthesizer
> clock. So the bitfield of the register which the driver is using (PCM_CLK_SEL)
> is a clock mux.

Ok, that sounds like it could be either a really simple clock driver
with just a few lines, or integrated into an existing clock driver
if you already have one for this syscon node.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

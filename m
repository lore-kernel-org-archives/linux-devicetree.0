From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/18] ASoC: sti: Update example to include
 assigned-clocks and mclk-fs
Date: Tue, 26 Apr 2016 12:52:10 +0100
Message-ID: <20160426115210.GB5457@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-11-git-send-email-peter.griffin@linaro.org>
 <20160421154933.GR3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160421154933.GR3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, 21 Apr 2016, Mark Brown wrote:

> On Thu, Apr 21, 2016 at 12:04:27PM +0100, Peter Griffin wrote:
> 
> >  		clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> > +		assigned-clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> > +		assigned-clock-parents = <&clk_s_d0_quadfs 2>;
> > +		assigned-clock-rates = <50000000>;
> 
> This may be true for the particular system you're looking at but isn't
> really relevant to the device.

Ok I will drop this from v4 then.
> 
> > @@ -133,6 +139,7 @@ Example of audio card declaration:
> >  			/* DAC */
> >  			format = "i2s";
> >  			dai-tdm-slot-width = <32>;
> > +			mclk-fs = <256>;
> >  			cpu {
> >  				sound-dai = <&sti_uni_player2>;
> >  			};
> 
> This one is more relevant though I'm still a bit concerned that there's
> an expectation that the examples can just be pasted in...

I agree with your point in a more general case (e.g. seperate
audio codec chip connected via SPI), but the reality of the situation for
STi arch is that this device is found in STiH407 family silicon, of which
the two supported upstream devices (STiH407/410) are almost identical SoC's.

Given the recent announcement of "no new SoC's" for STB market, there is unlikely
to be support upstream for new variants and as there is no community board
available new board variants upstream are also unlikely (so far only
ST reference boards are supported upstreamed).

So although I would only consider copying an example as the starting
point for getting something working (and indeed it was the case here). On STi
arch there *should* be a very high probability that copying the exanple 
is all that will be required.

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

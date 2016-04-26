From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 09/18] ASoC: sti: Update DT example to match the driver code
Date: Tue, 26 Apr 2016 12:58:35 +0200
Message-ID: <6161197.8XCk69TI60@wuerfel>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org> <4337545.DyleYAUzIV@wuerfel> <20160426101136.GA2984@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160426101136.GA2984@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 26 April 2016 11:11:36 Peter Griffin wrote:
> Hi Arnd,
> 
> On Thu, 21 Apr 2016, Arnd Bergmann wrote:
> 
> > On Thursday 21 April 2016 12:04:26 Peter Griffin wrote:
> > > uniperiph-id, version and mode are ST specific bindings and
> > > need the 'st,' prefix. Update the examples, as otherwise copying
> > > them yields a runtime error parsing the DT node.
> > > 
> > > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
> > > ---
> > >  .../devicetree/bindings/sound/st,sti-asoc-card.txt         | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
> > > index 028fa1c..ef2e0c6 100644
> > > --- a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
> > > +++ b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
> > > @@ -67,9 +67,9 @@ Example:
> > >                 dmas = <&fdma0 4 0 1>;
> > >                 dai-name = "Uni Player #1 (DAC)";
> > >                 dma-names = "tx";
> > > -               uniperiph-id = <2>;
> > > -               version = <5>;
> > > -               mode = "PCM";
> > > +               st,uniperiph-id = <2>;
> > > +               st,version = <5>;
> > > +               st,mode = "PCM";
> > >         };
> > 
> > You don't change the binding desciption here, only the example,
> > so they no longer match.
> 
> Whoops. Will fix that in v4.
> 
> > 
> > What is st,uniperiph-id needed for anyway? It's often an indication
> > that you are doing something wrong if you need this.
> 
> From looking at the code in sound/soc/sti/uniperif_player.c, there is
> one sysconf register called "Audio glue config" which is shared by all
> of the uniperif IP instances. This binding is being used to generate a
> bitoffset into this shared register based on the instance of the IP.
> 
> I guess the alternative is to have an explosion of compatibles?
> 
> st,sti-uni-player-1
> st,sti-uni-player-2
> st,sti-uni-player-3
> 

That would certainly be worse: if the devices are actually identical,
they should have the same compatible string.

> If not what would you recommend instead? :-)

It's still not clear to me what that bit in the syscfg register
is for. Given the error message about "sti-audio-clk-glue",
I suspect that this is actually a clock controller and that
it should be using the clock binding with a separate driver
instead of manipulating the regmap directly from the audio driver.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

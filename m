From: mirq-linux@rere.qmqm.pl
Subject: Re: [PATCH v2 6/6] ASoC: atmel_ssc_dai: Enable shared FSYNC source
 in frame-slave mode
Date: Sun, 8 Sep 2019 15:39:30 +0200
Message-ID: <20190908133929.GA32003@qmqm.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <b56ebac96ad232e2d9871067b13654eb9223f28f.1566677788.git.mirq-linux@rere.qmqm.pl>
 <a42ede6e-4cc9-6dbf-4c58-71d2298fd3d5@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a42ede6e-4cc9-6dbf-4c58-71d2298fd3d5@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Codrin.Ciubotariu@microchip.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de, 3chas3@gmail.com, gregkh@linuxfoundation.org, perex@perex.cz, lgirdwood@gmail.com, Ludovic.Desroches@microchip.com, broonie@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, robh-dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 03:05:06PM +0000, Codrin.Ciubotariu@microchip.com wrote:
> On 24.08.2019 23:26, Micha³ Miros³aw wrote:
> > SSC driver allows only synchronous TX and RX. In slave mode for BCLK
> > it uses only one of TK or RK pin, but for LRCLK it configured separate
> > inputs from TF and RF pins. Allow configuration with common FS signal.
> > 
> > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > 
> > ---
> >   v2: use alternate DT binding
> >       split DT and drivers/misc changes
> > 
> > ---
> >   sound/soc/atmel/atmel_ssc_dai.c | 26 ++++++++++++++++++++++----
> >   1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> > index 48e9eef34c0f..035d4da58f2b 100644
> > --- a/sound/soc/atmel/atmel_ssc_dai.c
> > +++ b/sound/soc/atmel/atmel_ssc_dai.c
> > @@ -605,14 +605,32 @@ static int atmel_ssc_hw_params(struct snd_pcm_substream *substream,
> >   		return -EINVAL;
> >   	}
> >   
> > -	if (!atmel_ssc_cfs(ssc_p)) {
> > +	if (atmel_ssc_cfs(ssc_p)) {
> > +		/*
> > +		 * SSC provides LRCLK
> > +		 *
> > +		 * Both TF and RF are generated, so use them directly.
> > +		 */
> > +		rcmr |=	  SSC_BF(RCMR_START, fs_edge);
> > +		tcmr |=	  SSC_BF(TCMR_START, fs_edge);
> 
> Hmm, how would this work if capture and playback start/run at the same time?

Same as it did before this patch: as there is only one bi-directional link
between SSC and codec, whichever stream starts first defines the rate.

> > +	} else {
> >   		fslen = fslen_ext = 0;
> >   		rcmr_period = tcmr_period = 0;
> >   		fs_osync = SSC_FSOS_NONE;
> > -	}
> >   
> > -	rcmr |=	  SSC_BF(RCMR_START, fs_edge);
> > -	tcmr |=	  SSC_BF(TCMR_START, fs_edge);
> > +		if (ssc->lrclk_from_tf_pin) {
> > +			rcmr |=	  SSC_BF(RCMR_START, SSC_START_TX_RX);
> > +			tcmr |=	  SSC_BF(TCMR_START, fs_edge);
> > +		} else if (ssc->lrclk_from_rf_pin) {
> > +			/* assume RF is to be used when RK is used as BCLK input */
> 
> This comment is not longer true...

Removed for next version.

> 
> > +			/* Note: won't work correctly on SAMA5D2 due to errata */
> > +			rcmr |=	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=	  SSC_BF(TCMR_START, SSC_START_TX_RX);
> > +		} else {
> > +			rcmr |=	  SSC_BF(RCMR_START, fs_edge);
> > +			tcmr |=	  SSC_BF(TCMR_START, fs_edge);
> > +		}
> > +	}
> >   
> >   	if (atmel_ssc_cbs(ssc_p)) {
> >   		/*
> > 
> 
> Thanks and best regards,
> Codrin

Best Regards,
Micha³ Miros³aw

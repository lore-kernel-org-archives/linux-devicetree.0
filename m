From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
Date: Thu, 10 Oct 2019 12:03:37 +0000
Message-ID: <20191010120337.GB31391@ediswmail.ad.cirrus.com>
References: <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, spapothi@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2019 at 09:50:22AM +0100, Srinivas Kandagatla wrote:
> On 09/10/2019 19:53, Pierre-Louis Bossart wrote:
> >On 10/9/19 11:01 AM, Srinivas Kandagatla wrote:
> >>On 09/10/2019 15:29, Pierre-Louis Bossart wrote:
> >>>On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
> >>>>On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
> >>>>>On 8/13/19 11:11 PM, Vinod Koul wrote:
> >>>>>>On 13-08-19, 20:58, Mark Brown wrote:
> >>>>>>>On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis
> >>>>>>>>Indeed. I don't have a full understanding of that
> >>>>>>>>part to be honest, nor why
> >>>>>>>>we need something SoundWire-specific. We already
> >>>>>>>>abused the set_tdm_slot API
> >>>>>>>>to store an HDaudio stream, now we have a rather confusing stream
> >>>>>>>>information for SoundWire and I have about 3 other
> >>>>>>>>'stream' contexts in
> >>>>>>>>SOF... I am still doing basic cleanups but this has
> >>>>>>>>been on my radar for a
> >>>>>>>>while.
> >>>>>>>
> >>>>>>>There is something to be said for not abusing the TDM
> >>>>>>>slot API if it can
> >>>>>>>make things clearer by using bus-idiomatic mechanisms,
> >>>>>>>but it does mean
> >>>>>>>everything needs to know about each individual bus :/ .
> >>>>>>
> >>>>>>Here ASoC doesn't need to know about sdw bus. As Srini
> >>>>>>explained, this
> >>>>>>helps in the case for him to get the stream context and
> >>>>>>set the stream
> >>>>>>context from the machine driver.
> >>>>>>
> >>>>>>Nothing else is expected to be done from this API. We
> >>>>>>already do a set
> >>>>>>using snd_soc_dai_set_sdw_stream(). Here we add the
> >>>>>>snd_soc_dai_get_sdw_stream() to query
> >>>>>
> >>>>>I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
> >>>>
> >>>>
> >>>>There is a snd_soc_dai_get_sdw_stream() to get stream
> >>>>context and we add slave streams(amplifier in this case) to
> >>>>that context using sdw_stream_add_slave() in machine
> >>>>driver[1].
> >>>>
> >>>>Without this helper there is no way to link slave streams to
> >>>>stream context in non dai based setup like smart speaker
> >>>>amplifiers.
> >>>>
> >>>>Currently this driver is blocked on this patch, If you think
> >>>>there are other ways to do this, am happy to try them out.
> >>>
> >>>So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?
> >>Yes, am not using snd_soc_dai_set_sdw_stream().
> >
> >It's been a while since this thread started, and I still don't
> >quite get the concepts or logic.
> >
> >First, I don't understand what the problem with "aux" devices is.
> >All the SoundWire stuff is based on the concept of DAI, so I guess
> >I am
> 
> That is the actual problem! Some aux devices does not have dais.
> 

Usually aux devices are used for things like analog amplifiers that
clearly don't have a digital interface, thus it really makes no sense
to have a DAI link connecting them. So I guess my question here
would be what is the thinking on making the "smart amplifier" dailess?
It feels like having a CODEC to CODEC DAI between the CODEC and
the AMP would be a more obvious way to connect the two devices
and would presumably avoid the issues being discussed around the
patch.

Thanks,
Charles

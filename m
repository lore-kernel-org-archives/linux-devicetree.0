From: "Sa, Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Wed, 2 Oct 2019 08:09:00 +0000
Message-ID: <d3d406312a7b66f7d373b509faaab305adb8af36.camel@analog.com>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926184318.GF2036@sirena.org.uk>
 <6245f99f37c10dcec0a52344bab4b980f08e07da.camel@analog.com>
 <20190930151132.GA4265@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190930151132.GA4265@sirena.co.uk>
Content-Language: en-US
Content-ID: <9D81B9BF81E81044B19DAE2DB431C1A8@namprd03.prod.outlook.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "lars@metafoo.de" <lars@metafoo.de>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2019-09-30 at 16:11 +0100, Mark Brown wrote:
> 
> On Mon, Sep 30, 2019 at 09:44:00AM +0000, Sa, Nuno wrote:
> > On Thu, 2019-09-26 at 11:43 -0700, Mark Brown wrote:
> > > > +	case SND_SOC_DAIFMT_RIGHT_J:
> > > > +		st->right_j = true;
> > > > +		break;
> > > Don't we need to set any register values here?
> > The register set is done in adau7118_hw_params(). For right
> > justification the device can delay bclck by 8, 12 or 16. So, We
> > need to
> > know the data_width to check if we can apply the configuration.
> 
> OK.
> 
> > > > +	case SND_SOC_BIAS_STANDBY:
> > > > +		if (snd_soc_component_get_bias_level(component)
> > > > ==
> > > > +							SND_SOC
> > > > _BIAS_OF
> > > > F) {
> > > > +			if (!st->iovdd)
> > > > +				return 0;
> > > This is broken, the device will always require power so it should
> > > always control the regulators.
> > The reason why I made this optional was to let the user assume
> > that, in
> > some cases, the supply can be always present (and not controlled by
> > the
> > kernel) and, in those cases, he would not have to care about giving
> > regulators nodes in devicetree. Furthermore, the driver would not
> > have
> 
> Have you tried doing that?  Notice how the regulator API subtitutes
> in a
> dummy regulator for you and the driver works fine without custom
> code.

Ok, got it. Looking at `_regulator_get` I can see that a dummy
regulator is provided, when `NORMAL_GET` is used, even if one was not
given. So I think I get now the usage of
`devm_regulator_get_optional`.  As you said, supply voltages are not
optional, the optional _get_ should be used for things that are really
optional like some parts that can use external vs internal vref.

> > to care about enabling/disabling  regulators. Is this not a valid
> > scenario? Or is it that, for this kind of devices it does not
> > really
> 
> It's not a valid scenario in driver code - the driver shouldn't be
> randomly ignoring errors and hoping the errors were deliberate rather
> than indiciations of real problems.
> 
> > > > +static int adau7118_resume(struct snd_soc_component
> > > > *component)
> > > > +{
> > > > +	return snd_soc_component_force_bias_level(component,
> > > > +						  SND_SOC_BIAS_
> > > > STANDBY)
> > > > ;
> > > > +}
> > > Let DAPM do this for you, there's no substantial delays on power
> > > on so you're probably best just setting idle_bias_off.
> > So, this means dropping resume/suspend and to not set idle_bias_on,
> > right?
> 
> Right.  Like I say it looks like your power up path is fast enough
> for
> this.
> 
> > > > +static int adau7118_regulator_setup(struct adau7118_data *st)
> > > > +{
> > > > +	int ret = 0;
> > > > +
> > > > +	st->iovdd = devm_regulator_get_optional(st->dev,
> > > > "IOVDD");
> > > > +	if (!IS_ERR(st->iovdd)) {
> > > Unless the device can operate with supplies physically absent it
> > > should not be requesting regulators as optional, this breaks your
> > > error handling especially with probe deferral which is a fairly
> > > common case.
> > Just for my understanding (most likely I'm missing something
> > obvious),
> > why would I have issues with the error handling in probe deferral?
> 
> Actually it does look like you handle this correctly further down,
> the
> normal pattern would have been to have the error handling inside the
> if
> here and not indent the rest of the success path so I misread it.

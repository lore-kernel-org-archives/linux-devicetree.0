From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
Date: Thu, 10 Oct 2019 10:49:52 -0500
Message-ID: <c9203f7f-f360-0ede-d351-cfdbec03299c@linux.intel.com>
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
 <20191010120337.GB31391@ediswmail.ad.cirrus.com>
 <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
 <e671930b-645a-7ee3-6926-eea39626c0a3@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e671930b-645a-7ee3-6926-eea39626c0a3@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, robh+dt@kernel.org, lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
List-Id: devicetree@vger.kernel.org



> I still need to figure out prefixing multiple instances of this 
> Amplifier controls with "Left" and "Right"

FWIW we use the "snd_codec_conf" stuff to add a prefix for each 
amplifier, so that the controls are not mixed up between instances of 
the same amp, see e.g.

	
static struct snd_soc_codec_conf codec_conf[] = {
	{
		.dev_name = "sdw:0:25d:711:0:1",
		.name_prefix = "rt711",
	},
	{
		.dev_name = "sdw:1:25d:1308:0:0",
		.name_prefix = "rt1308-1",
	},
	{
		.dev_name = "sdw:2:25d:1308:0:2",
		.name_prefix = "rt1308-2",
	},
	{
		.dev_name = "sdw:3:25d:715:0:1",
		.name_prefix = "rt715",
	},
};


https://github.com/thesofproject/linux/pull/1142/commits/9ff9cf9d8994333df2250641c95431261bc66d69#diff-892560f80d603420baec7395e0b45d81R212

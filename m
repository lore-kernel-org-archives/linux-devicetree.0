From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
Date: Thu, 10 Oct 2019 15:52:56 +0100
Message-ID: <e671930b-645a-7ee3-6926-eea39626c0a3@linaro.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, robh+dt@kernel.org, lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 10/10/2019 15:01, Pierre-Louis Bossart wrote:
> 
>>>> It's been a while since this thread started, and I still don't
>>>> quite get the concepts or logic.
>>>>
>>>> First, I don't understand what the problem with "aux" devices is.
>>>> All the SoundWire stuff is based on the concept of DAI, so I guess
>>>> I am
>>>
>>> That is the actual problem! Some aux devices does not have dais.
>>>
>>
>> Usually aux devices are used for things like analog amplifiers that
>> clearly don't have a digital interface, thus it really makes no sense
>> to have a DAI link connecting them. So I guess my question here
>> would be what is the thinking on making the "smart amplifier" dailess?
>> It feels like having a CODEC to CODEC DAI between the CODEC and
>> the AMP would be a more obvious way to connect the two devices
>> and would presumably avoid the issues being discussed around the
>> patch.
> 
> Ah, now I get it, I missed the point about not having DAIs for the 
> amplifier.
> 
> I will second Charles' point, the code you have in the machine driver at 

I agree with Charles,

WSA8810/WSA8815 is connected via SoundWire digital interface, so I can 
try to model this amplifier with dais and see how it ends up.

I still need to figure out prefixing multiple instances of this 
Amplifier controls with "Left" and "Right"

> [1] gets a SoundWire stream context from the SLIMbus codec dai. It's a 
> bit odd to mix layers this way.

Yep we have a very mixed setup on this SoC.

So it looks like this.
Main WCD934X Codec which is connected via SLIMBus which has SoundWire 
Controller block along with other analog + digital blocks.
Again the SoundWire Controller from that WCD934X codec is wired up to 
WSA881X Smart speaker amplifiers.


> 
> 
> And if I look at the code below, taken from [1], if you have more than 
> one codec, then your code looks problematic: data->sruntime would be 
> overriden and you'd use the info from the last codec dai on the dailink...

This code has been written very much specific to DB845c which has only 
one codec. But I agree with your point.

--srini

> 
> case SLIMBUS_0_RX...SLIMBUS_6_TX:
>    for (i = 0 ; i < dai_link->num_codecs; i++) {
>      [snip]
>      data->sruntime[cpu_dai->id] =
>      snd_soc_dai_get_sdw_stream(rtd->codec_dais[i], 0); << same 
> destination for multiple codec_dais...
> 
> If you keep the amp dai-less, then the stream concept should be somehow 
> allocated on the master (or machine) side and passed to the codec dais 
> that are associated to the same 'stream'.
> 
> 
> [1] 
> https://git.linaro.org/people/srinivas.kandagatla/linux.git/tree/sound/soc/qcom/db845c.c?h=release/db845c/qcomlt-5.2 
> 
> 

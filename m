MIME-Version: 1.0
In-Reply-To: <87wpl13rlf.wl%kuninori.morimoto.gx@renesas.com>
References: <87k2h8g7rr.wl%kuninori.morimoto.gx@renesas.com>
	<20160704160736.GA25708@rob-hp-laptop>
	<87wpl13rlf.wl%kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Jul 2016 11:49:59 -0500
Message-ID: <CAL_JsqKGf-OToL0OmKDMz9qpEYmF+WTTyBApuqsSRU8ZXJWkCA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] of_graph: prepare for ALSA graph support
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>, Guennadi <g.liakhovetski@gmx.de>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-DT <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 4, 2016 at 6:41 PM, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
>
> Hi Rob, Mark
>
> Thank you for your feedback
>
>> I need to see how you want to use this. I'm not completely convinced
>> this is necessary as the port number should be meaningful. For example,
>> port 0 is video and port 1 is audio. This information is specific to the
>> local parent node which could be problematic if you have generic code
>> parsing the local node. However, if you know which local port is audio,
>> then you know the remote endpoint's port is also the audio port.
>
> Yes, as you pointed, sound side (= ALSA SoC) will use generic driver
> for sound card which needs to know its total port number.
> Then, these patches are needed.

But the sound card node will have ports

> I posted OF graph part only this time, but of course I have total full-set
> in my local environment.
> But these are ...
>  1) cleanup current generic sound driver (= almost 30 patch)
>  2) OF graph new feature (= this patch-set) (= almost 10 patch)
>  3) OF graph base generic sound driver (= almost 30 patch)
>  - ...
>
> I'm posting 1) part to ALSA SoC ML, 2) part to this ML.
> 1) will take more long term >> Mark ??
> If you want to see this patch-set together with use case, then 3) is needed.
> If so, I will merge 2) and 3), and post these to this ML and ALSA SoC ML.
>
> Is it OK for you ? >> Rob, Mark

Fine by me.

> I don't know how to handle it, but I can follow your opinion
>
>> In general, all these helpers look okay if you have a user for them.
>
> Thanks.
> As I explained above, it is based on 1) part, but it will takes more
> long term.
>

MIME-Version: 1.0
In-Reply-To: <87mvlw4nje.wl%kuninori.morimoto.gx@renesas.com>
References: <87k2h8g7rr.wl%kuninori.morimoto.gx@renesas.com>
	<20160704160736.GA25708@rob-hp-laptop>
	<87wpl13rlf.wl%kuninori.morimoto.gx@renesas.com>
	<87mvlw4nje.wl%kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Jul 2016 11:38:38 -0500
Message-ID: <CAL_JsqKvcNdxp27dvNUToKoDofLfqGVQvfaH-uwvDuepct3vfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] of_graph: prepare for ALSA graph support
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>, Guennadi <g.liakhovetski@gmx.de>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-DT <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 5, 2016 at 1:24 AM, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
>
> Hi Rob, Mark, again
>
>> Yes, as you pointed, sound side (= ALSA SoC) will use generic driver
>> for sound card which needs to know its total port number.
>> Then, these patches are needed.
>>
>> I posted OF graph part only this time, but of course I have total full-set
>> in my local environment.
>> But these are ...
>>  1) cleanup current generic sound driver (= almost 30 patch)
>>  2) OF graph new feature (= this patch-set) (= almost 10 patch)
>>  3) OF graph base generic sound driver (= almost 30 patch)
>>  - ...
>>
>> I'm posting 1) part to ALSA SoC ML, 2) part to this ML.
>> 1) will take more long term >> Mark ??
>> If you want to see this patch-set together with use case, then 3) is needed.
>> If so, I will merge 2) and 3), and post these to this ML and ALSA SoC ML.
>>
>> Is it OK for you ? >> Rob, Mark
>> I don't know how to handle it, but I can follow your opinion
>
> I think we can use 2 patterns ?
>
> pattern1)
>         post "OF graph new feature" patch and "ALSA SoC use it" patch
>
>         1. OF graph new feature 1 patch
>         2. ALSA SoC use feature 1 patch
>         3. OF graph new feature 2 patch
>         4. ALSA SoC use feature 2 patch
>         5. OF graph new feature 3 patch
>         6. ALSA SoC use feature 3 patch
>         ...
>
>         It is easy to review, but difficult on maintainer ?
>
> pattern2)
>         post "OF graph new feature" patch-set and "ALSA SoC use it" patch-set
>
>         1. OF graph new feature 1 patch
>         2. OF graph new feature 2 patch
>         3. OF graph new feature 3 patch
>         4. ALSA SoC use feature 1 patch
>         5. ALSA SoC use feature 2 patch
>         6. ALSA SoC use feature 3 patch
>         ...
>
>         It is easy on maintainer, difficult to review ?
>
> Actually, this patch-set is 1, 2, 3 part of pattern2).
> I can post all patch-set in next time if we use pattern2) case.
>
> Or I can post as pattern1), and maintainer will pickup as
> pattern2) order ?
>
>> > In general, all these helpers look okay if you have a user for them.
>>
>> Thanks.
>> As I explained above, it is based on 1) part, but it will takes more
>> long term.
>>

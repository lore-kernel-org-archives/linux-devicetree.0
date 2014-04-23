From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] dt: bindings: Typo s/interrupts-names/interrupt-names/g
Date: Wed, 23 Apr 2014 19:35:00 +0200
Message-ID: <CAMuHMdXO1u_Aw5BM7+a6TNM5+Rt-FCgnFLsGn9-w-nv=AKaaiQ@mail.gmail.com>
References: <1398192025-31523-1-git-send-email-geert+renesas@glider.be>
	<1398192025-31523-2-git-send-email-geert+renesas@glider.be>
	<CACRpkdY4gASYR7CR64ux6QgMNdmmNYt86QQF7gvvTjK_6C7c8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY4gASYR7CR64ux6QgMNdmmNYt86QQF7gvvTjK_6C7c8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Signed-off-by: Mark Brown" <broonie@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Apr 23, 2014 at 4:11 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Apr 22, 2014 at 8:40 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Signed-off-by: Mark Brown <broonie@linaro.org>
>> ---
>>  .../devicetree/bindings/pinctrl/pinctrl-st.txt     |    4 ++--
>>  .../bindings/sound/davinci-mcasp-audio.txt         |    2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> Maybe Mark can apply this then, as it's mostly sound related.
> Ideally it should be two patches but who cares about such a petty
> detail.

Opinions about patch granularity differ...
Grant Likely replied to one of the other patches in the series:

| Applied all, but squashed into a single patch. I'll send it up to Linus
| as a fix for 3.15

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

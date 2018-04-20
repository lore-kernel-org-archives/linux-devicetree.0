From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/4] regulator: bd9571mwv: Add support for DDR backup mode
Date: Fri, 20 Apr 2018 10:11:34 +0200
Message-ID: <CAMuHMdWeROfJNvUtfooN8gqA+nTRXhVLvQFpc-xiqUbG9XgcmA@mail.gmail.com>
References: <1524057484-25350-1-git-send-email-geert+renesas@glider.be> <20180420074914.vl4rer5zdeldfzb3@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180420074914.vl4rer5zdeldfzb3@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, Apr 20, 2018 at 9:49 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 18 Apr 2018, Geert Uytterhoeven wrote:
>> The ROHM BD9571MWV PMIC on the Renesas Salvator-X(S) and ULCB
>> development boards supports DDR Backup Power, which means that the DDR
>> power rails can be kept powered while the main SoC is powered down.
>
> Should this set be applied together, or can the MFD patches be applied
> on their own, without the Regulator patch?

The regulator patch depends on the MFD patches, so it's best for them to
go in together.

> If the former, then we're going to need an Ack from Mark.

Alternative, as you've already supplied (some form of) your Ack for the firs
3 patches, they can go in through Mark? All of it is enhancing the
regulator part.

I don't care much which path the patches take, though.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

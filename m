From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 2/2] regulator: da9210: Add optional interrupt support
Date: Tue, 17 Feb 2015 15:18:40 +0100
Message-ID: <CAMuHMdXOFVZWn+u4wyz4Ro_kS_LaWc4Mwrq-XZU3dPpjmX2E3w@mail.gmail.com>
References: <1424175072-14643-1-git-send-email-geert+renesas@glider.be>
	<1424175072-14643-2-git-send-email-geert+renesas@glider.be>
	<20150217140110.GV9110@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150217140110.GV9110@finisterre.sirena.org.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tue, Feb 17, 2015 at 3:01 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Feb 17, 2015 at 01:11:12PM +0100, Geert Uytterhoeven wrote:
>
>>   - Does there exist any regulator notifier event that corresponds to
>>     DA9210_E_VMAX?
>
> What does that mean, I might be able to tell you?  I guess it might be
> an over voltage event...

Possibly. There's no regulator notifier event for that yet, though.
Shall I add one?

Anyway, let's wait for confirmation from Dialog...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Mon, 17 Feb 2014 22:07:50 +0100
Message-ID: <CAMuHMdW7S=o4oHVsNtYo0i_giB5cgWhygo-GgSaA1Kur6m3vng@mail.gmail.com>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
	<201402121251.06280.arnd@arndb.de>
	<20140217155419.682F7C401D4@trevor.secretlab.ca>
	<1418981.0py7JxXCp8@wuerfel>
	<20140217182312.GV7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140217182312.GV7862@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laura Abbott <lauraa@codeaurora.org>, Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 7:23 PM, Jason Cooper <jason@lakedaemon.net> wrote:
>> Could we use a faster hash function that scans the entire device tree and
>> then just feed the output of that into add_device_randomness? We probably
>> can't expect that there is a lot of entropy in the DT blob, so the
>> result wouldn't be all that different in terms of quality of the random
>> seed.
>
> I think it would be easier to identify the few attributes that differ
> from board to board (mac address, serial number, etc), and differ from
> boot to boot (random-seed, timestamp) and just extract and feed those
> in.

Isn't identifying those (mostly) a manual process?
Calculating a fast hash is fully automatic.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

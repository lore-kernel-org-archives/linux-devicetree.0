Return-Path: <SRS0=pywT=HA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180411081258.GI6436@w540>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com> <20180411081258.GI6436@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Apr 2018 10:35:21 +0200
Message-ID: <CAMuHMdV2yr9+wGZMTHPK4SN4oc9OQ5nAV9BgqUOK31z4x92Qjw@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
Content-Type: text/plain; charset="UTF-8"
To: jacopo mondi <jacopo@jmondi.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On Wed, Apr 11, 2018 at 10:12 AM, jacopo mondi <jacopo@jmondi.org> wrote:
> On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
>> This series adds thermal support for r8a77995.
>> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
>> Therefore this series adds r8a77995 support to rcar_thermal driver not
>> rcar_gen3_thermal driver.
>>
>> This series is based on the next branch of Zhang Rui's linux tree.
>
> Seems like I cannot find Zhang's tree anywhere. My google-fu is surely
> bad, but can you paste a link to the tree here below, please?

That tree is included in renesas-drivers:

  - git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git#next

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

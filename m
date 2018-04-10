From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 0/1] arm: npcm: enable L2 cache in NPCM7xx architecture
Date: Tue, 10 Apr 2018 16:41:11 +0200
Message-ID: <CAK8P3a30uzYXUVBV72+OiAUxdVRD+=VdLg_nH4c1TSxGzfvNCw@mail.gmail.com>
References: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: arm-soc <arm@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 8, 2018 at 4:03 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> This patch Enable ARM L2 cache module in Nuvoton NPCM7xx BMC
> by adding L2 cache parameters into NPCM7xx DT machine start structure.
>
> At patch V7 arm: npcm: add basic support for Nuvoton BMCs we got comments
> regarding the flags use in L2 cache module.
> - https://www.spinics.net/lists/arm-kernel/msg613212.html
>
> After checking again the L2 cache use in the NPCM7xx,
> the only L2 cache flag we need to set is L2C_AUX_CTRL_SHARED_OVERRIDE
> and it is done in the device tree:
> https://patchwork.kernel.org/patch/10063497/
>
> L2 cache flag mask allowed all the flag option.

I've applied the patch to my fixes branch now, but took your description above
instead of the two-line text that you had in the patch itself. I liked
the longer
text much better.

      Arnd

From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH 00/14] dma-jz4780 improvements
Date: Tue, 3 Jul 2018 21:32:13 +0200
Message-ID: <CA+7wUsykjQkSHshNNVJaZJ4d_U9Q4fhaoRaNOTHhjoj43xRPLg@mail.gmail.com>
References: <20180703123214.23090-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703123214.23090-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: vkoul@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, dansilsby@gmail.com, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 3, 2018 at 2:32 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> This set of patches by myself and Daniel extends the dma-jz4780 driver
> to support other SoCs (JZ4770, JZ4740, JZ4725B).
>
> Some fixes are also included, for proper residue reporting, which fixes
> errors with ALSA.
>
> Finally, the last two patches update the devicetree bindings for the
> JZ4780 SoC and add a binding for the JZ4770 SoC.
>
> This patchset was tested on JZ4780, JZ4770 and JZ4725B, but was not tested
> on the JZ4740, so it would be fantastic if somebody could test it there.

For the entire series, everything works as expected on JZ4780 (Creator
CI20), including reading from sdcard.

Tested-by: Mathieu Malaterre <malat@debian.org>

> Regards,
> -Paul
>

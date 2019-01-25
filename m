From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH] xtensa: rename BUILTIN_DTB to BUILTIN_DTB_SOURCE
Date: Fri, 25 Jan 2019 12:51:30 -0800
Message-ID: <CAMo8Bf+1ePb+AfN1c-5sREYHr93bg4dbtTRtKHKrdbvQSPr2zg@mail.gmail.com>
References: <1548236958-17565-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548236958-17565-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>
Cc: Chris Zankel <chris@zankel.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2019 at 1:49 AM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> When building some xtensa config, I hit the following warning:
> drivers/staging/mt7621-dts/Kconfig:4:warning: 'BUILTIN_DTB' has wrong type. 'select' only accept arguments of bool and tristate type
>
> It is due to some arch use BUILTIN_DTB as a flag for the need to builtin
> dtb but xtensa use it as a string for which dtb to bulltin.
> But for this (which dtb to build), it is better to use
> BUILTIN_DTB_SOURCE like other arch do.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  arch/xtensa/Kconfig                         | 2 +-
>  arch/xtensa/boot/dts/Makefile               | 6 +++---
>  arch/xtensa/configs/audio_kc705_defconfig   | 2 +-
>  arch/xtensa/configs/cadence_csp_defconfig   | 2 +-
>  arch/xtensa/configs/generic_kc705_defconfig | 2 +-
>  arch/xtensa/configs/nommu_kc705_defconfig   | 2 +-
>  arch/xtensa/configs/smp_lx200_defconfig     | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied to my xtensa tree after reformatting commit message a bit.

-- 
Thanks.
-- Max

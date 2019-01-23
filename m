From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH] xtensa: rename BUILTIN_DTB to BUILTIN_DTB_SOURCE
Date: Wed, 23 Jan 2019 11:33:36 -0800
Message-ID: <CAMo8BfL=MX3GhggPbaKUFj5sPme5W3crDEMkMU8BgQJARcMjRw@mail.gmail.com>
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

It's odd that we see a warning from the driver's Kconfig, even though
the driver itself is not selected (it depends on SOC_MT7621 which
is a MIPS-based SoC).

-- 
Thanks.
-- Max

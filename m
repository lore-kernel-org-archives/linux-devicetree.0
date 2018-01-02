From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v5 07/15] MIPS: Setup boot_command_line before plat_mem_setup
Date: Tue, 2 Jan 2018 18:05:43 +0100
Message-ID: <CA+7wUsyfrFcGevgfRb9S3T1bSGaFjN=y1gfg70D21vpw26YWzQ@mail.gmail.com>
References: <20180102150848.11314-1-paul@crapouillou.net> <20180102150848.11314-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180102150848.11314-7-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Burton <paul.burton@mips.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 2, 2018 at 4:08 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> From: Paul Burton <paul.burton@imgtec.com>
>
> Platforms using DT will typically call __dt_setup_arch from
> plat_mem_setup. This in turn calls early_init_dt_scan. When
> CONFIG_CMDLINE is set, this leads to its value being copied into
> boot_command_line by early_init_dt_scan_chosen. If this happens before
> the code setting up boot_command_line in arch_mem_init runs, that code
> will go on to append CONFIG_CMDLINE (via builtin_cmdline) to
> boot_command_line again, duplicating it. For some command line
> parameters (eg. earlycon) this can be a problem. Set up
> boot_command_line before early_init_dt_scan_chosen gets called such that
> it will not write CONFIG_CMDLINE in this scenario & the arguments aren't
> duplicated.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>  arch/mips/kernel/setup.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
>  v2: New patch in this series
>  v3: No change
>  v4: No change
>  v5: No change

I would have used @mips email. Anyway:

Acked-by: Mathieu Malaterre <malat@debian.org>

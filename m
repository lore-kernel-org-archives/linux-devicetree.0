From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: include errno.h
Date: Sat, 29 Oct 2011 10:38:16 +0200
Message-ID: <CAMuHMdX-V6FqSZ_mmPm5aW_bTUNMk4sz5cADryX3Xyk627wRdg@mail.gmail.com>
References: <20111006124044.1066.7111.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111006124044.1066.7111.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 6, 2011 at 14:40, Kalle Valo <kvalo@qca.qualcomm.com> wrote=
:
> When compiling ath6kl for beagleboard (omap2plus_defconfig plus
> CONFIG_ATH6KL, CONFIG_OF disable) with current linux-next compilation
> fails:
>
> include/linux/of.h:269: error: 'ENOSYS' undeclared (first use in this=
 function)
> include/linux/of.h:276: error: 'ENOSYS' undeclared (first use in this=
 function)
> include/linux/of.h:289: error: 'ENOSYS' undeclared (first use in this=
 function)

And now this build failure (also on m68k) has hit Linus' tree, more
than 3 weeks after
its detection in -next...

> Fix this by including errno.h from of.h.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0include/linux/of.h | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9180dc5..219c29d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -17,6 +17,7 @@
> =C2=A0*/
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/bitops.h>
> +#include <linux/errno.h>
> =C2=A0#include <linux/kref.h>
> =C2=A0#include <linux/mod_devicetable.h>
> =C2=A0#include <linux/spinlock.h>

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds

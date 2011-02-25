From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] x86: OLPC: have prom_early_alloc BUG rather than return NULL
Date: Thu, 24 Feb 2011 23:20:10 -0700
Message-ID: <AANLkTi=PpPKoHr1sOAwZZaFhVX9HOOqT7AYgY2QaX92O@mail.gmail.com>
References: <20110224200631.0007833e@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110224200631.0007833e@queued.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 24, 2011 at 9:06 PM, Andres Salomon <dilinger@queued.net> w=
rote:
>
> ..similar to what sparc's prom_early_alloc does.
>
> Signed-off-by: Andres Salomon <dilinger@queued.net>

What the hey, I've picked this up since it makes the other patch
simpler.  I'll push the two patches to linux-next tomorrow and ask
Linus to pull in a few days.

g.

> ---
> =A0arch/x86/platform/olpc/olpc_dt.c | =A0 =A03 +--
> =A01 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olp=
c/olpc_dt.c
> index dab8746..044bda5 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -140,8 +140,7 @@ void * __init prom_early_alloc(unsigned long size=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * wasted bootmem) and hand off chunks=
 of it to callers.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0res =3D alloc_bootmem(chunk_size);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!res)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(!res);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prom_early_allocated +=3D chunk_size;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(res, 0, chunk_size);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free_mem =3D chunk_size;
> --
> 1.7.2.3
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

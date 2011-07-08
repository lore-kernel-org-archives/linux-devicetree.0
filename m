From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: mmp: remove SPARSE_IRQ for mmp
Date: Fri, 8 Jul 2011 08:46:37 -0600
Message-ID: <CACxGe6sg=RQKQKVXh-XU5V_PkO8ZA7ho5fXx+oRxzEJV10pxVw@mail.gmail.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1310120428-22700-1-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, samuel.ortiz-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 8, 2011 at 4:20 AM, Haojian Zhuang
<haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> Avoid to use SPARSE_IRQ for mmp. There will be irq domain translation bet=
ween
> DT irq specifier and the Linux irq number.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

I believe the goal is to use more sparse_irq, not less, and the
irq_domain code works fine either way.

g.

> ---
> =A0arch/arm/Kconfig | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 17507b8..48748fb 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -545,7 +545,6 @@ config ARCH_MMP
> =A0 =A0 =A0 =A0select HAVE_SCHED_CLOCK
> =A0 =A0 =A0 =A0select TICK_ONESHOT
> =A0 =A0 =A0 =A0select PLAT_PXA
> - =A0 =A0 =A0 select SPARSE_IRQ
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for Marvell's PXA168/PXA910(MMP) and MMP2 proc=
essor line.
>
> --
> 1.5.6.5
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

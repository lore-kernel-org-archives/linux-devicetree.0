From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Fix device tree blob corruption.
Date: Wed, 22 Sep 2010 00:13:16 -0300
Message-ID: <AANLkTi=D18Z91ZFW_Nz_ZC4COXTyH6-kGwOe2HTxfn5u@mail.gmail.com>
References: <1285050292-11216-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1285050292-11216-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 21, 2010 at 3:24 AM, Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> The device tree support for arm is broken in git://git.secretlab.ca/git/l=
inux-2.6.git test-devtree.
> due to not reserving the memory used by the device tree blob.The device t=
ree blob gets corrupted
> as a result. The patch reserves the memblock used by device tree blob.
>
> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> =A0arch/arm/mm/init.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 018b76e..c03ceb9 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -310,6 +310,8 @@ void __init arm_memblock_init(struct meminfo *mi, str=
uct machine_desc *mdesc)
> =A0 =A0 =A0 =A0}
> =A0#endif
> =A0#ifdef CONFIG_OF_FLATTREE
> + =A0 =A0 =A0 if (phys_devtree_size)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memblock_reserve(phys_devtree_start, phys_d=
evtree_size);
> =A0 =A0 =A0 =A0if (phys_initrd_size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memblock_reserve(phys_initrd_start, phys_i=
nitrd_size);

Actually, the existing memblock_reserve line is buggy (copy & paste
error).  I've fixed it in my tree now.  I'll push it out once I get
home and have a chance to test it (Thursday).

g.

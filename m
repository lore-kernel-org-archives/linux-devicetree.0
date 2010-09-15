From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 13/15] ppc/pseries: iommu cleanup
Date: Wed, 15 Sep 2010 12:34:35 -0600
Message-ID: <AANLkTi=Hu44HLHj5RAUvSfR9Bv--OZEvi5eDj-R=yiks@mail.gmail.com>
References: <1284573958-8397-1-git-send-email-nacc@us.ibm.com>
	<1284573958-8397-14-git-send-email-nacc@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1284573958-8397-14-git-send-email-nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nishanth Aravamudan <nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 15, 2010 at 12:05 PM, Nishanth Aravamudan <nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wro=
te:
> No need to initialize per-cpu pointer to NULL, it is the default.
>
> Direct dma ops and no setup are the defaults, no need to set for
> iommu-off.
>
> Signed-off-by: Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>
> Signed-off-by: Nishanth Aravamudan <nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

Also looks correct.

Reviewed-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

g.

> ---
> =A0arch/powerpc/platforms/pseries/iommu.c | =A0 =A09 ++-------
> =A01 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platfo=
rms/pseries/iommu.c
> index a77bcae..9184db3 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -140,7 +140,7 @@ static int tce_build_pSeriesLP(struct iommu_table *tb=
l, long tcenum,
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> -static DEFINE_PER_CPU(u64 *, tce_page) =3D NULL;
> +static DEFINE_PER_CPU(u64 *, tce_page);
>
> =A0static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcen=
um,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 l=
ong npages, unsigned long uaddr,
> @@ -589,13 +589,8 @@ static struct notifier_block iommu_reconfig_nb =3D {
> =A0/* These are called very early. */
> =A0void iommu_init_early_pSeries(void)
> =A0{
> - =A0 =A0 =A0 if (of_chosen && of_get_property(of_chosen, "linux,iommu-of=
f", NULL)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Direct I/O, IOMMU off */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ppc_md.pci_dma_dev_setup =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ppc_md.pci_dma_bus_setup =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_pci_dma_ops(&dma_direct_ops);
> + =A0 =A0 =A0 if (of_chosen && of_get_property(of_chosen, "linux,iommu-of=
f", NULL))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> - =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0if (firmware_has_feature(FW_FEATURE_LPAR)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (firmware_has_feature(FW_FEATURE_MULTIT=
CE)) {
> --
> 1.7.0.4
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

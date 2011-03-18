From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/7] mmc: make the reference to sdhci_tegra_dt_pdata
	conditional
Date: Fri, 18 Mar 2011 09:22:03 +0800
Message-ID: <20110318012202.GA26951@S2100-06.ap.freescale.net>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-4-git-send-email-shawn.guo@linaro.org>
	<20110315075859.GL23050@angua.secretlab.ca>
	<AANLkTi=umf9nDpExLEBgJEMgUP-CJUUEbAQrQfdBw7Fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=umf9nDpExLEBgJEMgUP-CJUUEbAQrQfdBw7Fd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 01:59:00PM -0600, Grant Likely wrote:
> On Tue, Mar 15, 2011 at 1:58 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
> > On Mon, Mar 14, 2011 at 10:25:55PM +0800, Shawn Guo wrote:
> >> Wrap tegra dt_id with CONFIG_MMC_SDHCI_TEGRA to make the reference to
> >> sdhci_tegra_dt_pdata conditional, otherwise it will stop build for
> >> other mmc driver when OF is enabled.
> >>
> >> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Looks right to me.
> =

> Actually...
> =

> >
> > g.
> >
> >> ---
> >> =A0drivers/mmc/host/sdhci-pltfm.c | =A0 =A02 ++
> >> =A01 files changed, 2 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-p=
ltfm.c
> >> index ccc04ac..4125fbf 100644
> >> --- a/drivers/mmc/host/sdhci-pltfm.c
> >> +++ b/drivers/mmc/host/sdhci-pltfm.c
> >> @@ -52,7 +52,9 @@ static struct sdhci_ops sdhci_pltfm_ops =3D {
> >> =A0#if defined(CONFIG_OF)
> >> =A0#include <linux/of_device.h>
> >> =A0static const struct of_device_id sdhci_dt_ids[] =3D {
> >> +#ifdef CONFIG_MMC_SDHCI_TEGRA
> >> =A0 =A0 =A0 { .compatible =3D "nvidia,tegra250-sdhci", .data =3D &sdhc=
i_tegra_dt_pdata },
> >> +#endif
> >> =A0 =A0 =A0 { }
> >> =A0};
> >> =A0MODULE_DEVICE_TABLE(platform, sdhci_dt_ids);
> =

> It would be better if the #ifdef went around the entire sdhci_dt_ids
> table including the MODULE_DEVICE_TABLE registration.
> =

You really want to go this?  In that case, all the references to
sdhci_dt_ids will have to get around by the #ifdef.

-- =

Regards,
Shawn

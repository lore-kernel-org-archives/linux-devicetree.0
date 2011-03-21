From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/5] make sdhci device drivers self registered
Date: Mon, 21 Mar 2011 00:58:49 -0600
Message-ID: <AANLkTimrJ3=GS-+o1vcBpMXg0Phwnu9SVgm0WA-Ck_sf@mail.gmail.com>
References: <1300678938-8046-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1300678938-8046-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 20, 2011 at 9:42 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch set is to take sdhci device driver specific things out
> from sdhci-pltfm.c and make them self registered. Here are the
> difference it makes.
>
> =A0* Get the sdhci device driver follow the Linux trend that driver
> =A0 take the registration by its own
> =A0* sdhci-pltfm.c becomes significantly simpler and only has common
> =A0 support functions there
> =A0* All sdhci device specific stuff are going back its own driver
> =A0* The dt and non-dt support share the same pair of .probe and
> =A0 .remove hooks.

Fantastic!  Thanks for taking this on.  I'll make a few comments, but
this series really needs to be reposted to both the linux-kernel and
linux-mmc lists.

g.

>
> The first one patch adds common support function into sdhci-pltfm.c
> when changing sdhci-esdhc-imx driver, while the last one clean up
> sdhci-pltfm.c when changing sdhci-tegra driver.
>
> Only the patch of sdhci-esdhc-imx are tested on hardware, and others
> are just build tested.
>
> Regards,
> Shawn
>
> Shawn Guo (5):
> =A0 =A0 =A0mmc: sdhci: make sdhci-esdhc-imx driver self registered
> =A0 =A0 =A0mmc: sdhci: make sdhci-cns3xxx driver self registered
> =A0 =A0 =A0mmc: sdhci: make sdhci-dove driver self registered
> =A0 =A0 =A0mmc: sdhci: make sdhci-tegra driver self registered
> =A0 =A0 =A0mmc: sdhci: update Makefile/Kconfig for sdhci_pltfm change
>
> =A0drivers/mmc/host/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 24 +++--
> =A0drivers/mmc/host/Makefile =A0 =A0 =A0 =A0 =A0| =A0 11 +-
> =A0drivers/mmc/host/sdhci-cns3xxx.c =A0 | =A0 68 +++++++++++++-
> =A0drivers/mmc/host/sdhci-dove.c =A0 =A0 =A0| =A0 70 +++++++++++++-
> =A0drivers/mmc/host/sdhci-esdhc-imx.c | =A0 98 +++++++++++++++----
> =A0drivers/mmc/host/sdhci-pltfm.c =A0 =A0 | =A0165 ++--------------------=
---------
> =A0drivers/mmc/host/sdhci-pltfm.h =A0 =A0 | =A0 14 ++-
> =A0drivers/mmc/host/sdhci-tegra.c =A0 =A0 | =A0189 +++++++++++++++++++++-=
--------------
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

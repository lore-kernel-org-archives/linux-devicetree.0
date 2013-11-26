From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 0/4] Add dt support for exynos hdmiphy settings
Date: Tue, 26 Nov 2013 10:21:11 +0900
Message-ID: <010201ceea45$cacdefe0$6069cfa0$%dae@samsung.com>
References: <1385369679-4337-1-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1385369679-4337-1-git-send-email-s.shirish@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: 'Shirish S' <s.shirish@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: airlied@redhat.com, 'Kukjin Kim' <kgene.kim@samsung.com>, shirish@chromium.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

CCing Kukjin, Sylwester, and Tomasz.

Hi Kukjin, Sylwester, and Tomasz,

Shirish has investigated hdmiphy configuration in more detail, and updated
it since we gave comments to him. Shouldn't this patch series be reviewed
again? Plz, give him your feedback if necessary.

Thanks,
Inki Dae

> -----Original Message-----
> From: Shirish S [mailto:s.shirish@samsung.com]
> Sent: Monday, November 25, 2013 5:55 PM
> To: dri-devel@lists.freedesktop.org; inki.dae@samsung.com;
> devicetree@vger.kernel.org; mark.rutland@arm.com
> Cc: airlied@redhat.com; shirish@chromium.org; Shirish S
> Subject: [PATCH 0/4] Add dt support for exynos hdmiphy settings
> 
> For various revisions of a chipset if the signal pattern is changed for
> every
> revision, then the phy setting need to be updated correspondingly by
> measuring
> the signal.
> For getting correct signals the clock level and data de-emphasis
> levels needs to be adjusted.
> Since only these 2 values matter,we can move the same to dt,
> wherein we can have different dt files for every revision.
> 
> This is an initial patchset towards achieving the same
> for exynos 5250 and can be later extended to future chipsets.
> 
> V2: replaced moving of entire phy config structure with only
> required and justifiable conf registers.
> 
> V3: Incorporated Mark Rutland's comments.
> 
> V4: Rebased and included cros5250-common.dtsi.
> 
> V5: removed nr-configs feild and also the constraint
>     of having the exact number of configs in the dt file
>     as in the driver, the programmer can add only the pixel
>     clock that needs to be updated.
> 
> V6:
> V7: removed nr-configs form the dtsi files.
> 
> Shirish S (4):
>   ARM: dts: smdk5250: Add hdmi phy settings
>   ARM: dts: arndale: Add hdmi phy settings
>   ARM: exynos: dts: cros5250: Add hdmi phy settings
>   drm: exynos: hdmi: Add dt support for hdmiphy settings
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   31 ++++++++
>  arch/arm/boot/dts/cros5250-common.dtsi             |   74
+++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts           |   74
> +++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   74
> +++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   77
> +++++++++++++++++++-
>  5 files changed, 326 insertions(+), 4 deletions(-)
> 
> --
> 1.7.9.5

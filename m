From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4]  Add dt support for exynos hdmiphy settings
Date: Wed, 04 Dec 2013 10:14:56 +0530
Message-ID: <1386132300-29558-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For various revisions of a chipset if the signal pattern is changed for every
revision, then the phy setting need to be updated correspondingly by measuring
the signal.
For getting correct signals the clock level and data de-emphasis 
levels needs to be adjusted.
Since only these 2 values matter,we can move the same to dt, 
wherein we can have different dt files for every revision. 

This is an initial patchset towards achieving the same 
for exynos 5250 and can be later extended to future chipsets.

V2: replaced moving of entire phy config structure with only
required and justifiable conf registers.

V3: Incorporated Mark Rutland's comments.

V4: Rebased and included cros5250-common.dtsi.

V5: removed nr-configs feild and also the constraint
    of having the exact number of configs in the dt file
    as in the driver, the programmer can add only the pixel
    clock that needs to be updated.

V6:
V7: removed nr-configs form the dtsi files.

V8: Fixed build error

V9: rebased and incorporated Tomasz comments.


Shirish S (4):
  ARM: dts: smdk5250: Add hdmi phy settings
  ARM: dts: arndale: Add hdmi phy settings
  ARM: exynos: dts: cros5250: Add hdmi phy settings
  drm: exynos: hdmi: Add dt support for hdmiphy settings

 .../devicetree/bindings/video/exynos_hdmi.txt      |   34 ++++++++
 arch/arm/boot/dts/cros5250-common.dtsi             |   74 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts           |   74 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   74 ++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   89 ++++++++++++++++----
 5 files changed, 327 insertions(+), 18 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

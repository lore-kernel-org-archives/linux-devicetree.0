From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 0/3] Add dt support for exynos hdmiphy settings
Date: Mon, 28 Oct 2013 23:02:13 +0900
Message-ID: <03a501ced3e6$4d5ad3e0$e8107ba0$%dae@samsung.com>
References: <1382956755-1318-1-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382956755-1318-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Shirish S' <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shirish,

I have merged the re-factoring patch set from Sean Paul to exynos-drm-next.
Can you re-base your patch set at top of exynos-drm-next?

Thanks,
Inki Dae

> -----Original Message-----
> From: Shirish S [mailto:s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Monday, October 28, 2013 7:39 PM
> To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; Shirish S
> Subject: [PATCH 0/3] Add dt support for exynos hdmiphy settings
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
> Shirish S (3):
>   ARM: dts: smdk5250: Add hdmi phy settings
>   ARM: dts: arndale: Add hdmi phy settings
>   drm: exynos: hdmi: Add dt support for hdmiphy settings
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   32 +++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts           |   68
++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   68
++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   76
++++++++++++++++++-
> -
>  4 files changed, 240 insertions(+), 4 deletions(-)
> 
> --
> 1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

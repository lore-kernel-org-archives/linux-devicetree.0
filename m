From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V2 PATCH 09/12] arm64: dts: move Huawei Angler (Nexus 6P)
 to qcom directory
Date: Sat, 8 Oct 2016 20:28:54 -0500
Message-ID: <20161009012854.GJ18158@rob-hp-laptop>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475375919-618-10-git-send-email-jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 07:38:36PM -0700, Jeremy McNicoll wrote:
> Given that this is a MSM SoC and not a specific vendor created
> SoC moving associated device tree files to qcom directory.
> 
> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/huawei/Makefile                             | 5 -----
>  arch/arm64/boot/dts/qcom/Makefile                               | 4 ++--
>  arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts | 2 +-

What tree are you based on? There's no huawei dir in mainline. You need 
to rebase everything.

>  3 files changed, 3 insertions(+), 8 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/huawei/Makefile
>  rename arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts (96%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

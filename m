From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Expose download-mode control
Date: Wed, 31 May 2017 14:31:42 -0500
Message-ID: <20170531193142.xnf5nvnq7iejnuva@rob-hp-laptop>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170527063308.10483-2-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 11:33:07PM -0700, Bjorn Andersson wrote:
> In order to aid post-mortem debugging the Qualcomm platforms provides a
> "memory download mode", where the boot loader will provide an interface
> for custom tools to "download" the content of RAM to a host machine.
> 
> The mode is triggered by writing a magic value somehwere in RAM, that is
> read in the boot code path after a warm-restart. Two mechanism for
> setting this magic value are supported in modern platforms; a direct SCM
> call to enable the mode or through a secure io write of a magic value.
> 
> In order for a normal reboot not to trigger "download mode" the magic
> must be cleared during a clean reboot.

This must be happening somewhere before the kernel is entered? Or 
warm-restarts are not the norm?

> Download mode has to be enabled by including qcom_scm.download_mode=1 on
> the command line.

This looks similar to reboot reason functionality (i.e. boot into mode 
X). I'd expect this to use that at least for the kernel. Not sure about 
bindings though.

> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes since v1:
> - Specify DT propert being two-cell
> - Correct handling of scm-call return code
> 
>  .../devicetree/bindings/firmware/qcom,scm.txt      |  2 +
>  drivers/firmware/qcom_scm-32.c                     |  6 +++
>  drivers/firmware/qcom_scm-64.c                     | 13 +++++++
>  drivers/firmware/qcom_scm.c                        | 43 ++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h                        |  2 +
>  5 files changed, 66 insertions(+)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
Date: Fri, 10 Nov 2017 15:08:08 -0600
Message-ID: <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
References: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
 <1510238775-14883-6-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510238775-14883-6-git-send-email-sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 08:16:14PM +0530, Sricharan R wrote:
> IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
> (Lithium) IP. An mdt type single image format is used for the
> firmware. So the mdt_load function can be directly used to load
> the firmware. Also add the relevant resets required for this core.
> 
> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-

Please add acks when posting new versions.

>  drivers/remoteproc/Kconfig                         |  1 +
>  drivers/remoteproc/qcom_q6v5_pil.c                 | 53 +++++++++++++++++++++-
>  3 files changed, 59 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

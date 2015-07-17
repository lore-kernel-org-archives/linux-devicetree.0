From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: sti: adapt DT to fix probe/bind issues in DRM
 driver
Date: Fri, 17 Jul 2015 13:51:27 +0200
Message-ID: <55A8EC3F.6050903@st.com>
References: <1437133510-13615-1-git-send-email-benjamin.gaignard@linaro.org> <1437133510-13615-2-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437133510-13615-2-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear ARM SoC Maintainers,

On 07/17/2015 01:45 PM, Benjamin Gaignard wrote:
> STI drm drivers probe and bind using component framework was incorrect.
> In addition to drivers fix DT update is needed to make all sub-components
> become childs of sti-display-subsystem.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm/boot/dts/stih407.dtsi | 82 +++++++++++++++++++++---------------------
>   arch/arm/boot/dts/stih410.dtsi | 82 +++++++++++++++++++++---------------------
>   2 files changed, 80 insertions(+), 84 deletions(-)
>
>

This patch solves an issue preventing DRM driver probing, but it breaks 
the DT ABI.
For now, this driver and its DT node are only used by a few identified 
people.

Since these people only use aligned version of Kernel and DT, do you 
accept we break the ABI for this time?

Thanks in advance,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

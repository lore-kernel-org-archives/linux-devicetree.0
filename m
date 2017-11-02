From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mfd: syscon: Add hardware spinlock support
Date: Wed, 1 Nov 2017 19:12:50 -0500
Message-ID: <20171102001250.quhcn6jwkcx7rwov@rob-hp-laptop>
References: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
 <8bb857ed54569196d646084a9817a8a1985e2029.1509501110.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8bb857ed54569196d646084a9817a8a1985e2029.1509501110.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 10:11:56AM +0800, Baolin Wang wrote:
> Some system control registers need hardware spinlock to synchronize
> between the multiple subsystems, so we should add hardware spinlock
> support for syscon.
> 
> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes since v1:
>  - Remove timeout configuration.
>  - Modify the binding file to add hwlocks.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.txt |    1 +
>  drivers/mfd/syscon.c                             |    7 +++++++
>  2 files changed, 8 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

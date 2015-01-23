From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 RESEND 1/8] dt: bindings: Supply shared ST IRQ
 defines
Date: Fri, 23 Jan 2015 16:58:11 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501231656310.5526@nanos>
References: <1421920133-7914-1-git-send-email-lee.jones@linaro.org> <1421920133-7914-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421920133-7914-2-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, jason@lakedaemon.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jan 2015, Lee Jones wrote:

> These defines are used to allow values used for configuration to be
> easily human readable and will lessen the chance of logical mistakes.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/dt-bindings/interrupt-controller/irq-st.h | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/irq-st.h
> 
> diff --git a/include/dt-bindings/interrupt-controller/irq-st.h b/include/dt-bindings/interrupt-controller/irq-st.h
> new file mode 100644
> index 0000000..4c59ace
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/irq-st.h
> @@ -0,0 +1,30 @@
> +/*
> + *  include/linux/irqchip/irq-st.h

Copy & Paste?

Can we please stop adding these pointless filenames all over the
place? They are useless and wrong in a lot of cases.

Aside of that, this needs an ack from the DT folks.

Thanks,

	tglx

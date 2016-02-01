From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: light: opt3001: Add device tree binding
 documentation
Date: Mon, 1 Feb 2016 09:18:48 -0600
Message-ID: <20160201151848.GA11967@rob-hp-laptop>
References: <1454094180-2688-1-git-send-email-dannenberg@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454094180-2688-1-git-send-email-dannenberg-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnuzQB+pC5nmwQ@public.gmane.org, mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 29, 2016 at 01:03:00PM -0600, Andreas Dannenberg wrote:
> Signed-off-by: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/light/opt3001.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/opt3001.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/opt3001.txt b/Documentation/devicetree/bindings/iio/light/opt3001.txt
> new file mode 100644
> index 0000000..55b9cb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/opt3001.txt
> @@ -0,0 +1,26 @@
> +* Texas Instruments OPT3001 Ambient Light Sensor
> +
> +The driver supports interrupt-driven and interrupt-less operation, depending
> +on whether an interrupt property has been populated into the DT. Note that
> +the optional generation of IIO events on rising/falling light threshold changes
> +requires the use of interrupts. Without interrupts, only the simple reading
> +of the current light value is supported through the IIO API.

Seems like you could poll and do the threshold changes in s/w. Anyway, 
that's all irrelevant to the DT binding.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

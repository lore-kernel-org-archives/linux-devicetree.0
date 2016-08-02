From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: [PATCH v5 1/2] of: add J-Core timer bindings
Date: Tue, 2 Aug 2016 18:57:12 -0400
Message-ID: <20160802225712.GD15995@brightrain.aerifal.cx>
References: <cover.1469688975.git.dalias@libc.org>
 <afa8eaaebc9216e83e542e9bcad8fa1dd659d489.1469688975.git.dalias@libc.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <afa8eaaebc9216e83e542e9bcad8fa1dd659d489.1469688975.git.dalias-8zAoT0mYgF4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2016 at 11:18:58PM +0000, Rich Felker wrote:
> Signed-off-by: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
> ---
>  .../devicetree/bindings/timer/jcore,pit.txt        | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.txt b/Documentation/devicetree/bindings/timer/jcore,pit.txt
> new file mode 100644
> index 0000000..0f42af4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/jcore,pit.txt
> @@ -0,0 +1,25 @@
> +J-Core Programmable Interval Timer and Clocksource
> +
> +Required properties:
> +
> +- compatible: Must be "jcore,pit".
> +
> +- reg: Memory region(s) for timer/clocksource registers. For SMP,
> +  there should be one region per cpu, indexed by the sequential,
> +  zero-based hardware cpu number (which is also the logical cpu
> +  number).

One detail I missed: Mark Rutland asked me to remove the corresponding
remark about logical cpu numbers from the AIC binding document, so I
think it should be removed here too for the same reason -- it's a
Linux implementation detail, not part of the hw binding.

Rich
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

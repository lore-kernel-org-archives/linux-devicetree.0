From: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Subject: Re: [PATCH v6 3/7] media: i2c: max2175: Add MAX2175 support
Date: Wed, 7 Jun 2017 10:17:21 -0300
Message-ID: <20170607101721.064aafe4@vento.lan>
References: <20170531084457.4800-1-ramesh.shanmugasundaram@bp.renesas.com>
        <20170531084457.4800-4-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170531084457.4800-4-ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, crope-X3B1VOXEql0@public.gmane.org, chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Em Wed, 31 May 2017 09:44:53 +0100
Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> escreveu:

> +++ b/Documentation/media/v4l-drivers/max2175.rst
> @@ -0,0 +1,60 @@
> +Maxim Integrated MAX2175 RF to bits tuner driver
> +================================================
> +
> +The MAX2175 driver implements the following driver-specific controls:
> +
> +``V4L2_CID_MAX2175_I2S_ENABLE``
> +-------------------------------
> +    Enable/Disable I2S output of the tuner.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 4
> +
> +    * - ``(0)``
> +      - I2S output is disabled.
> +    * - ``(1)``
> +      - I2S output is enabled.

Hmm... There are other drivers at the subsystem that use I2S
(for audio - not for SDR - but I guess the issue is similar).

On such drivers, the bridge driver controls it directly, being sure
that I2S is enabled when it is expecting some data coming from the
I2S bus.

On some drivers, there are both I2S and A/D inputs at the
bridge chipset. On such drivers, enabling/disabling I2S is
done via VIDIOC_S_INPUT (and optionally via ALSA mixer), being
transparent to the user if the stream comes from a tuner via I2S
or from a directly connected A/D input.

I don't think it is a good idea to enable it via a control, as,
if the bridge driver is expecting data via I2S, disabling it will
cause timeouts at the videobuf handling.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v8 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS
 sensor
Date: Thu, 5 Oct 2017 09:29:02 +0300
Message-ID: <20171005062901.ofexwxfnun45linq@valkosipuli.retiisi.org.uk>
References: <20171005000621.27841-1-leonl@leopardimaging.com>
 <20171005000621.27841-2-leonl@leopardimaging.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171005000621.27841-2-leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 04, 2017 at 05:06:21PM -0700, Leon Luo wrote:
> The imx274 is a Sony CMOS image sensor that has 1/2.5 image size.
> It supports up to 3840x2160 (4K) 60fps, 1080p 120fps. The interface
> is 4-lane MIPI CSI-2 running at 1.44Gbps each.
> 
> This driver has been tested on Xilinx ZCU102 platform with a Leopard
> LI-IMX274MIPI-FMC camera board.
> 
> Support for the following features:
> -Resolutions: 3840x2160, 1920x1080, 1280x720
> -Frame rate: 3840x2160 : 5 – 60fps
>             1920x1080 : 5 – 120fps
>             1280x720 : 5 – 120fps
> -Exposure time: 16 – (frame interval) micro-seconds
> -Gain: 1x - 180x
> -VFLIP: enable/disabledrivers/media/i2c/imx274.c
> -Test pattern: 12 test patterns
> 
> Signed-off-by: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
> Tested-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Acked-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>

Thanks!

Applied with MEDIA_CAMERA_SUPPORT dependency to Kconfig.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

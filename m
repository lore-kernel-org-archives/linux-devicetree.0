From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add OV5640 parallel interface and RGB565/YUYV
 support
Date: Thu, 11 Jan 2018 00:25:08 +0200
Message-ID: <20180110222508.4x5kimanevttmqis@valkosipuli.retiisi.org.uk>
References: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
 <20180108153811.5xrvbaekm6nxtoa6@flea>
 <3010811e-ed37-4489-6a9f-6cc835f41575@st.com>
 <20180110153724.l77zpdgxfbzkznuf@flea>
 <2089de18-1f7f-6d6e-7aee-9dc424bca335@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2089de18-1f7f-6d6e-7aee-9dc424bca335-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues FRUCHET <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hugues,

On Wed, Jan 10, 2018 at 03:51:07PM +0000, Hugues FRUCHET wrote:
> Good news Maxime !
> 
> Have you seen that you can adapt the polarities through devicetree ?
> 
> +                       /* Parallel bus endpoint */
> +                       ov5640_to_parallel: endpoint {
> [...]
> +                               hsync-active = <0>;
> +                               vsync-active = <0>;
> +                               pclk-sample = <1>;
> +                       };
> 
> Doing so you can adapt to your SoC/board setup easily.
> 
> If you don't put those lines in devicetree, the ov5640 default init 
> sequence is used which set the polarity as defined in below comment:
> ov5640_set_stream_dvp()
> [...]
> +        * Control lines polarity can be configured through
> +        * devicetree endpoint control lines properties.
> +        * If no endpoint control lines properties are set,
> +        * polarity will be as below:
> +        * - VSYNC:     active high
> +        * - HREF:      active low
> +        * - PCLK:      active low
> +        */
> [...]

The properties are at the moment documented as mandatory in DT binding
documentation.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

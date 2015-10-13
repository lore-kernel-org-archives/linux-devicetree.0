From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/9] dmaengine: st_fdma:  Add STMicroelectronics FDMA
 driver header file
Date: Tue, 13 Oct 2015 11:43:01 +0100
Message-ID: <20151013104301.GA30342@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-4-git-send-email-peter.griffin@linaro.org>
 <1444118413.3579.46.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444118413.3579.46.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "patrice.chotard-qxv4g6HH51o@public.gmane.org" <patrice.chotard-qxv4g6HH51o@public.gmane.org>, "maxime.coquelin-qxv4g6HH51o@public.gmane.org" <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, "srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ludovic.barre-qxv4g6HH51o@public.gmane.org" <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 08 Oct 2015, Koul, Vinod wrote:

> On Fri, 2015-09-11 at 15:14 +0100, Peter Griffin wrote:
> 
> > +#define FDMA_ID_OFST		0x00000
> > +#define FDMA_VER_OFST		0x00004
> > > +
> > +#define FDMA_EN_OFST		0x00008
> 
> Why cant these be BIT() to maintain consistency?
> 

These are actually register offsets. I'm only using the BIT
macro for bitfields within the registers e.g. FDMA_EN_RUN

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

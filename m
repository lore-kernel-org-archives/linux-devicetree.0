From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] powerpc/5200: dts: digsy_mtc.dts: fix rv3029
 compatible
Date: Tue, 26 Sep 2017 15:40:52 +0200
Message-ID: <20170926134052.pjntycy5tbxggmvl@piout.net>
References: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
 <20170915020004.24272-3-alexandre.belloni@free-electrons.com>
 <20170915091326.4b93bde1@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170915091326.4b93bde1@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 15/09/2017 at 09:13:26 +0200, Anatolij Gustschin wrote:
> On Fri, 15 Sep 2017 04:00:04 +0200
> Alexandre Belloni alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org wrote:
> 
> >The proper compatible for rv3029 is microcrystal,rv3029.
> >
> >Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Acked-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>

If that is fine for you, I would prefer that goes through your tree as
I'm not usually taking DT patches through the RTC tree. there is no
dependency as the i2c subsystem will already match the new compatible
with the i2c device_id.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

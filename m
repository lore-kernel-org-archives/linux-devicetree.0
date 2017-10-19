From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] rtc: mediatek: add driver for RTC on MT7622 SoC
Date: Thu, 19 Oct 2017 12:13:49 +0200
Message-ID: <20171019101349.bo3wwj7mdfdmkdxs@piout.net>
References: <cover.1508231935.git.sean.wang@mediatek.com>
 <2f86eebfd380cf932808df3404e2f4a6f2f0f874.1508231935.git.sean.wang@mediatek.com>
 <1508325126.13340.25.camel@mtksdaap41>
 <20171018125743.kqna6b4lgng674om@piout.net>
 <1508381749.21840.123.camel@mtkswgap22>
 <20171019090219.2odtq3xosqk5ytsb@piout.net>
 <1508407479.29850.5.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508407479.29850.5.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/10/2017 at 18:04:39 +0800, Sean Wang wrote:
> I prefer to 2001 to 2099 only which can be completely handled in the
> common logic. Extra specific logic simply for 2100 seems not be
> worthwhile. 
> 

Agreed.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

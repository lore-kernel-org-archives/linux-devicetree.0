From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Date: Fri, 17 Mar 2017 23:02:15 +0100
Message-ID: <1489788135.8957.2.camel@collabora.co.uk>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485442422-18259-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - R8A7796 SoC based M3ULCB board peripherals
> 
> Vladimir Barinov (4):
> [1/4] arm64: dts: m3ulcb: enable I2C
> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC

Seems these didn't hit -next just yet, for this series (tested on a
M3ULCB)

Tested-By: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

-- 
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

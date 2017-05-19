From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/18] dt-bindings: arm: amlogic: Reorder boards
Date: Thu, 18 May 2017 20:27:13 -0500
Message-ID: <20170519012713.ntuwon6wmkro6rho@rob-hp-laptop>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170513143337.14278-2-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 13, 2017 at 04:33:20PM +0200, Andreas Färber wrote:
> Enforce groupment by SoCs, and order alphabetically within the group
> (with some exceptions). This should facilitate adding new boards.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v1 -> v2:
>  * Rebased (new boards added)
>  * Pointed out alphabetical order in the binding, too (Rob)
>  
>  Documentation/devicetree/bindings/arm/amlogic.txt | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

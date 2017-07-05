From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: amlogic: add unstable statement
Date: Wed, 5 Jul 2017 09:20:15 -0500
Message-ID: <20170705142015.tmlmes5lobadndsy@rob-hp-laptop>
References: <20170628145343.25443-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170628145343.25443-1-khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 07:53:43AM -0700, Kevin Hilman wrote:
> Due to the lack of documentation on this SoC family, discovery of new
> features, and correcting of previous misunderstandings is expected, so
> it's unrealistic to expect any form of stable bindings for this SoC
> family.  Make that clear inthe binding documentation.

s/inthe/in the/

> 
> Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I've yet to see anyone remove an unstable tag and I'd rather see these 
for individual bindings than for the platform as a whole. In the end, 
it's a platform maintainers decision whether to accept compatibility 
breakage regardless of some text that probably no one reads.

In any case,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

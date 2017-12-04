From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Add the unit address to sysled
Date: Mon, 4 Dec 2017 15:53:02 -0600
Message-ID: <20171204215302.3zhepg2sz6ycmmt6@rob-hp-laptop>
References: <1512165086-25512-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512165086-25512-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 01, 2017 at 07:51:26PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> As the 'reg' property is mandatory in the subnodes, improve the
> example by adding the unit address to the sysled node.
> 
> This prevents the following build warning with W=1:
> 
> Node /soc/aips@70000000/spba@70000000/ecspi@70010000/pmic@0/leds/sysled0 has a reg or ranges property, but no unit name

Even if the doc file could compile, looks like the name was sysled not 
sysled0.

> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

In any case,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

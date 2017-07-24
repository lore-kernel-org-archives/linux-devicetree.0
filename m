From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Add entry for Beckhoff CX9020
Date: Mon, 24 Jul 2017 15:28:54 -0500
Message-ID: <20170724202854.kqf4rylel6oyzg2i@rob-hp-laptop>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
 <20170721040640.31424-1-linux-kernel-dev@beckhoff.com>
 <20170721040640.31424-2-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170721040640.31424-2-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 21, 2017 at 06:06:39AM +0200, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> 
> - add vendor prefix bhf for Beckhoff
> - add new board binding bhf,cx9020
> 
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/bhf.txt         | 6 ++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  MAINTAINERS                                           | 5 +++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bhf.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

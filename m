From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Wed, 10 Aug 2016 17:28:25 -0500
Message-ID: <20160810222825.GA2650@rob-hp-laptop>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470785767-4426-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 04:36:07PM -0700, Tim Harvey wrote:
> This patch adds support for the Linear Technology LTC3676
> 8-output I2C voltage regulator IC.
> 
> Cc: Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---
>  .../devicetree/bindings/regulator/ltc3676.txt      |  94 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/regulator/Kconfig                          |   8 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/ltc3676.c                        | 495 +++++++++++++++++++++
>  4 files changed, 598 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/ltc3676.txt
>  create mode 100644 drivers/regulator/ltc3676.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

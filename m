From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support for the DWC2 controller on Meson8
 SoCs
Date: Fri, 12 May 2017 14:15:21 -0500
Message-ID: <20170512191521.q5fodp2fs6r4fgvv@rob-hp-laptop>
References: <20170506173745.19593-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170506173745.19593-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 06, 2017 at 07:37:45PM +0200, Martin Blumenstingl wrote:
> USB support in the Meson8 SoCs is provided by a DWC2 controller which
> works with the same settings as Meson8b and GXBB. Using the generic
> "snps,dwc2" binding results in an endless stream of "Overcurrent change
> detected" messages.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>  drivers/usb/dwc2/params.c                      | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

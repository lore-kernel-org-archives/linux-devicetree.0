From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of: Add vendor prefix for OmniVision Technologies
Date: Mon, 1 Dec 2014 20:54:50 -0600
Message-ID: <CAL_JsqK5yEvWxVAdQ8qQ1Rak98so78oYkpYyL__-A4nUAEYGXg@mail.gmail.com>
References: <1417477425-29780-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417477425-29780-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 1, 2014 at 5:43 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> OmniVision Technologies is a manufacturer of CMOS Image Sensors.

omnivision is already in use:

Documentation/devicetree/bindings/media/atmel-isi.txt:
 compatible = "omnivision,ov2640";
Documentation/devicetree/bindings/media/video-interfaces.txt:
         compatible = "omnivision,ov772x";

But these are only examples, so I'd call the undocumented. Fix them up please.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

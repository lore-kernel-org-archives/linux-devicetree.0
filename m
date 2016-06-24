From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/irq: Mark initialised interrupt controllers as populated
Date: Fri, 24 Jun 2016 15:37:40 -0500
Message-ID: <CAL_JsqKG7cygJxDg=siPXfvZwdF41dKrHkwiqZD7Z41ahhtWsw@mail.gmail.com>
References: <1466430558-24143-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466430558-24143-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2016 at 8:49 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> For interrupt controllers successfully initialised early via device-tree,
> mark these interrupt controllers as populated so we don't unnecessarily
> create a device and populate any platform data later on in the boot
> sequence when we populate all the various platform devices.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] drivers/of/base.c: Add of_property_read_u64_index
Date: Wed, 22 Mar 2017 09:49:40 -0500
Message-ID: <CAL_JsqK1N98e0=ECs7+xY=16niPtp86BkNC09EMsXFkm90dafw@mail.gmail.com>
References: <1490154573-22475-1-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490154573-22475-1-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, mhairgrove-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, shailendras-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 10:49 PM, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org> wrote:
> There is of_property_read_u32_index but no u64 variant. This patch
> adds one similar to the u32 version for u64.
>
> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
> ---
>  drivers/of/base.c  | 31 +++++++++++++++++++++++++++++++
>  include/linux/of.h |  3 +++
>  2 files changed, 34 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

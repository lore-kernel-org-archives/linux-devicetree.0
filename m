From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] fbdev: simplefb: add support for 'memory-region' property on DT node
Date: Fri, 02 Feb 2018 14:20:35 +0900
Message-ID: <20180202142035.CEB7.4A936039@socionext.com>
References: <1516707296-23667-1-git-send-email-hayashi.kunihiko@socionext.com> <2359956.Z9lQWSAgHb@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2359956.Z9lQWSAgHb@amdc3058>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bartlomiej, Rob, Mark,

On Thu, 1 Feb 2018 16:56:08 +0100 <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> 
> Hi,
> 
> On Tuesday, January 23, 2018 08:34:56 PM Kunihiko Hayashi wrote:
> > Enables 'memory-region' property referring to the memory description on
> > the reserved-memory node in case of devicetree use.
> > If there is no 'reg' property that specifies the address and size of
> > the framebuffer, the address and size written in the memory description
> > on the reserved-memory node can be used for the framebuffer.
> > 
> > Furthermore, the reserved-memory node needs to have "no-map" attributes
> > because simplefb driver maps the region by ioremap_wc().
> > 
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> 
> This needs an ACK from Rob or Mark (DT bindings Maintainers).

Thanks for pointing out.

Rob, Mark, would you please confirm the patch?
This patch contains the addition to dt-bindings.

---
Best Regards,
Kunihiko Hayashi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

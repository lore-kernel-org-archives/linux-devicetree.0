From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/4] RCar r8a7795 FCPF support
Date: Tue, 31 May 2016 11:10:45 +0200
Message-ID: <CAMuHMdVW56-g8F9SqO8UP62Q9nvFawwL+GgHP2Wni-a8q5YMRw@mail.gmail.com>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464369565-12259-1-git-send-email-kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

On Fri, May 27, 2016 at 7:19 PM, Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org> wrote:
> An RCar FCP driver is available with support for the FCPV module for VSP.
> This series updates that driver to support the FCPF and then provide the
> relevant nodes in the r8a7795 device tree.
>
> Checkpatch generates a warning on these DT references but they are
> documented under Documentation/devicetree/bindings/media/renesas,fcp.txt
>
> These patches are based on Geert's renesas-drivers tree, and are pushed
> to a branch at git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:kbingham/linux.git renesas/fcpf for
> convenience.

As this is based on previous renesas-drivers release, which included the
Salvator-X HDMI prototype, I created a topic branch topic/fcpf-v1 just
containing your changes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 2/2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Fri, 20 Oct 2017 21:08:18 +0200
Message-ID: <4519589.dXStasooJK@debian64>
References: <AM5PR0701MB26576FCB30CDCA6F989C9B80E4420@AM5PR0701MB2657.eurprd07.prod.outlook.com> <CACRpkdZXaTk-+LMcV8bZTg0bZ9cPxORHpXNL7m+bwnvr57yJ9A@mail.gmail.com> <AM5PR0701MB26576FBB8EDEF83F3AA82B89E4430@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM5PR0701MB26576FBB8EDEF83F3AA82B89E4430-drxRBzqxKr3KnPtvPVqCtTMcllmSiLMWnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, October 20, 2017 5:48:11 PM CEST Bernd Edlinger wrote:
> On 10/20/17 18:45, Linus Walleij wrote:
> > On Fri, Oct 20, 2017 at 4:40 PM, Bernd Edlinger
> > <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org> wrote:
> >> On 10/20/17 10:10, Linus Walleij wrote:
> > 
> >>>> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
> >>>> +                        NULL, NULL, 0);
> >>>
> >>> But all you add is input-only GPIO chips. Also for the output ports.
> >>>
> >>
> >> Well actually this allows both input and output,
> >> but while the input port could be written by accident,
> >> the hardware does the right thing and ignores the write cycle.
> >>
> >> The other parameters of bgpio_input are for devices with
> >> explicit set- and reset-signals, and configurable
> >> output-direction etc, which I don't have.
> > 
> > Ah! You're right. With just one register it becomes one of these that
> > read and write into that register, simply. Sorry for my ignorance.
> > 
> > I would prefer if you set the flag BGPIOF_NO_OUTPUT on the input
> > only version though. Semantics may matter to the mmio gpio core.
> > 
> 
> Ah, thanks, that's a good suggestion.
> 
> I will do that and send an updated patch.
Wait.

I had the same comment about this earlier and a few more suggestions
to move the driver to gpio-mmio's dt. Didn't you read the mail?

<https://marc.info/?l=linux-gpio&m=150678737724132&w=2>

It made it to the list archive, so I'm pretty sure this got delivered
to you as well.

Regards,
Christian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

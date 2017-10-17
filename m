From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 4/9] drm/panel: simple: add support for overriding the
 pixel clock polarity
Date: Tue, 17 Oct 2017 08:51:12 +0200
Message-ID: <20171017085112.7bfb0b01@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
        <CAL_Jsq+EcROz1OYK28y814+Q__F=1obXe7EuXRBta+BRFjBJFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+EcROz1OYK28y814+Q__F=1obXe7EuXRBta+BRFjBJFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 16 Oct 2017 17:13:29 -0500 Rob Herring wrote:
> On Wed, Oct 11, 2017 at 6:23 AM, Lothar Waßmann <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org> wrote:
> > The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
> > converter that requires a fixed pixelclk polarity, no matter what the
> > panel's display_mode specifies. Add an option to override the pixelclk
> > polarity defined in the panel's display_mode via DTB.
> 
> Wouldn't you know the polarity required based on the type of LVDS
> converter chip in front of the panel? Or is that not being described
> because it is "transparent".
> 
Exactly the latter.


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

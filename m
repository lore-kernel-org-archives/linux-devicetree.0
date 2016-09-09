From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from
 the downstream tree.
Date: Fri, 09 Sep 2016 10:47:19 +0200
Message-ID: <1473410839.6698.83.camel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
         <1473244289-20728-5-git-send-email-kraxel@redhat.com>
         <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
         <1473320687.6698.25.camel@redhat.com>
         <429647ef-ff1e-4999-5b19-3b4529ad3872@i2se.com>
         <1473409591.6698.81.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473409591.6698.81.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fr, 2016-09-09 at 10:26 +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > No, i thought of the GPIO pull up/down register values:
> > 
> > BCM2835_PUD_OFF 0
> > BCM2835_PUD_DOWN 1
> > BCM2835_PUD_UP 2
> 
> We can do that, sure (and probably drop the unused "enum
> bcm2835_pinconf_pull" from drivers/pinctrl/bcm/pinctrl-bcm2835.c at the
> same time).
> 
> But I fail to see how this is related to the patch discussed, looks like
> a independent issue to me ...

Oops, noticed that emmc_gpio34 uses them while ordering all the entries.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

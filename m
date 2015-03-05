From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v5 6/8] pinctrl: cygnus: add gpio/pinconf driver
Date: Thu, 05 Mar 2015 09:36:21 +0100
Message-ID: <1425544581.24292.194.camel@x220>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	 <1425515756-321-7-git-send-email-rjui@broadcom.com>
	 <1425543104.24292.185.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425543104.24292.185.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-03-05 at 09:11 +0100, Paul Bolle wrote:
> On Wed, 2015-03-04 at 16:35 -0800, Ray Jui wrote:
> > +MODULE_AUTHOR("Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>");
> > +MODULE_DESCRIPTION("Broadcom Cygnus GPIO Driver");
> > +MODULE_LICENSE("GPL v2");
> 
> These three macros will be preprocessed away. (There's also
> MODULE_DEVICE_TABLE. I don't yet know how that is handled in a
> non-modular build, sorry.)

It turns out MODULE_DEVICE_TABLE is _really_ preprocessed away. See
include/linux/module.h:
    #ifdef MODULE
    /* Creates an alias so file2alias.c can find device table. */
    #define MODULE_DEVICE_TABLE(type, name)                                 \
    extern const typeof(name) __mod_##type##__##name##_device_table         \
      __attribute__ ((unused, alias(__stringify(name))))
    #else  /* !MODULE */
    #define MODULE_DEVICE_TABLE(type, name)
    #endif


Did I get that right?

(I knew the other three MODULE_* macros are handled in slightly more
complicated way, but the effect is basically that they are preprocessed
away.)


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

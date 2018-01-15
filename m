From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rename oxnas dts files
Date: Mon, 15 Jan 2018 15:45:24 +0100
Message-ID: <CAK8P3a1NUww8pGWr=gvxSDk4p7Emoq9NJyGfs8N86bU_sqgnpQ@mail.gmail.com>
References: <20180113173553.GA30727@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180113173553.GA30727-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 13, 2018 at 6:35 PM, Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org> wrote:
> Other platforms' device-tree files start with a platform prefix, such as
> sun7i-a20-*.dts or at91-*.dts.
> This naming scheme turns out to be handy when using multi-platform build
> systems such as OpenWrt.
> Prepend oxnas files with their platform prefix to comply with the naming
> scheme already used for most other platforms.
>
> Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>

There are few changes to oxnas in general, and Neil doesn't appear to be around
to ask at the moment.
I assume he doesn't mind me picking it up into next/dt directly.

Merged now, thanks,

        Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

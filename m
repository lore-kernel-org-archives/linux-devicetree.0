From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: amlogic: Make driver independent from
 two-domain configuration
Date: Wed, 9 Mar 2016 13:01:21 +0700
Message-ID: <CACRpkdZQzxcyrweTeDdY15vxP18pSNhK5cB853hdPT8fctuFnQ@mail.gmail.com>
References: <1456869876-19320-1-git-send-email-carlo@caione.org>
	<1456869876-19320-3-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456869876-19320-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 2, 2016 at 5:04 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> In the Amlogic Meson8 / Meson8b platforms we have two different buses:
> cbus and aobus, corresponding to 2 different power domains (regular and
> always-on). On each bus a different set of registers is mapped to manage
> muxes, GPIOs and in general to control a clear subset of the pins.
>
> Considering this architecture, having two different pinctrl devices, one
> for each bus / power domain, makes much more sense than just having one
> single device.
>
> Right now we have one single pin controller driver that uses two
> different domains (represented by 'gpio' and 'gpio-ao' sub-nodes in the
> DTS) to manage the set of registers on the two buses. This dual-domain
> configuration is hardcoded into the driver that strictly requires one
> domain for each bus in the same pin controller device.
>
> With this patch we refactor the driver to allow splitting the driver in
> two parts. This change is needed to have a proper description of the HW
> in the device-tree where we want to introduce aobus and cbus.
>
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

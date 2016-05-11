From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 3/4] ARM64: Kconfig: Select the Amlogic Meson pin controller driver
Date: Wed, 11 May 2016 12:56:03 +0200
Message-ID: <3200982.vJgYKNLqaA@wuerfel>
References: <1462176138-29433-1-git-send-email-carlo@caione.org> <1462176138-29433-4-git-send-email-carlo@caione.org> <CACRpkdbTr7YUrzSQQci929ugBhTkJKWvpjdf5Wo3HkfVKFhGLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbTr7YUrzSQQci929ugBhTkJKWvpjdf5Wo3HkfVKFhGLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 11 May 2016 10:53:35 Linus Walleij wrote:
> On Mon, May 2, 2016 at 10:02 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> 
> > From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> >
> > Select the Meson pin controller driver also for the AArch64 Meson
> > platform.
> >
> > Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I guess this should get merged through the ARM SoC tree.
> 

I'd keep it together with the other changes for clarity and
merge it through your tree.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

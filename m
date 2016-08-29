From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter support
Date: Mon, 29 Aug 2016 17:41:10 +0100
Message-ID: <CACvgo50WjosoeV81eBESyVpjyJqPGt-R5yWR6sFr0ZbPe2LJHw@mail.gmail.com>
References: <1472017597-11221-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472017597-11221-1-git-send-email-vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

On 24 August 2016 at 06:46, Vladimir Zapolskiy
<vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

>  MODULE_AUTHOR("Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>");
>  MODULE_AUTHOR("Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
>  MODULE_AUTHOR("Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>");
Don't meant to start a flame-war or alike but to educate myself:
Where does one draw the line about adding new author(s) of said
module/subsystem ?

Afaict this is the most common (?) driver in DRM where the list has
grown over time. Should we do the same with others ?

Thanks
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

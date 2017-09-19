From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: imx6dl-icore: Add LVDS support
Date: Tue, 19 Sep 2017 17:11:17 -0300
Message-ID: <CAOMZO5CwFV454Vt-LMMmjaJPatHXuONKshOPmJQVzR_mKuw1Aw@mail.gmail.com>
References: <1505121145-9507-1-git-send-email-jteki@openedev.com>
 <1505121145-9507-4-git-send-email-jteki@openedev.com> <CAOMZO5B0RAjdupLSe=S+tDEA-hpf-Si_4qjkcKC_ECX86PLScQ@mail.gmail.com>
 <CAMty3ZD3od1LXKai=kwq8hxGsa3EWcjQx5gyBtZvCM5ccC34ZQ@mail.gmail.com>
 <CAOMZO5C+DXAQu=2OUAquB2AKn8dOzadoPsdGD05hXAUBdTnYjQ@mail.gmail.com> <CAMty3ZCQP5vnrU5MSzRFwRS+vS9a_ULt3sNB07BOHv0dCton0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMty3ZCQP5vnrU5MSzRFwRS+vS9a_ULt3sNB07BOHv0dCton0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 4:21 PM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:

> Yes, it is working..but need to understand how these respective
> timings were calculated(because I need to add few more) . I tried this
> supported ampire but couldn't get the data-sheet. Please point me if
> you find any details.

I don't have information about this panel.

Maybe you could check with the author from commit:

commit 1c550fa193d08920255240743f57731d4d57cd4d
Author: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Date:   Wed Feb 11 18:50:09 2015 +0100

    drm/panel: Add support for Ampire AM-800480R3TMQW-A1H 800x480 7" panel

    This adds support for the AM-800480R3TMQW-A1H 7" 800x480 panel to the
    DRM simple panel driver.

    Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
    Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

via dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org list.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

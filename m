From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: imx6dl-icore: Add LVDS support
Date: Tue, 19 Sep 2017 12:52:20 -0300
Message-ID: <CAOMZO5C+DXAQu=2OUAquB2AKn8dOzadoPsdGD05hXAUBdTnYjQ@mail.gmail.com>
References: <1505121145-9507-1-git-send-email-jteki@openedev.com>
 <1505121145-9507-4-git-send-email-jteki@openedev.com> <CAOMZO5B0RAjdupLSe=S+tDEA-hpf-Si_4qjkcKC_ECX86PLScQ@mail.gmail.com>
 <CAMty3ZD3od1LXKai=kwq8hxGsa3EWcjQx5gyBtZvCM5ccC34ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMty3ZD3od1LXKai=kwq8hxGsa3EWcjQx5gyBtZvCM5ccC34ZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

On Tue, Sep 19, 2017 at 2:06 AM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wr=
ote:
> Hi Fabio,
>
>> Please add the support of this panel to drivers/gpu/drm/panel/panel-simp=
le.c.
>>
>> Then you can refer its compatible in your board dts.
>
> Yes, I'm trying to add the display timings but I couldn't find any
> info how to find front_portch, back_porch and sync. I remember
> blanking time =3D Sync Width + BP + FP so out of which how can we
> determine each one respectively. Please let me know if you have any
> idea, I=E2=80=99ve attached the data-sheet.

Does the existing ampire,am800480r3tmqwa1h binding work for your display?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

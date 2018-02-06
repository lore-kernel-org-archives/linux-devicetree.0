From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/7] ARM: dts: imx6q: engicam LVDS panel changes
Date: Tue, 6 Feb 2018 10:55:20 +0530
Message-ID: <CAD6G_RSp_8xWWRfvu_58rdvkE-V16otnE9ifxQkiNry76-TMXQ@mail.gmail.com>
References: <1517766571-409-1-git-send-email-jagan@amarulasolutions.com> <20180205105838.GZ31354@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205105838.GZ31354@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 5, 2018 at 4:28 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Feb 04, 2018 at 11:19:24PM +0530, Jagan Teki wrote:
>> Series adda LVDS panel attributes on panel drivers instead of defining
>> them in dts nodes, and also added new icorem6 engicam boards.
>>
>> Jagan Teki (7):
>>   drm/panel: simple: add support for Ampire AM-800480AYTZQW-00H
>>   ARM: dts: imx6q-icore: Switch LVDS timings from panel-simple
>>   ARM: dts: imx6dl-icore: Add LVDS node
>>   drm/panel: simple: Add support for KEO TX31D200VM0BAA
>>   ARM: dts: imx6q-icore-ofcap12: Switch LVDS timings from panel-simple
>>   ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 7
>>     initial support
>>   ARM: dts: imx6q: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit
>>     support
>>
>>  .../display/panel/ampire,am-800480aytzqw-00h.txt   | 25 +++++++++
>>  .../bindings/display/panel/koe,tx31d200vm0baa.txt  | 25 +++++++++
> ...
>>  drivers/gpu/drm/panel/panel-simple.c               | 54 ++++++++++++++++++
>
> The dts files should really be sent only after above bindings doc and
> driver changes get merged first.

OK, I will send drm/panel changes first.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

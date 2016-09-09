From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Sat, 10 Sep 2016 03:51:42 +0530
Message-ID: <CAMty3ZAPbJM5EQD_OqN9nr---y1P0e+5Y5ujL4g7YoPEsuU+aw@mail.gmail.com>
References: <1473457525-27768-1-git-send-email-jagan@amarulasolutions.com>
 <1473457525-27768-2-git-send-email-jagan@amarulasolutions.com>
 <CAOMZO5BPhY14S4G541MTpsCW64SsCiNcsksJarBCWqGOnaPf3A@mail.gmail.com>
 <CAMty3ZC+49D7aALOKcsjoiqptQwrrtHGMAGCtcPn51QDsksSSQ@mail.gmail.com>
 <CAMty3ZAM-sZ0aZU0Z+8WhDcepx8KM96xUbn+n3UcDSjFTafC-A@mail.gmail.com>
 <CAOMZO5AuZ5DqqKngLw67_-3PdoYx5pMNmm1ZHwRd79rYPJY-+Q@mail.gmail.com> <CAOMZO5D2WNBh6fy8iFYasSZnovfBJRxzBt55ceaPqwCn3zvepg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5D2WNBh6fy8iFYasSZnovfBJRxzBt55ceaPqwCn3zvepg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 10, 2016 at 3:49 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Sep 9, 2016 at 7:19 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Sep 9, 2016 at 7:14 PM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>>
>>>> Yeah, I got 1b0b0
>>>>
>>>> U-Boot > md.l 20E05DC 1
>>>> 020e05dc: 0001b0b0
>>>
>>> So I'm assigning change value to 1b020 Linux that's ok right?
>>
>> Then just use 0x1b020 for the flexcan pins.
>
> 1b0b0 I mean :-)

Why? can't we update iomux reg value any side effects or something.

thanks!
-- 
Jagan Teki
Free Software Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

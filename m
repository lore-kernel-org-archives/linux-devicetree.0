From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 2/5] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Mon, 26 Sep 2016 19:58:39 +0530
Message-ID: <CAMty3ZBtKk7gohpvkYSxUvL-xT_k5oqQXbFsbfEQ9uBaBryveA@mail.gmail.com>
References: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
 <1473618641-10159-3-git-send-email-jagan@amarulasolutions.com>
 <CAOMZO5CsrrqqUPaVbU-ya79VSXgxyspa_fbr8HY1voJgpy2LLg@mail.gmail.com>
 <CAMty3ZDKrXxmwDFxSBvL_anJQPdXEfnJ40uNv5B6KssQyJJKhA@mail.gmail.com>
 <CAOMZO5B_ahBJr_Tgz_HShmG9heUwCj4K0N3FHhxja1yg0gCUGA@mail.gmail.com>
 <CAOf5uw=bMMa98RP=kvA=NfS89TWOEqU3Q2HjpEmzUTVrdg2=sQ@mail.gmail.com>
 <CAOMZO5CnP3=CNnQcOzra7eQ-cAwProgH+Kws0FHVOw7Q6nCDow@mail.gmail.com>
 <119ad2fc-8e74-1193-8ee2-417cf1e6fd49@engicam.com> <CAOMZO5BWgqxfbOepJZwqdZceSWKBnSfd38Ab2TV-LN0oDttc-Q@mail.gmail.com>
 <CAOf5uw=HwErWWqvQ30ZJpb3CupqdvGZ9FnGAxh4+JVTrT6wTjw@mail.gmail.com>
 <CAOMZO5BHhA8rd0URLNGGLZKN00zFz9d5vsq4CuRWsKyT6yq-oA@mail.gmail.com> <CAOf5uwk3FJ4K4gL8xNNAp-z_AesjwTwSz986gfveVJsOU+N8Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOf5uwk3FJ4K4gL8xNNAp-z_AesjwTwSz986gfveVJsOU+N8Ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Mon, Sep 26, 2016 at 7:26 PM, Michael Trimarchi
<michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> Hi
>
> On Mon, Sep 26, 2016 at 3:55 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Sep 26, 2016 at 10:54 AM, Michael Trimarchi
>> <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>>
>>>> Why don't you simply do like this?
>>>>
>>>>        reg_3p3v: regulator-3p3v {
>>>>                compatible = "regulator-fixed";
>>>>                regulator-name = "3P3V";
>>>>                regulator-min-microvolt = <3300000>;
>>>>                regulator-max-microvolt = <3300000>;
>>>>        };
>>>
>>> Should dts rispect the schematic connection?
>>
>> Yes
>
> So boot on and always on are used to declare their status and their
> behavionr. I don't
> see the point to not specify them in this way

Please try to understand that due to the case where we used fixed
voltage regulators on SOM as mentioned By Metteo and Michael dt nodes
should have regulator-always-on and regulator-boot-on properties. And
even we added one of our module which is already in ML[1]

Hope this is helpful conclude this thread.

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=a58e4e608bc88735581fdd9861676e522fa3c20d

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

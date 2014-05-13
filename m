From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: i.MX1 clk: Add devicetree support
Date: Tue, 13 May 2014 13:28:28 -0300
Message-ID: <CAOMZO5CNk4uAu0OujRgiJpU2gHJpAnD4zpqxSHd4hXo3fnJ4_w@mail.gmail.com>
References: <1399997116-4313-1-git-send-email-shc_work@mail.ru>
	<CAOMZO5Br9wpZu06oP3-Ax5XG=u+A6Ydq9peKet64Kw_moGgRaw@mail.gmail.com>
	<1399998253.839894262@f391.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399998253.839894262-epzXK9EC9shsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 13, 2014 at 1:24 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wr=
ote:
> Tue, 13 May 2014 13:18:40 -0300 =D0=BE=D1=82 Fabio Estevam <festevam@=
gmail.com>:
>> On Tue, May 13, 2014 at 1:05 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>=
 wrote:
>>
>> > +       clk[IMX1_CLK_DUMMY] =3D
>> > +               imx_clk_fixed("dummy", 0);
>> > +       clk[IMX1_CLK_CLK32] =3D
>> > +               imx_obtain_fixed_clock("clk32", fref);
>> > +       clk[IMX1_CLK_CLK16M_EXT] =3D
>> > +               imx_clk_fixed("clk16m_ext", 16000000);
>> > +       clk[IMX1_CLK_CLK16M] =3D
>> > +               imx_clk_gate("clk16m", "clk16m_ext", CCM_CSCR, 17)=
;
>>
>> Why don't you put each entry into a single line instead?
>>
>> Even if it gets larger than 80 columns, it would be easier to read.
>
> I thought about it, but came to the conclusion that it is better to o=
bserve
> the kernel rules.

Do you mean checkpatch complaint?

Then try to make checkpatch happy with other clock file such as
arch/arm/mach-imx/clk-imx6q.

The result will be unreadable :-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

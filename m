From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH RESEND 4/5] Documentation: add the Marvell Berlin pinctrl
 documentation
Date: Fri, 11 Apr 2014 10:12:59 +0200
Message-ID: <20140411081259.GA20147@kwain>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397135274-10764-5-git-send-email-antoine.tenart@free-electrons.com>
 <20140411143318.67e55a17@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140411143318.67e55a17@xhacker>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

On Fri, Apr 11, 2014 at 02:33:18PM +0800, Jisheng Zhang wrote:
> On Thu, 10 Apr 2014 06:07:53 -0700
> Antoine T=E9nart <antoine.tenart@free-electrons.com> wrote:
> > +Required subnode-properties:
> > +- berlin,group: a string describing the group's name.
> > +- berlin,function: the function used to mux the group.
>=20
> Would it be better to s/function/mode? Because in mrvl internal techn=
ology
> discussion and docs, we usually say "set pinmux Gy as mode z".

The pinctrl framework uses 'function', so I guess it's better not to in=
troduce
an other keyword that may confuse people. But I agree this is not what'=
s used in
the Marvell's docs. What do you think about we mention it in this docum=
entation ?

Thanks for the feedback !

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

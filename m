From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: rtc: add bindings for i.MX53 SRTC
Date: Mon, 11 Dec 2017 21:08:00 -0200
Message-ID: <CAOMZO5DoiLW3DxLF=agHua9jO-+LgWA3xw6h7kyj_uot47pkjw@mail.gmail.com>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-2-linux-kernel-dev@beckhoff.com> <20171206215436.lwttn445wjilh3wo@rob-hp-laptop>
 <3BB206AB2B1BD448954845CE6FF69A8E01CB53233C@NT-Mail07.beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3BB206AB2B1BD448954845CE6FF69A8E01CB53233C-vUij6NSodOcSOXk/eDA+lhuDmiLEvxRJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Patrick_Br=C3=BCnn?= <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx34e+czBwuGJN7NAH6kLmebB@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
List-Id: devicetree@vger.kernel.org

Hi Patrick,

On Mon, Dec 11, 2017 at 5:08 AM, Patrick Br=C3=BCnn <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>=
 wrote:

>>rtc@...
>>
> The rtc for which this series adds support is embedded within a function =
block called
> "Secure Real Time Clock". This driver doesn't utilize all of the hardware=
 features by
> now. But maybe someone else wants to extend the functionalities, later.
> For that possibility I wanted to name the node "srtc". Should I still cha=
nge this?
>
> I believe you have a much better understanding of what should be done her=
e. I don't
> want to argue with you, just thought you might not had that information. =
So if I am
> wrong just tell me and I will change it without further "complaining".

>From the Devicetree Specification document:

"Generic Names Recommendation

The name of a node should be somewhat generic, reflecting the function
of the device and not its precise program-
ming model. If appropriate, the name should be one of the following choices=
:
...
rtc
"

So better use 'rtc' as suggested by Rob.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

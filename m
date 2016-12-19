From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] rtc: pcf8563: Do not disable clk out by default
Date: Mon, 19 Dec 2016 01:25:13 +0100
Message-ID: <20161219002513.gxoe5csrzzvr6t7u@piout.net>
References: <1481295829-21974-1-git-send-email-volodymyr.bendiuga@westermo.se>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBCKYNX7Y3IMBB2WR3TBAKGQES6I7TXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1481295829-21974-1-git-send-email-volodymyr.bendiuga-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Volodymyr Bendiuga <volodymyr.bendiuga-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, volodymyr.bendiuga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mattias =?iso-8859-1?Q?Walstr=F6m?= <mattias.walstrom-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2016 at 16:03:49 +0100, Volodymyr Bendiuga wrote :
> From: Mattias Walstr=C3=B6m <mattias.walstrom-qeDNsGSBLoYwFerOooGFRg@public.gmane.org>
>=20
> Commit a39a6405d5f949bc651694028a disables CLKOUT of
> the rtc after power-up to improve power consumption.
> This is very useful, but some designs do require to
> have the rtc on all the time, otherwise devices will
> be bricked. Therefore this patch is a compromise that
> works for both cases, where the default case is when
> CLKOUT is on. If one wants to disable the CLKOUT,
> clkout-allow-disable can be added to devicetree's rtc node.
>=20

Actually, the commit description is misleading. The CCF is the one
disabling the clock if it is not used. If any user of the clock is
declared, it will not be disabled so it already works in both cases
(provided you have a proper driver getting the clock).

--=20
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

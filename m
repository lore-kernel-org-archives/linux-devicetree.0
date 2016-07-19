From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] rtc: ds1302: add register access
 abstraction layer
Date: Tue, 19 Jul 2016 17:13:14 +0200
Message-ID: <20160719151314.GH7132@piout.net>
References: <1467026362-29446-1-git-send-email-akinobu.mita@gmail.com>
 <1467026362-29446-2-git-send-email-akinobu.mita@gmail.com>
 <1467028249.3182.11.camel@gmail.com>
 <20160627124432.GI29249@piout.net>
 <1467040517.3182.34.camel@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBC4HXG6AKGQE2T2WRYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467040517.3182.34.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/06/2016 at 18:15:17 +0300, Sergei Ianovich wrote :
> > How do yo currently select microwire mode for PX270?
>=20
> I didn't say I use PXA270 to drive this RTC. I just say it is possible.
> The driver needs to set bits 5:4 of SSCR0_1/2/3 register to 0b10.
> Microwire mode will be selected for a built-in SPI port. All bitbanging
> will be done by the chip, the driver will just need to set up DMA
> transfer. This is an example of a pretty sophisticated hardware
> controller.
>=20
> I actually use a simple software controller in LP8841. The driver is
> in=C2=A0drivers/spi/spi-lp8841-rtc.c.

Ok, seeing that, now I'm thinking that switching the ds1302 driver to
spi was a mistake and bitbanging in the driver was the right thing to
do.
What you introduced are two drivers instead of one and the abstraction
is actually getting worse.

So I'm thinking the best solution is to write a proper driver bitbanging
microwire (maybe in the SPI subsystem) that everybody could use,
including old architectures.

Else, I may as well revert to the previous driver.

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

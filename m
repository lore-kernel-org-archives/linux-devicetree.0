From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v5 1/5] mfd: RK808: Add RK818 support
Date: Thu, 9 Jun 2016 16:28:52 +0100
Message-ID: <20160609152852.GA5438@dell>
References: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
 <20160608141735.GE14888@dell>
 <5759277D.7090101@phytec.de>
 <20160609111201.GA1388@dell>
 <57596B1C.2010101@phytec.de>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBEMW425AKGQEHQPKYXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <57596B1C.2010101-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 09 Jun 2016, Wadim Egorov wrote:

>=20
>=20
> On 09.06.2016 13:12, Lee Jones wrote:
> > On Thu, 09 Jun 2016, Wadim Egorov wrote:
> >> On 08.06.2016 16:17, Lee Jones wrote:
> >>> On Thu, 02 Jun 2016, Wadim Egorov wrote:
> >>>
> >>>> The RK818 chip is a power management IC for multimedia and handheld
> >>> "Power Management IC (PMIC)"
> >>>
> >>>> devices. It contains the following components:
> >>>>
> >>>> - Regulators
> >>>> - RTC
> >>>> - Clkout
> >>> Clocking
> >>>
> >>>> - battery support
> >>> Battery support
> >>>
> >>>> Both chips RK808 and RK818 are using a similar register map.
> >>> "Both RK808 ad RK818 chips"
> >>>
> >>>> So we can reuse the RTC and Clkout functionality.
> >>> Swap '.' for ','.
> >>>
> >>>> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> >>>> ---
> >>>>  drivers/mfd/Kconfig       |   4 +-
> >>>>  drivers/mfd/rk808.c       | 231 +++++++++++++++++++++++++++++++++++=
+++--------
> >>>>  include/linux/mfd/rk808.h | 162 ++++++++++++++++++++++++++++++--
> >>>>  3 files changed, 350 insertions(+), 47 deletions(-)
> > [...]
> >
> >>>> -struct rk808_reg_data {
> >>>> -	int addr;
> >>>> -	int mask;
> >>>> -	int value;
> >>>> -};
> >>> Why are you moving this to the header?
> >> It is now part of the rk808 struct.
> > Why?
> >
> For me it seemed reasonable. My idea was to have only one chip variant
> check.
>=20
> I can move the rk808_reg_data struct back to the c file, check for the
> chip variant within the probe function and initialize the proper
> reg_data variable.
> This would also apply to the mfd_cell variables.

'struct rk808' should only contain information you wish to share with
your subordinate/child devices.  Any data only used in the parent/MFD
driver should be declared, initialised and used only the latter.  No
need to export.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

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

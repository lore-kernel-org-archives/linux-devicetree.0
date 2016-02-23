From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 13:03:56 -0600
Message-ID: <20160223190356.GA17346@hector.attlocal.net>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
 <56CC970B.4080602@linaro.org>
 <56CCA95C.9070207@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CCA95C.9070207-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 08:47:56PM +0200, Georgi Djakov wrote:
> On 23.02.16 =D0=B3. 19:29, Srinivas Kandagatla wrote:
> >=20
> >=20
> > On 23/02/16 17:21, Georgi Djakov wrote:
> >> When the SMEM is probed it defers as it depends on the hardware lo=
ck, which
> >> is not available yet. But the SMD bus and RPM regulators and clock=
s depend
> >> on SMEM and they defer too. The problem with this is that the orde=
r of
> >> registering the devices is not optimal and also we may end with me=
ssed
> >> up serial console as the RPM clocks are not registered yet..
> > I noticed the same issue but was wondering why would we end up with=
 messed up serial console?
> >=20
> > Could you add more details on why serial console is messed up?
> >=20
> > I thought, serial driver has nothing to do with the rpm clocks dire=
ctly!
> >=20
>=20
> If we don't have the rpm clocks registered, the uart clock is an orph=
an
> and when clk_get_rate() is called on orphan clocks it returns 0 as ra=
te.
> In our case the msm_serial driver calls clk_get_rate() and gets 0 rat=
e
> as the parent rpm clock has not registered yet. The result is that th=
e
> baudrate is set incorrectly.

This isn't a probe defer issue w/ the SMEM and hwspinlock.  That works =
properly.
This is an issue with the msm_serial either not probe deferring to wait=
 for the
rpm clocks or not handling the case of the clk framework giving us a 'b=
ogus'
clock.  Can we queue off the clk_get_rate being 0 to probe defer for th=
e rpm
clocks? (although that is hacky).

Regards,

Andy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 8/9] arm64: dts: rockchip: partially describe PWM regulators for Gru
Date: Thu, 22 Dec 2016 17:09:14 +0100
Message-ID: <8105123.LR1Hv7NatV@diego>
References: <1480645653-36943-1-git-send-email-briannorris@chromium.org> <20161207170916.GA84287@google.com> <13721273.q1HcHZAhdQ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13721273.q1HcHZAhdQ@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Dezember 2016, 18:48:50 schrieb Heiko Stuebner:
> Am Mittwoch, 7. Dezember 2016, 09:09:17 CET schrieb Brian Norris:
> > Hi Heiko,
> > 
> > On Wed, Dec 07, 2016 at 05:48:24PM +0100, Heiko Stuebner wrote:
> > > Am Donnerstag, 1. Dezember 2016, 18:27:32 CET schrieb Brian Norris:
> > > > We need to add regulators to the CPU nodes, so cpufreq doesn't think
> > > > it
> > > > can crank up the clock speed without changing the voltage. However, we
> > > > don't yet have the DT bindings to fully describe the Over Voltage
> > > > Protection (OVP) circuits on these boards. Without that description,
> > > > we
> > > > might end up changing the voltage too much, too fast.
> > > > 
> > > > Add the pwm-regulator descriptions and associate the CPU OPPs, but
> > > > leave
> > > > them disabled.
> > > > 
> > > > Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > 
> > > is there a specific reason for keeping this change separate?
> > 
> > Maybe not a great one. I figured they were somewhat controversial, so I
> > at least wanted to split the "cpufreq patches" (i.e., this and the
> > previous) from the main DTS(I) additions. I also figured we typically
> > like to keep the base SoC changes separate from the board DTS(I)
> > changes.
> 
> I was scratching my head for a bit where this was affecting the evb, until I
> found the include at the end of patch5 :-) .
> 
> > > While it is nice for documentation reasons, as it stands now the
> > > previous
> > > patch introduces a regression (cpufreq trying to scale without
> > > regulators)
> > > and immediately fixes it here.
> > 
> > Right. Additionally, as noted on the previous patch, we might do the
> > same with EVB. But I don't know what the regulators are like for EVB.
> > This is probably a bigger deal, since EVB has been working (allegedly)
> > upstream for a while now.
> 
> Yep, it was at least booting :-) . I guess I should wire it up again. My
> shiny new Gru somehow did take up its space recently.
> 
> > There's no way to split these up without either breaking compilation or
> > breaking bisectability. For Kevin/Gru, they don't function at all before
> > this series, so I figured some "settle" time wasn't a huge deal.
> > 
> > > So if you're ok with it, I'd like to merge this one back into the
> > > previous
> > > patch when applying.
> > 
> > That'd be OK with me, as long as we're also confident about EVB.
> 
> That somehow sounds unrelated, as this patch only touches gru stuff anyway.
> So if the evb breaks, it would do so after patch5 already.
> 
> > Maybe at a minimum, I should just patch in some empty regulator nodes,
> > so cpufreq doesn't think there's no need to handle voltage.
> 
> So I guess going forward we could do, describe the evb pwm regulators (in
> disabled state), add general OPPs, add gru with pwm regulators?
> 
> I'll try to hook up my evb and check on the pwm-regulators in the schematics
> this week.

Now I remember why I retired my evb ... ES1 silicon.

Anyway, I was able to describe the rk808 pmic that is used in some basic way 
and was able to see a bit of cpu-scaling on the little cluster, but the big 
cluster never was able to scale in a stable way and always hung the system.

I don't think that we should care about ES1 chips as they never reached any 
public but that leaves me without the ability to test.

In another issue I read that Caesar also is using a rk3399evb sometimes, so 
maybe he can give that a try on real ES2 silicon and I've thus Cc'ed him.

@Caesar I don't know how much the power rails differ between evb versions, so 
maybe you can also provide the necessary rk808 devicetree nodes please?


Thanks
Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

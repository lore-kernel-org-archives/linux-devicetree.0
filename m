From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 02/10] clk: sunxi-ng: Mark AR100 clocks
 as critical
Date: Tue, 20 Aug 2019 08:02:55 -0500
Message-ID: <3b67534a-eb1b-c1e8-b5e8-e0a74ae85792@sholland.org>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-3-samuel@sholland.org>
 <20190820071142.2bgfsnt75xfeyusp@flea>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBBW757VAKGQERY6GOSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190820071142.2bgfsnt75xfeyusp@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 8/20/19 2:11 AM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Aug 19, 2019 at 10:23:03PM -0500, Samuel Holland wrote:
>> On sun8i, sun9i, and sun50i SoCs, system suspend/resume support requires
>> firmware running on the AR100 coprocessor (the "SCP"). Such firmware can
>> provide additional features, such as thermal monitoring and poweron/off
>> support for boards without a PMIC.
>>
>> Since the AR100 may be running critical firmware, even if Linux does not
>> know about it or directly interact with it (all requests may go through
>> an intermediary interface such as PSCI), Linux must not turn off its
>> clock.

This paragraph here is the key. The firmware won't necessarily have a device
tree node, and in the current design it will not, since Linux never communicates
with it directly. All communication goes through ATF via PSCI.

>> At this time, such power management firmware only exists for the A64 and
>> H5 SoCs.  However, it makes sense to take care of all CCU drivers now
>> for consistency, and to ease the transition in the future once firmware
>> is ported to the other SoCs.
>>
>> Leaving the clock running is safe even if no firmware is present, since
>> the AR100 stays in reset by default. In most cases, the AR100 clock is
>> kept enabled by Linux anyway, since it is the parent of all APB0 bus
>> peripherals. This change only prevents Linux from turning off the AR100
>> clock in the rare case that no peripherals are in use.
>>
>> Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
> 
> So I'm not really sure where you want to go with this.
> 
> That clock is only useful where you're having a firmware running on
> the AR100, and that firmware would have a device tree node of its own,
> where we could list the clocks needed for the firmware to keep
> running, if it ever runs. If the driver has not been compiled in /
> loaded, then we don't care either.

See above. I don't expect that the firmware would have a device tree node,
because the firmware doesn't need any Linux drivers.

> But more fundamentally, if we're going to use SCPI, then those clocks
> will not be handled by that driver anyway, but by the firmware, right?

In the future, we might use SCPI clocks/sensors/regulators/etc. from Linux, but
that's not the plan at the moment. Given that it's already been two years since
I started this project, I'm trying to limit its scope so I can get at least some
part merged. The first step is to integrate a firmware that provides
suspend/resume functionality only. That firmware does implement SCPI, and if the
top-level Linux SCPI driver worked with multiple mailbox channels, it could
query the firmware's version and fetures. But all of the SCPI commands used for
suspend/resume must go through ATF via PSCI.

> So I'm not really sure that we should do it statically this way, and
> that we should do it at all.

Do you have a better way to model "firmware uses this clock behind the scenes,
so Linux please don't touch it"? It's unfortunate that we have Linux and
firmware fighting over the R_CCU, but since we didn't have firmware (e.g. SCPI
clocks) in the beginning, it's where we are today.

The AR100 clock doesn't actually have a gate, and it generally has dependencies
like R_INTC in use. So as I mentioned in the commit message, the clock will
normally be on anyway. The goal was to model the fact that there are users of
this clock that Linux doesn't/can't know about.

> Maxime

Thanks,
Samuel

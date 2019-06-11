From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 03/13] dt-bindings: Add doc for the Ingenic TCU drivers
Date: Tue, 11 Jun 2019 08:57:04 -0600
Message-ID: <CAL_Jsq+ZhoW9xM_7-7CcCm2RKRbMRzmXD-oEMfoVkvcaAFxGug@mail.gmail.com>
References: <20190521145141.9813-1-paul@crapouillou.net> <20190521145141.9813-4-paul@crapouillou.net>
 <20190524202103.GA15650@bogus> <1558811596.2016.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558811596.2016.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, od@zcrc.me
List-Id: devicetree@vger.kernel.org

On Sat, May 25, 2019 at 1:13 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
>
>
> Le ven. 24 mai 2019 =C3=A0 22:21, Rob Herring <robh@kernel.org> a =C3=A9c=
rit :
> > On Tue, May 21, 2019 at 04:51:31PM +0200, Paul Cercueil wrote:
> >>  Add documentation about how to properly use the Ingenic TCU
> >>  (Timer/Counter Unit) drivers from devicetree.
> >>
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>
> >>  Notes:
> >>      v4: New patch in this series. Corresponds to V2 patches 3-4-5
> >> with
> >>       added content.
> >>
> >>      v5: - Edited PWM/watchdog DT bindings documentation to point to
> >> the new
> >>         document.
> >>       - Moved main document to
> >>         Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> >>       - Updated documentation to reflect the new devicetree bindings.
> >>
> >>      v6: - Removed PWM/watchdog documentation files as asked by
> >> upstream
> >>       - Removed doc about properties that should be implicit
> >>       - Removed doc about ingenic,timer-channel /
> >>         ingenic,clocksource-channel as they are gone
> >>       - Fix WDT clock name in the binding doc
> >>       - Fix lengths of register areas in watchdog/pwm nodes
> >>
> >>      v7: No change
> >>
> >>      v8: - Fix address of the PWM node
> >>       - Added doc about system timer and clocksource children nodes
> >>
> >>      v9: - Remove doc about system timer and clocksource children
> >>         nodes...
> >>      - Add doc about ingenic,pwm-channels-mask property
> >>
> >>      v10: No change
> >>
> >>      v11: Fix info about default value of ingenic,pwm-channels-mask
> >>
> >>      v12: Drop sub-nodes for now; they will be introduced in a
> >> follow-up
> >>               patchset.
> >
> > Why? I believe I acked them.
>
> The patchset was too big, and I've already been trying to get it
> upstream for
> more than one year now. So I cut it in half in hope that it'll be
> easier to
> upstream it that way.

You can drop the driver part and keep the binding. Unlike drivers, we
don't want bindings to needlessly evolve, and you don't have to wait
til a driver implements some functionality to add that to the binding.

Rob

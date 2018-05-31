From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] regulator: bd71837: Devicetree bindings for
 BD71837 regulators
Date: Thu, 31 May 2018 09:00:00 -0500
Message-ID: <CAL_Jsq+thofEt0fXnbV=dsXggGHS=vdHwSLLKQCVvL5cMDO5wA@mail.gmail.com>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <318229ca7ffcceb090fc8d0c43f887decc3082f0.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <20180531030436.GB16122@rob-hp-laptop> <20180531072145.GH13528@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531072145.GH13528@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2018 at 2:21 AM, Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On Wed, May 30, 2018 at 10:04:36PM -0500, Rob Herring wrote:
>> On Wed, May 30, 2018 at 11:42:32AM +0300, Matti Vaittinen wrote:
>> > Document devicetree bindings for ROHM BD71837 PMIC regulators.
>> > +ROHM BD71837 Power Management Integrated Circuit (PMIC) regulator bin=
dings
>> > +
>> > +BD71837MWV is a programmable Power Management
>> > +IC (PMIC) for powering single-core, dual-core, and
>> > +quad-core SoC=E2=80=99s such as NXP-i.MX 8M. It is optimized
>> > +for low BOM cost and compact solution footprint. It
>> > +integrates 8 Buck regulators and 7 LDO=E2=80=99s to provide all
>> > +the power rails required by the SoC and the commonly
>> > +used peripherals.
>>
>> Why duplicate this from the core binding?
>
> I can remove this. I just thought it is nice to see what this chip is
> doing even without opening the MFD binding doc. Just same question as in
> the other patch - how should I deliver the change? This was already
> applied to Mark's tree - should I do new patch on top of the Mark's tree
> - or do patch against tree which does not yet contain this change? If I
>   do it on top of Mark's tree then Mark should apply it, right? If I do
>  it against some other three, thene there will be merge conflict with
>  Mark, right?

I thought he only applied the regulator driver part. If not, then
don't worry about it. (But the right answer would be to do an
incremental patch on top of his tree).

Rob

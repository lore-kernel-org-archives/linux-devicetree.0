From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Wed, 30 May 2018 09:41:55 -0700
Message-ID: <CAD=FV=V1gGccKr1mHM0zx_-FFdLU1vrzUChwx6KTUyTGzj39Tw@mail.gmail.com>
References: <20180530093701.GD6920@sirena.org.uk>
 <CAD=FV=W-MLU9c-SvfLgKAKGP1eHN5xO-013f2M09XUa+QeHzrA@mail.gmail.com>
 <20180530150241.GO6920@sirena.org.uk>
 <CAD=FV=XJd-udEE6az0xP7i6x0oGsnd=BSCyZ0Og_+RjNCMXnCQ@mail.gmail.com>
 <20180530154849.GQ6920@sirena.org.uk>
 <CAD=FV=X2u=hMyWinSDtim-PmFwAy5mXcwg3HeYojAHcsUFhV3g@mail.gmail.com>
 <20180530160744.GS6920@sirena.org.uk>
 <CAD=FV=WVGu0f+=q-C9kiEmaLEUJqGY+Jbns83h72uF-9iasrUw@mail.gmail.com>
 <20180530161311.GT6920@sirena.org.uk>
 <CAD=FV=UpWEMSPUYOHmLQ0g_mF990kwn4_zm=ZCNttLKZiz7i=Q@mail.gmail.com>
 <20180530163644.GW6920@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180530163644.GW6920@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 30, 2018 at 9:36 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, May 30, 2018 at 09:31:55AM -0700, Doug Anderson wrote:
>> On Wed, May 30, 2018 at 9:13 AM, Mark Brown <broonie@kernel.org> wrote:
>
>> > If we're just going to use the most recently set voltage then hopefully
>> > the hardware already knew that, and it might not be the lowest available
>> > voltage if the last consumer to get turned off was holding the voltage
>> > higher.
>
>> To circle back to the original point: the problem is that (IMHO) the
>> hardware is doing the wrong thing by still counting Linux's vote for a
>> voltage even though Linux also voted that the regulator should be
>> disabled.  So basically we're working around the hardware by
>> pretending to vote for a dummy lower voltage whenever Linux wants the
>> regulator disabled.  From Linux's point of view everything works as
>> normal--we just tell the hardware a falsehood so it doesn't count our
>> vote for a voltage while the regulator is disabled.
>
> Yeah, and I don't think that's unreasonable for the core to do - just
> drop the voltage to the constraint minimum after it has turned off the
> regulator, then recheck and raise if needed before it enables again.

Would it do this for all regulators, though?  Most regulators are
hooked up over a slow i2c bus, so that means that every regulator
disable would now do an extra i2c transfer even though for all
regulators (other than RPMh) the voltage of a regulator doesn't matter
when it's been "disabled' (from Linux's point of view).

Hrmmm, I suppose maybe it'd be OK though because for most regulators
we'd use "regcache" and most regulators that we enabled/disable a lot
are not expected to change voltage in Linux (so the regcache write
would hopefully be a noop), so maybe it wouldn't be _that_
inefficient...

-Doug

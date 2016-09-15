From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/4] regulator: Add support for a fixed delay after
 voltage increases
Date: Thu, 15 Sep 2016 20:51:41 +0800
Message-ID: <CAD=FV=X2sYrgDkL71YBKVXObTpmNK8QtXfN2V=O1PE1nX0SdqA@mail.gmail.com>
References: <20160906190504.GA79728@google.com> <20160912183624.GG27946@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912183624.GG27946@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Brian Norris <briannorris@chromium.org>, Javier Martinez Canillas <javier@dowhile0.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

On Tue, Sep 13, 2016 at 2:36 AM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 06, 2016 at 12:05:04PM -0700, Matthias Kaehlcke wrote:
>
>> the stabilisation time. This change introduces the device tree property
>> "regulator-settle-time-up-us" which allows to specify a fixed delay
>
>> We don't add an option of a fixed delay on the way down for now because
>> the way down is probably modelled best with a ramp rate, not a fixed
>> delay.
>
> Are you sure?  It seems more likely to be highly load dependent if
> there's an appreciable variation.  That could be a ramp rate if you've
> got a very predictable load and a simple regulator but it seems like
> the system is less likely to care if we collapsed down in that case.

In the particular case we cared about we had to make some assumptions
about the slowest possible ramp rate downward because we were trying
to avoid triggering an over voltage protection.  In that particular
case the best way to model it was with a ramp rate because longer
voltage changes caused longer worst case transitions.  Just like you
said, the actual ramp time is highly variable but the "worst case
slowest" ramp time is best modeled with a ramp rate.

-Doug

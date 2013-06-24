From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: clarify some dt pinconfig options
Date: Mon, 24 Jun 2013 11:51:32 +0200
Message-ID: <CACRpkdbKOWEjnkzY2zGOqWPQ7okBjhK4=QR0tHhJYQa42nefXQ@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306141742.49923.heiko@sntech.de>
	<51C22C5F.5020402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C22C5F.5020402@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 12:10 AM, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
> On 06/14/2013 09:42 AM, Heiko St=FCbner wrote:

>> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindi=
ngs.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.tx=
t
>
>> -low-power-mode               - low power mode
>> +low-power-enable     - enable low power mode
>> +low-power-disable    - disable low power mode
>
> Hmmm. That's changing the binding definition. What if somebody alread=
y
> wrote their device tree according previous definition?

It's not merged so see it as alterations to a WIP in the
turners workshop or something.

> It seems to be that tri-states are preferable for pinctrl DT:
>
> no entry: do nothing
> =3D 0: disable
> =3D 1: enable

Better with explict enable/disable strings instead of
<0> or <1> I think, but the semantic effect would be the
same I guess, the upside with *enable/*disable strings is
that we do not have to handle cases like
tristate =3D <2>; ...

>> +Arguments for parameters:
>> +
>> +- bias-pull-up, -down and -pin-default take as optional argument 0 =
to disable
>> +  the pull, on hardware supporting it the pull strength in Ohm. bia=
s-disable
>> +  will also disable any active pull.
>
> Does this agree with the latest definition of the kernel-internal
> meaning of 0 for pull-up/down?

No that is wrong. Heiko, care to fix this binding doc?

>> +- input-schmitt takes as argument the adjustable hysteresis in a
>> +  driver-specific format
>> +
>> +- input-debounce takes the debounce time as argument or 0 to disabl=
e debouncing
>> +
>> +- power-source argument is the custom value describing the source t=
o select
>> +
>> +- slew-rate takes as argument the target rate in a driver-specific =
format
>
> If those things have driver-specific (note: should be
> DT-binding-specific, not driver-specific) values, then I'm not convin=
ced
> that having a generic parameter name for them is a good idea; it make=
s
> things look the same when they aren't. By forcing each binding to
> include the vendor prefix on those properties and hence define a cust=
om
> property name, you're making it clear that the semantics may be diffe=
rent.

Hmmm I don't think they're used right now, let's deal with them when
we have something to showcase them with. Patches to delete the
unclear bindings will be considered...

Yours,
Linus Walleij

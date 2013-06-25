From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 3/4] pinctrl: remove slew-rate parameter from tz1090
Date: Tue, 25 Jun 2013 14:50:49 +0100
Message-ID: <51C9A039.4090804@imgtec.com>
References: <201306251455.01540.heiko@sntech.de> <201306251456.36499.heiko@sntech.de> <51C99581.2010403@imgtec.com> <201306251521.55634.heiko@sntech.de> <51C99AB5.1080002@imgtec.com> <CACRpkdbdwvmBYFX=ppdM_RmGwyTcWVeTCMj60F4sh6YEVRE2Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbdwvmBYFX=ppdM_RmGwyTcWVeTCMj60F4sh6YEVRE2Uw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 25/06/13 14:32, Linus Walleij wrote:
> On Tue, Jun 25, 2013 at 3:27 PM, James Hogan <james.hogan@imgtec.com>=
 wrote:
>> On 25/06/13 14:21, Heiko St=FCbner wrote:
>=20
>>> My thoughts were that this code would never be reached when the par=
sing was
>>> removed and to not cause confusion to the driver when an acceptable=
 binding
>>> was found for slew-rate.
>>>
>>> But it of course also doesn't hurt to stay in.
>>
>> Okay, fair enough.
>>
>> Acked-by: James Hogan <james.hogan@imgtec.com>
>=20
> OK applied this so we have a clean slate.
>=20
> Patches adding it back in with SI measures will be welcomed!

Okay.

So the most descriptive documentation I can find for the slew rate in
the TZ1090 pin config hardware is basically:

0: slow (half frequency)
1: fast

Sounds like this pretty much precludes it from having a generic DT
binding unless it can be mapped to some physical value, so I'll add a
tz1090,slew-rate and use PIN_CONFIG_END+1 instead of PIN_CONFIG_SLEW_RA=
TE.

Anybody object to me adding an argument to
pinconf_generic_parse_dt_config() so that an additional
pinconf_generic_dt_params array can be optionally passed in? That way I
can share the generic pinconf dt parsing code.

Cheers
James

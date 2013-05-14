From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 5/8] pinctrl-tz1090: add TZ1090 pinctrl driver
Date: Tue, 14 May 2013 13:22:33 +0100
Message-ID: <51922C89.30403@imgtec.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-6-git-send-email-james.hogan@imgtec.com> <CACRpkdbYwDvF=gNurLzc+wE0BYpoqog7sPdRTY59BGS7yn3n9Q@mail.gmail.com> <517A6B01.5000708@imgtec.com> <CACRpkdYooPNgJuA-fZOiGJV03R_783uAOmR=QgYOahYdHcad9w@mail.gmail.com> <5183AC54.30503@imgtec.com> <CACRpkdYYhsY-2vQnxpM-rB9_6yXiY4XBNhb4eyNvK=eD=dxK5w@mail.gmail.com> <5183D262.7000107@imgtec.com> <CACRpkdbJpnpZwoCqtFk+U9fsJXPLw+AhPBSCxawS2-QwAjBftA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbJpnpZwoCqtFk+U9fsJXPLw+AhPBSCxawS2-QwAjBftA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 14/05/13 12:52, Linus Walleij wrote:
> On Fri, May 3, 2013 at 5:06 PM, James Hogan <james.hogan@imgtec.com> wrote:
>> [me]
>>> Thus this part of the problem (poking that "select" bit)
>>> should be handled by the pinmux part of the driver.
>>>
>>> The pinconf part does not need to know about it.
>>
>> Okay, so how would you recommend handling the case of a pin in a muxing
>> pingroup that shouldn't be put into peripheral mode?
>>
>> E.g. imagine an 18bit display is wired to the (24bit) tft pins (which
>> are muxed as a group to "tft" function), and the least significant tft
>> pins are used as GPIOs to control something like board power supplies.
>>
>> Without using pinconf I think the muxing pingroups would have to overlap
>> like below (is that acceptable?):
> 
> I don't know if I understand your example correctly but are you after
> this part of the documentation from Documentation/pinctrl.txt:
> 
> Pinmux conventions
> ==================
> (...)
>   It is possible to map several groups to the same combination of device,
>   pin controller and function. This is for cases where a certain function on
>   a certain pin controller may use different sets of pins in different
>   configurations.

I think that's the other way around, i.e. that's talking about mapping
several pingroups to the same function. The next paragraph is closer to
the problem:

Documentation/pinctrl.txt
> - PINS for a certain FUNCTION using a certain PIN GROUP on a certain
>   PIN CONTROLLER are provided on a first-come first-serve basis, so if some
>   other device mux setting or GPIO pin request has already taken your physical
>   pin, you will be denied the use of it. To get (activate) a new setting, the
>   old one has to be put (deactivated) first.

In my example the tft pingroup contains all the tft pins, but I might
want a particular pin inside that pingroup to never be controlled by the
mux (using the per-pin mux disable (SELECT) bits).

So if I use pinmux I'd have something like:
* "tft" pingroup maps to "tft" function
* "tft_green0" pingroup (containing individual pin inside "tft"
pingroup) maps to "none" function to disable muxing (or the inverse,
with each pin in use mapping to "periph" to enable muxing).
in which case the pin has multiple muxes "controlling" it (even though
they're sort of nested). The above paragraph seems to condemn this
arrangement.

Or using pinconf I'd have something like:
* "tft" pingroup maps to "tft" function
* "tft_green0" pin (in "tft" pingroup) has pinconf "no-periph" (or the
inverse, with each one in use having pinconf "periph")

Or modifying the pinctrl subsystem maybe something like:
* [optional: particular named pins in] "tft" pingroup map to "tft" function
that way enabling a mux doesn't necessarily apply to all pins in the
group, and drivers for hardware that doesn't support partial enabling of
the mux can reject it (I might experiment with this if I get the time).

Does that make more sense?

Cheers
James


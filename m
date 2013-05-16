From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 5/8] pinctrl-tz1090: add TZ1090 pinctrl driver
Date: Thu, 16 May 2013 10:12:44 +0100
Message-ID: <5194A30C.7040402@imgtec.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-6-git-send-email-james.hogan@imgtec.com> <CACRpkdbYwDvF=gNurLzc+wE0BYpoqog7sPdRTY59BGS7yn3n9Q@mail.gmail.com> <517A6B01.5000708@imgtec.com> <CACRpkdYooPNgJuA-fZOiGJV03R_783uAOmR=QgYOahYdHcad9w@mail.gmail.com> <5183AC54.30503@imgtec.com> <CACRpkdYYhsY-2vQnxpM-rB9_6yXiY4XBNhb4eyNvK=eD=dxK5w@mail.gmail.com> <5183D262.7000107@imgtec.com> <CACRpkdbJpnpZwoCqtFk+U9fsJXPLw+AhPBSCxawS2-QwAjBftA@mail.gmail.com> <51922C89.30403@imgtec.com> <CACRpkdZ5KW0qUF7vG1ZTmc0gez2T+e4KBugUGMpkXnXNmEMdEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ5KW0qUF7vG1ZTmc0gez2T+e4KBugUGMpkXnXNmEMdEw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 15/05/13 20:07, Linus Walleij wrote:
> On Tue, May 14, 2013 at 2:22 PM, James Hogan <james.hogan@imgtec.com> wrote:
> 
>> I think that's the other way around, i.e. that's talking about mapping
>> several pingroups to the same function. The next paragraph is closer to
>> the problem:
>>
>> Documentation/pinctrl.txt
>>> - PINS for a certain FUNCTION using a certain PIN GROUP on a certain
>>>   PIN CONTROLLER are provided on a first-come first-serve basis, so if some
>>>   other device mux setting or GPIO pin request has already taken your physical
>>>   pin, you will be denied the use of it. To get (activate) a new setting, the
>>>   old one has to be put (deactivated) first.
>>
>> In my example the tft pingroup contains all the tft pins, but I might
>> want a particular pin inside that pingroup to never be controlled by the
>> mux (using the per-pin mux disable (SELECT) bits).
>>
>> So if I use pinmux I'd have something like:
>> * "tft" pingroup maps to "tft" function
>> * "tft_green0" pingroup (containing individual pin inside "tft"
>> pingroup) maps to "none" function to disable muxing (or the inverse,
>> with each pin in use mapping to "periph" to enable muxing).
>> in which case the pin has multiple muxes "controlling" it (even though
>> they're sort of nested). The above paragraph seems to condemn this
>> arrangement.
> 
> So if this usecase is what you want to support, why don't you just
> exclude that one pin from the "tft" group and put it into another
> group?

It's a very board specific thing (that was just one example). To
generalise your suggestion would make all muxing pingroups contain no
pins (which is perhaps accurate since the thing that's muxed by the
group is a set of internal signals that may be muxed out to pins via the
SELECT bits).

Cheers
James


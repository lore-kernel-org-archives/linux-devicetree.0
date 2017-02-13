From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] checks: Warn on node name unit-addresses with '0x'
 or leading 0s
Date: Mon, 13 Feb 2017 14:11:57 -0600
Message-ID: <CAL_JsqL772=td67SVxVmXCHq-vEiX3EsSo4x2EcUxRNkfUK83A@mail.gmail.com>
References: <20170210164717.1234-1-robh@kernel.org> <20170210164717.1234-4-robh@kernel.org>
 <20170213045241.GY25381@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170213045241.GY25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 10:52 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Feb 10, 2017 at 10:47:16AM -0600, Rob Herring wrote:
>> Node name unit-addresses should never begin with 0x or leading 0s
>> regardless of whether they have a bus specific address (i.e. one with
>> commas) or not. Add warnings to check for these cases.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> v2:
>> - Split into separate check from unit_address_vs_reg
>
> I'm still not thrilled with applying this test unconditionally -
> especially when 4/4 introduces pretty much exactly the infrastructure
> to do this better.  If you add a unit name formatter function to the
> bus_type structure you really can then extend unit_address_vs_reg to
> verify them against each other, which will cover this as well more
> subtle mismatches.
>
> Obviously it would only do it for known bus types - but adding a
> "simple-bus" type would cover a lot of the cases, and a few for i2c
> and spi would cover most of the rest.

Sigh. Around in circles we go. As we discussed before, this is simple,
but common problem check. It is not a complete check of the entire
unit-address. It only checks the first number (in case of ',') and
doesn't validate the number itself. While in theory we can conceive of
a unit-address that would be a problem for this check, we have not
identified one. It's not like there's lots of unknown cases here. We
know the buses that are out there for the most part. We can always
blacklist any problematic cases or turn off the check by default if
the need arises.

As far as bus types, I could easily support simple-bus, but there's no
way to identify i2c and spi (and others like mdio) buses reliably.
Maybe go off node names if we got those standardized, but I can't
check standard node names for the same reason.

Rob

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or leading 0s
Date: Mon, 22 Feb 2016 10:51:46 -0600
Message-ID: <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw@mail.gmail.com>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org> <20160219050709.GB15224@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160219050709.GB15224-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 11:07 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
>> Node name unit-addresses should never begin with 0x or leading 0s
>> regardless of whether they have a bus specific address (i.e. one with
>> commas) or not. Add warnings to check for these cases.
>
> Hmm.. I'm pretty sure that's true in practice, but it's not true in
> theory.  A bus could define it's unit address format just about
> however it wants, including with leading 0s.

Only if it is not reviewed... This whole check is about what best
practices are, not what is possible.

> I think a better approach would be to add a test specific to
> simple-bus devices (by looking at compatible on the parent) that fully
> checks the unit address.
>
> From there we can start adding tests for other bus types.

simple-bus is easy enough, but then next up would be I2C and SPI. We
can't generically tell if a node is on I2C or SPI bus. If we do have
some bus with wacky addresses, it should definitely have a bus
compatible and then we can simply exclude it from the check.

Another option would be skipping the test if there are any commas (or
periods, etc.) in the unit address. That's pretty rare to begin with
and a single number is pretty much not a bus specific unit-address.

Rob

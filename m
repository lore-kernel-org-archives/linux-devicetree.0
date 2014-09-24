From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/3] watchdog: qcom: document device tree bindings
Date: Wed, 24 Sep 2014 11:56:00 +0100
Message-ID: <20140924105600.GD5729@leverpostej>
References: <cover.1411513109.git.joshc@codeaurora.org>
 <337231c0fc8b16b4f37e1e3b85cb0246f357a64d.1411513109.git.joshc@codeaurora.org>
 <2941802.u7NP2737aD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2941802.u7NP2737aD@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Cartwright <joshc@codeaurora.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 11:44:44AM +0100, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 18:04:37 Josh Cartwright wrote:
> > +- clocks : shall contain the input clock phandle
> 
> Just nitpicking, but this is not just a phandle, it's a clock
> descriptor, which is a phandle followed by a set of arguments,
> which may be empty, depending the on the clock controller
> implementation.

We're _extremely_ inconsistent with terminology, so it's not confusing
people don't know what to put here.

Elsewhere people say "phandle + clock specifier" (which is correct),
"clock reference" (which is ok, but sounds like a phandle), etc. From
what I recall some documentation says some *-specifier properties
include the phandle too.

It would be really nice if we had one consistent way of refering to
phandle+args style properties.

> 
> I would just call it 'the input clock', rather than 'input clock
> phandle'.

That's fine by me, given clocks is a well-understood standard property.

Mark.

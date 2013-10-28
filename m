From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Tue, 29 Oct 2013 10:16:14 +1100
Message-ID: <1383002174.5117.19.camel@pasglop>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	 <1381869563-16083-10-git-send-email-grant.likely@linaro.org>
	 <20131027134607.E1782C4039D@trevor.secretlab.ca>
	 <526EDB80.7080406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <526EDB80.7080406@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-10-28 at 15:47 -0600, Stephen Warren wrote:

> "interrupts-ex" would be shorter, although I guess slightly harder to
> guess its purpose, unless you're familiar with "ex" in symbol names.
> 
> ...
> >> +A device node may contain either "interrupts" or "interrupts-extended", but not
> >> +both. If both properties are present, then the operating system should log an
> >> +error
> 
> That sounds rather like prescribing SW behaviour, which I thought DT
> bindings shouldn't do?
> 
> >> and use only the data in "interrupts".
> 
> ... so perhaps that's better phrased as:
> 
> A device node may contain either "interrupts" or "interrupts-extended",
> but not both. If both properties are present, the data in "interrupts"
> takes precedence.

So let's add a coat of paint to this shed :-)

Either it's an error, or we have a precedence rule. If it's an error
then there is no point having a precedence rule, the DT is broken and
might be in all sort of other ways, the precedence is pointless, there's
no telling what property is correct.

However, if we have a precedence rule, then it should be the other way
around, interrupts-extended takes precedence.

A concrete example:

A device has two interrupts "INT0" and "INT1". One goes to PICA, the
other one to PICB,
the first one is necessary for basic use, the second one is only
necessary for some advanced/new functionality.

It makes sense in this case to have the device-tree do:

   interrupts = < INT0 >;
   interrupt-parent = <&PICA>;
   interrupts-extended = <&PICA, INT0, &PICB, INT1>;

Because that way:

 - An old kernel which doesn't understand interrupts-extended but *also*
only uses the first interrupt (doesn't exploit the advanced/new
functionalities) will work by picking up interrupts+interrupt-parent,

 - A newer kernel which does understand interrupts-extended can then
make use of it to support the advanced/new functionalities.

Cheers,
Ben.

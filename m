From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/2] regulator: max1586 add device-tree support
Date: Tue, 24 Jun 2014 20:05:30 +0200
Message-ID: <877g46tc7p.fsf@free.fr>
References: <1402757665-15102-1-git-send-email-robert.jarzmik@free.fr>
	<20140617144323.GU5099@sirena.org.uk> <87oaxrs5wb.fsf@free.fr>
	<20140624153812.GT23300@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140624153812.GT23300@sirena.org.uk> (Mark Brown's message of
	"Tue, 24 Jun 2014 16:38:12 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark Brown <broonie@kernel.org> writes:

> On Tue, Jun 17, 2014 at 09:16:52PM +0200, Robert Jarzmik wrote:
>> Mark Brown <broonie@kernel.org> writes:
>> > On Sat, Jun 14, 2014 at 04:54:24PM +0200, Robert Jarzmik wrote:
>
>> >> +	matched = of_regulator_match(dev, np, rmatch, ARRAY_SIZE(rmatch));
>> >> +	of_node_put(np);
>> >> +	if (matched <= 0)
>> >> +		return matched;
>
>> > Why is this treating zero as an error?  We should be able to at least
>> > report the current state of regulators even if none are configured in
>> > the device tree.
>
>> Euh how so an error ?
>
>> If 0 is returned, this means no regulators are found in device-tree. It's not an
>> error, it's a lack of regulators (ie. no Output_V3 and no Output_V6), and no
>> more handling is necessary in this function, while returning "ok", ie 0 ...
>
> OK, so there's just nothing to do in that case.  That's fine, but it's
> just not at all clear from the code.  A comment would help.
OK, no problem.

>
>> As for the "state report", this max1586 doesn't report anything, it cannot even
>> be queried about the current voltage, sic ...
>
> It can't?  That's unfortunate, though I was able to turn up a datasheet
> which appears to support that.
Oh really ? Well, tell me where you read it.

My personal reading from the Max1586 specs is (page 21, chapter "Serial Interface") :
    The LSB of the address word is the read/write (R/W) bit.
    R/W indicates whether the master is writing or reading
    (RD/W 0 = write, RD/W 1 = read). The MAX1586/
    MAX1587 only support the SEND BYTE format; there-
    fore, RD/W is required to be 0.

I'm wondering if you have this sentence in your datasheet too.

>> If you want me to modify this bit I need a bit more of an explanation to
>> understand.
>
> Where the driver is doing unusual things if they are actually sensible
> then the change needs to be clearer about why.
So would a comment like this address your comment ?

	/* Either matched < 0 and return the error. Or matched is 0 which means
	 * no init data was found, ie. no regulator is configured, and return 0
	 * to caller, stating neither error nor any matched regulator.
	 */

	if (matched <= 0)
		return matched;

Cheers.

-- 
Robert

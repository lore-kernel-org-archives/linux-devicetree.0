From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/2] regulator: max1586 add device-tree support
Date: Tue, 17 Jun 2014 21:16:52 +0200
Message-ID: <87oaxrs5wb.fsf@free.fr>
References: <1402757665-15102-1-git-send-email-robert.jarzmik@free.fr>
	<20140617144323.GU5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140617144323.GU5099@sirena.org.uk> (Mark Brown's message of
	"Tue, 17 Jun 2014 15:43:23 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark Brown <broonie@kernel.org> writes:

> On Sat, Jun 14, 2014 at 04:54:24PM +0200, Robert Jarzmik wrote:
>
>> +	matched = of_regulator_match(dev, np, rmatch, ARRAY_SIZE(rmatch));
>> +	of_node_put(np);
>> +	if (matched <= 0)
>> +		return matched;
>
> Why is this treating zero as an error?  We should be able to at least
> report the current state of regulators even if none are configured in
> the device tree.

Euh how so an error ?

If 0 is returned, this means no regulators are found in device-tree. It's not an
error, it's a lack of regulators (ie. no Output_V3 and no Output_V6), and no
more handling is necessary in this function, while returning "ok", ie 0 ...

As for the "state report", this max1586 doesn't report anything, it cannot even
be queried about the current voltage, sic ...

If you want me to modify this bit I need a bit more of an explanation to
understand.

Cheers.

-- 
Robert

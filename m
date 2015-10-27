From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v3] regulator, dt: add dt support for tps6502x regulator
Date: Tue, 27 Oct 2015 07:23:09 +0100
Message-ID: <562F184D.8000907@denx.de>
References: <1445858717-12707-1-git-send-email-hs@denx.de>
 <20151027021250.GR28319@sirena.org.uk>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151027021250.GR28319@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Mark,

Am 27.10.2015 um 03:12 schrieb Mark Brown:
> On Mon, Oct 26, 2015 at 12:25:17PM +0100, Heiko Schocher wrote:
>> add DT support for the tps6502x regulators.
>
> Please use subject lines matching the style for the subsystem.

Would be "regulator: tps6520x:" correct?

>> +	regulators = of_get_child_by_name(np, "regulators");
>> +	if (!regulators) {
>> +		dev_err(dev, "regulator node not found\n");
>> +		return NULL;
>> +	}
>
> Please use the generic support for locating the DT information for
> regulators using regulators_node and of_match in the regulator_desc
> rather than open coding this.

Hmm.. could you point me to a correct example? Seems I overlook sth.

drivers/regulator/tps65090-regulator.c
drivers/regulator/tps65910-regulator.c
drivers/regulator/tps6507x-regulator.c
drivers/regulator/tps6586x-regulator.c

are doing it all the same way ...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

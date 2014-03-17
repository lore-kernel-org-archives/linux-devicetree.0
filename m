From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Mon, 17 Mar 2014 14:44:00 +0100
Message-ID: <5326FC20.9020304@gmail.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-8-git-send-email-voice.shen@atmel.com> <20140317115518.GD11706@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140317115518.GD11706@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Bo Shen <voice.shen@atmel.com>
Cc: nicolas.ferre@atmel.com, Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello Mark,

Le 17/03/2014 12:55, Mark Brown a =E9crit :
> On Mon, Mar 17, 2014 at 05:45:40PM +0800, Bo Shen wrote:
>
>>     - compatible: "atmel,asoc-wm8904"
>>     - atmel,model: The user-visible name of this sound complex.
>> +  - clocks: A list of clocks needed by the wm8904 chip.
>> +  - clock-output-names: Driver related clock names. Shall contain "=
pck0".
> If this is a clock for the CODEC it should be documented as part of t=
he
> binding for the CODEC and connected to the CODEC in the device tree
> rather than being part of a machine driver binding.

Tell me if I'm mistaken, but doing this would implies a lot of changes.
The current wm8904 driver does not handle clk retrieval and configurati=
on,
and I'm afraid that introducing these concepts would break other driver=
s=20
(those
connecting to a wm8904 codec).

Do you see a simple alternative to this approach (or is there something=
=20
I misunderstood
in your suggestion) ?

How about adding CCF support as proposed in this series and think about=
=20
a cleaner
solution for a future release ?

Best Regards,

Boris

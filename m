From: thesven73@gmail.com
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document devicetree binding.
Date: Thu, 25 Oct 2018 09:35:54 -0400
Message-ID: <20181025133554.8050-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob, thank you so much for taking a look at this patch !

>> +This chip communicates with the SoC over the WEIM bus. It is
>> +expected that its Device Tree node is specified as the child of a node
>> +corresponding to the WEIM bus used for communication.
>
>By WEIM you are referring to i.MX external parallel bus? Presumably this 
>can work on any parallel bus, not just i.MX.

That's right, in theory this hardware could work with any parallel bus, if
timed correctly. The driver also has no code dependencies on the WEIM driver.
You'll only find it in the field on top of the i.MX's WEIM bus, however.

Do you think it would be 'nicer' to drop references to i.MX and WEIM? Can do.

>> +  - compatible : The following chip-specific string:
>> +        "arcx,anybus-bridge"
>
>No version or part number?

We have id and capability registers in the chip for that. This driver is
generic, both forwards and backwards compatible. Is it ok to leave out
version/part number in this case?

The rest of your feedback will go into v2. Thanks :)

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 00/14] fsi: Fixes and Coldfire coprocessor offload
Date: Wed, 27 Jun 2018 09:25:51 +1000
Message-ID: <20180626232605.13420-1-benh@kernel.crashing.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series implements support for offloading the FSI protocol bitbanging
to the ColdFire secondary core of the Aspeed SoCs. The result increases
FSI performance by a factor of 4, and on systems that don't support async
FSI clock, provide much more regular and continuous clocking which helps
reliability.

Patch 1 may go a different route and was already posted a few weeks ago,
I included it for completeness.

Patches 2..9 add some infrastructure to the FSI core to control some
of the FSI protocol delays and adjustements/fixes to the existing GPIO
bitbanging master. They are "mechanical" dependencies

Patch 10 moves some protocol definitions to a common place where the
new master driver can find them

Patch 11 is the DT binding for the new driver with comes with patch 12

Finally patch 13 and 14 update the Romulus and Palmetto board device-trees
to use the new driver.

There's another dependency on the Aspeed GPIO driver changes for handling
with GPIO lines ownership and handshaking. The patches have been submitted
and can be found for reference there:

        https://github.com/ozbenh/linux-ast/commits/gpio

Finally, the driver needs a machine specific firmware file. The firwmare
is open source and available at:

        https://github.com/ozbenh/cf-fsi

I will submit it to linux-firmware if there's enough popular demand ;-)

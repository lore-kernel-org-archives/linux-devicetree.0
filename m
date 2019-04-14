Return-Path: <SRS0=g90a=SQ=gmail.com=peron.clem@kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 14 Apr 2019 18:18:04 +0200
Message-ID: <CAJiuCceeLwY+myYtUf15frSYsLKmGaUBifAOxUkNWwSjbF4oDg@mail.gmail.com>
Subject: Question about compatible fallback and documentation
Content-Type: text/plain; charset="UTF-8"
To: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

I have to bind an already existing IP by a vendor in a new SoC called
"SOC3" device-tree.

In the 1st gen of "SOC1" the IP is introduced :
soc1.dtsi :
compatible = "vendor,ip-soc1";

Then a 2nd gen of the IP is introduced in "SOC2" with new registers.
But the driver of the 1st gen is still working fine and no update of
the existing driver has been introduced because not required.
soc2.dtsi :
compatible = "vendor,ip-soc2", "vendor,ip-soc1";

Finally in "SOC3" and regardind the user manual we think that the IP
introduced is the same as "SOC2".
Should the compatible in soc3.dtsi be A or B?
A) compatible = "vendor,ip-soc2", "vendor,ip-soc1";
or
B) compatible = "vendor,ip-soc3", "vendor,ip-soc2", "vendor,ip-soc1";

I propose the solution B) because we don't know what could happens
maybe the IP could need a quirks only for "SOC3". And device tree
shouldn't move for the user only the driver.

Last question does we have to document all the compatible use in
DTS(i) files in the Documentation ? or only the compatible used by the
drivers ?

Thanks for answers,
Clement

Return-Path: <SRS0=+3R1=ZM=hellion.org.uk=ijc@kernel.org>
Message-ID: <1485765782.7612.21.camel@hellion.org.uk>
Subject: Lots of "Warning (unit_address_vs_reg): Node XXX has a unit name,
 but no reg property"
From: Ian Campbell <ijc@hellion.org.uk>
Date: Mon, 30 Jan 2017 08:43:02 +0000
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-ID: <devicetree@vger.kernel.org>

I recently updated the device-tree-compiler package on the system which
builds the split device tree repo[0]�from 1.4.0+dfsg-2 to 1.4.2-1
(debian package versions) and now during the test build I see many
(over 1,000) of these:

    Warning (unit_address_vs_reg): Node     /soc@ff700000    /ethernet@b0000     has a unit name, but no reg property

    Is this something which is known? Maybe Linux hasn't pulled in the
    newer dtc yet so you aren't hitting it yet, or maybe you've done what I
    did as a quick fix and added:
    DTC_FLAGS="-W no-unit_address_vs_reg"
    ?

    (a second issue is the lack of the offending filename in the warning
    message, I'll figure out the right venue for that next)

    Ian.

    [0]     https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

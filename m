From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Fri,  4 Aug 2017 18:18:51 -0700
Message-ID: <20170805011855.1027-1-brendanhiggins@google.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au, benh@kernel.crashing.org, benjaminfair@google.com
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
same semantics as IPMI Block Transfer except it done over I2C.

For the OpenBMC people, this is based on an RFC:
https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html

The documentation discusses the reason for this in greater detail, suffice it to
say SSIF cannot be correctly implemented on some naive I2C devices. There are
some additional reasons why we don't like SSIF, but those are again covered in
the documentation for all those who are interested.

In addition, since I am adding both host side and BMC side support, I figured
that now is a good time to resolve the problem of where to put BMC side IPMI
drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
rest of the host side IPMI drivers, but I think it makes sense to put all of the
host side IPMI drivers in one directory and all of the BMC side drivers in
another, preferably in a way that does not effect all of the current OpenIPMI
users. I have not created a MAINTAINERS entry for the new directory yet, as I
figured there might be some discussion to be had about it.

I have tested this patchset on the Aspeed 2500 EVB.

Changes since previous update:
  - Cleaned up some documentation.
  - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
    directory.

From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Fri,  4 Aug 2017 16:18:51 -0700
Message-ID: <20170804231854.19730-1-brendanhiggins@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au, benh@kernel.crashing.org
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
same semantics as IPMI Block Transfer except it done over I2C.

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

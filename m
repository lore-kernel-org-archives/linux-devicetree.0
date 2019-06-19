From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: SPDX conversion under scripts/dtc/ of Linux Kernel
Date: Wed, 19 Jun 2019 19:23:19 +0900
Message-ID: <CAK7LNARHHXv5Tu4BHN1avKOExS6HmPfd2c0ELZiQaxtmETOsDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh+dt@kernel.org>, linux-spdx@vger.kernel.org, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi.

In this development cycle of Linux kernel,
lots of files were converted to use SPDX
instead of the license boilerplate.

However.

Some files were imported from a different project,
and are periodically synchronized with the upstream.
Have we discussed what to do about this case?


For example, scripts/dtc/ is the case.

The files in scripts/dtc/ are synced with the upstream
device tree compiler.

Rob Herring periodically runs scripts/dtc/update-dtc-source.sh
to import outcome from the upstream.


The upstream DTC has not adopted SPDX yet.

Some files in Linux (e.g. scripts/dtc/dtc.c)
have been converted to SPDX.

So, they are out of sync now.

The license boilerplate will come back
when Rob runs scripts/dtc/update-dtc-source.sh
next time.

What shall we do?

[1] Convert upstream DTC to SPDX

This will be a happy solution if it is acceptable in DTC.
Since we cannot push the decision of the kernel to a different
project, this is totally up to David Gibson.

[2] Change scripts/dtc/update-dtc-source.sh to
    take care of the license block somehow

[3] Go back to license boilerplate, and keep the files
    synced with the upstream
    (and scripts/dtc/ should be excluded from the
     SPDX conversion tool.)

Or, what else?

-- 
Best Regards
Masahiro Yamada

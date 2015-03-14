From: Frank Rowand <frowand.list@gmail.com>
Subject: [Patch 0/5] dt: unittest: fix breakage and warnings
Date: Fri, 13 Mar 2015 22:25:51 -0700
Message-ID: <5503C65F.4030000@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Running checkpatch on early versions of my patchset to fix the devicetree
make dependency issues exposed a large number of warnings, including some that
are actual bugs.  http://lkml.iu.edu/hypermail/linux/kernel/1503.1/03335.html

These patches fix those bugs, and another bug exposed by fixing those bugs.
As a result, the number of tests completed increased from 102 to 107.

Since I was already poking around, I fixed a few classes of checkpatch warnings.

There are still plenty of warnings, but the noise is greatly reduced and future
checkpatch warnings that are problems should stand out more clearly.

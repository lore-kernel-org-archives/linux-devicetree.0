From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: update the of_selftest.txt
Date: Tue, 10 Mar 2015 09:44:17 -0500
Message-ID: <CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ@mail.gmail.com>
References: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Long <long.wanglong@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Gaurav Minocha <gaurav.minocha.os@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

On Sun, Mar 8, 2015 at 9:35 PM, Wang Long <long.wanglong@huawei.com> wrote:
> Since the directory "drivers/of/testcase-data" is renamed
> to "drivers/of/unittest-data". so we should update the path
> in the of_selftest.txt.
>
> When the kernel is built with OF_SELFUNIT enabled, the output

Still wrong...

> dtb is testcases.dtb instead of testcase.dtb, also update it
> (s/testcase/testcases/).
>
> Signed-off-by: Wang Long <long.wanglong@huawei.com>
> ---
>  Documentation/devicetree/of_selftest.txt | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/devicetree/of_selftest.txt
> index 57a808b..3e4e7d4 100644
> --- a/Documentation/devicetree/of_selftest.txt
> +++ b/Documentation/devicetree/of_selftest.txt
> @@ -1,11 +1,11 @@
> -Open Firmware Device Tree Selftest
> +Open Firmware Device Tree Unittest
>  ----------------------------------
>
>  Author: Gaurav Minocha <gaurav.minocha.os@gmail.com>
>
>  1. Introduction
>
> -This document explains how the test data required for executing OF selftest
> +This document explains how the test data required for executing OF unittest
>  is attached to the live tree dynamically, independent of the machine's
>  architecture.
>
> @@ -22,31 +22,31 @@ most of the device drivers in various use cases.
>
>  2. Test-data
>
> -The Device Tree Source file (drivers/of/testcase-data/testcases.dts) contains
> +The Device Tree Source file (drivers/of/unittest-data/testcases.dts) contains
>  the test data required for executing the unit tests automated in
> -drivers/of/selftests.c. Currently, following Device Tree Source Include files
> -(.dtsi) are included in testcase.dts:
> +drivers/of/unittest.c. Currently, following Device Tree Source Include files
> +(.dtsi) are included in testcases.dts:
>
> -drivers/of/testcase-data/tests-interrupts.dtsi
> -drivers/of/testcase-data/tests-platform.dtsi
> -drivers/of/testcase-data/tests-phandle.dtsi
> -drivers/of/testcase-data/tests-match.dtsi
> +drivers/of/unittest-data/tests-interrupts.dtsi
> +drivers/of/unittest-data/tests-platform.dtsi
> +drivers/of/unittest-data/tests-phandle.dtsi
> +drivers/of/unittest-data/tests-match.dtsi
>
>  When the kernel is build with OF_SELFTEST enabled, then the following make rule

Missed this one...

>
>  $(obj)/%.dtb: $(src)/%.dts FORCE
>         $(call if_changed_dep, dtc)
>
> -is used to compile the DT source file (testcase.dts) into a binary blob
> -(testcase.dtb), also referred as flattened DT.
> +is used to compile the DT source file (testcases.dts) into a binary blob
> +(testcases.dtb), also referred as flattened DT.
>
>  After that, using the following rule the binary blob above is wrapped as an
> -assembly file (testcase.dtb.S).
> +assembly file (testcases.dtb.S).
>
>  $(obj)/%.dtb.S: $(obj)/%.dtb
>         $(call cmd, dt_S_dtb)
>
> -The assembly file is compiled into an object file (testcase.dtb.o), and is
> +The assembly file is compiled into an object file (testcases.dtb.o), and is
>  linked into the kernel image.
>
>
> @@ -98,7 +98,7 @@ child11 -> sibling12 -> sibling13 -> sibling14 -> null
>  Figure 1: Generic structure of un-flattened device tree
>
>
> -Before executing OF selftest, it is required to attach the test data to
> +Before executing OF unittest, it is required to attach the test data to
>  machine's device tree (if present). So, when selftest_data_add() is called,

This one too.

>  at first it reads the flattened device tree data linked into the kernel image
>  via the following kernel symbols:
> --
> 1.8.3.4
>

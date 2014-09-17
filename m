From: Andrew Bresticker <abrestic@google.com>
Subject: Re: [PATCH 0/6] dts, kbuild: Implement support for dtb vendor subdirs
Date: Tue, 16 Sep 2014 20:49:18 -0700
Message-ID: <CAL1qeaGCeRyeKLo70E264bZcamOfBKoN9Y8_NDCjV5j4DoOw1Q@mail.gmail.com>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1409899692-1455-1-git-send-email-rric@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Robert Richter <rric@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>
List-Id: devicetree@vger.kernel.org

Robert,

> For arm64 we want to put dts files into vendor's subdirectories from
> the beginning. This patch set implements this. As this is a generic
> kbuild implementation, vendor subdirs will be also available for
> arch/arm and other architectures. The subdirectory tree is also
> reflected in the install path.
>
> A new makefile variable dts-dirs is introduced to point to dts
> subdirs. This variable is used by kbuild for building and installation
> of dtb files.
>
> A dts Makefile looks now as follows:
>
> ----
> dtb-$(CONFIG_...) += some_file_1.dtb
> dtb-$(CONFIG_...) += some_file_2.dtb
>
> dts-dirs          += dir_vendor_a
> dts-dirs          += dir_vendor_b
>
> # come always afterwards:
> always         := $(dtb-y)
> subdir-y       := $(dts-dirs)
> clean-files    := *.dtb
> ----
>
> This patches also introduces the dtbs_install make target for
> arm64. Install rules are moved to Makefile.dtbinst using the same
> style and calling convention like for modinst and fwinst.
>
> Robert Richter (6):
>   dts, arm64: Add dtbs_install make target
>   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
>   dts, arm/arm64: Remove dtbs build rules in sub-makes
>   dts, kbuild: Implement support for dtb vendor subdirs
>   dts, arm64: Move dts files to vendor subdirs
>   dts, arm: Remove $(MACHINE) variable from dtbs make recipes

I've tested this for arm64 and by adding a vendor sub-directory
locally for arm.  This series is also the base for my MIPS DT vendor
sub-directory series
(http://www.linux-mips.org/archives/linux-mips/2014-09/msg00217.html).
So, for the entire series,

Tested-by: Andrew Bresticker <abrestic@chromium.org>

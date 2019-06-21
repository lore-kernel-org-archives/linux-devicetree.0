From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version
 v1.5.0-30-g702c1b6c0e73
Date: Fri, 21 Jun 2019 16:54:44 +0200
Message-ID: <20190621145444.GB6313@kroah.com>
References: <20190621142900.31988-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621142900.31988-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 08:29:00AM -0600, Rob Herring wrote:
> Pull in SPDX tag conversion from upstream dtc. This will replace the
> conversion done in the kernel tree copy in v5.2-rc2.
> 
> This adds the following commits from upstream:
> 
> 702c1b6c0e73 README.license: Update to reflect SPDX tag usage
> 4097bbffcf1d dtc: Add GPLv2 SPDX tags to files missing license text
> 94f87cd5b7c5 libfdt: Add dual GPL/BSD SPDX tags to files missing license text
> c4ffc05574b1 tests: Replace license boilerplate with SPDX tags
> a5ac29baacd2 pylibfdt: Replace dual GPLv2/BSD license boilerplate with SPDX tags
> 7fb0f4db2eb7 libfdt: Replace GPL/BSD boilerplate/reference with SPDX tags
> acfe84f2c47e dtc: Replace GPLv2 boilerplate/reference with SPDX tags
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

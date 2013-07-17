From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [RFC PATCH v5 0/1] drivers: mfd: Versatile Express SPC support
Date: Wed, 17 Jul 2013 10:18:25 +0100
Message-ID: <1374052705.3146.86.camel@hornet>
References: <1373990743-23106-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373990743-23106-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Nicolas Pitre <nicolas.pitre@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>, Achin Gupta <Achin.Gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-07-16 at 17:05 +0100, Lorenzo Pieralisi wrote:
> /drivers/mfd is probably not the right place for this code as it stan=
ds (but
> probably will be when the entire driver, with DVFS and config interfa=
ce, is
> complete).

Not that it really matters now, but my vexpress-sysreg rework will -
most likely - leave only skeleton in the MFD (registering mfd_cells) an=
d
other stuff is going to be spread all around. Then I'm planning to move
the remaining of the vexpress-specific initialization to
drivers/platform/arm/vexpress.c, so maybe sticking vexpress-spc.c to
this (non-existing yet) directory would be the right thing to do?

Other than that:

Acked-by: Pawel Moll <pawel.moll@arm.com>

Thanks!

Pawe=C5=82

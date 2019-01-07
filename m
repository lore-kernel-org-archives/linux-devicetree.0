From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 3/4] usb: musb: jz4740: Drop dependency on MACH_JZ4740,
 use COMPILE_TEST
Date: Mon, 7 Jan 2019 14:10:06 -0600
Message-ID: <20190107201006.GC25910@uda0271908>
References: <20181213144555.24031-1-paul@crapouillou.net>
 <20181213144555.24031-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213144555.24031-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Hi,

Please use the following subject instead.

	usb: musb: Kconfig: Drop dependency on MACH_JZ4740 and use COMPILE_TEST for jz4740
	
On Thu, Dec 13, 2018 at 03:45:54PM +0100, Paul Cercueil wrote:
> Depending on MACH_INGENIC prevent us from creating a generic kernel that

did you mean MACH_JZ4740 instead?

Regards,
-Bin.

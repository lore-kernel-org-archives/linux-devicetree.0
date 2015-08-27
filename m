From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [PATCH 00/16] deps: deterministic driver initialization order
Date: Thu, 27 Aug 2015 21:01:16 +0200
Message-ID: <55DF5E7C.8030806@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Russel King <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

Am 26.08.2015 um 14:28 schrieb Alexander Holler:

> The final 2 patches are fixes which should end up in mainline, regardless
> if this feature is merged or not.

Just in case your serial or MTD-NAND partitions don't work, the drivers
drivers/tty/serial/8250/8250_core.c and drivers/mtd/ofpart.c need the 
same trivial fix for their initcall level as found in the last two 
patches of my series. I'm not going to post these patches now until I've 
got some feedback for the other stuff.

Regards,

Alexander Holler

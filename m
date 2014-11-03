From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 02/17] ARM: mvebu: enable strex backoff delay
Date: Mon, 03 Nov 2014 18:08:46 +0100
Message-ID: <5457B69E.7020508@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com> <1414151970-6626-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1414151970-6626-3-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: stable-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,
On 24/10/2014 13:59, Thomas Petazzoni wrote:
> From: Nadav Haklai <nadavh@marvell.com>
> 
> Under extremely rare conditions, in an MPCore node consisting of at
> least 3 CPUs, two CPUs trying to perform a STREX to data on the same
> shared cache line can enter a livelock situation.
> 
> This patch enables the HW mechanism that overcomes the bug. This fixes
> the incorrect setup of the STREX backoff delay bit due to a wrong
> description in the specification.
> 
> Note that enabling the STREX backoff delay mechanism is done by
> leaving the bit *cleared*, while the bit was currently being set by
> the proc-v7.S code.
> 
> [Thomas: adapt to latest mainline, slightly reword the commit log, add
> stable markers.]
> 
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: <stable@vger.kernel.org> # v3.8+
> Fixes: de4901933f6d ("arm: mm: Add support for PJ4B cpu and init routines")
> Signed-off-by: Nadav Haklai <nadavh@marvell.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This patch is submitted as part of the suspend/resume work, because
> the suspend/resume path is triggering this rare bug in a very
> reproducible fashion.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/arm/mm/proc-v7.S | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

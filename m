From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface) driver
Date: Mon, 01 Dec 2014 17:17:30 +0100
Message-ID: <2417519.MDE3mu6n7n@wuerfel>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <19172687.eVxczUuuhC@ws-stein> <20141201115006.08197c40@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141201115006.08197c40@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 11:50:06 Boris Brezillon wrote:
> 
> I don't have a strong opinion regarding where this driver should
> live (I even considered putting it in drivers/bus) :-).
> But note that there are other "external memory interface" drivers
> in drivers/memory too: TI AEMIF and Marvell DEVBUS  ;-).
> 
> Does anyone else think this driver should go in drivers/bus ?
> 

I think drivers/memory is better.

	Arnd

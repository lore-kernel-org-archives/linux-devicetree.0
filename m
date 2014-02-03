From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/10] watchdog: xilinx: Add missing binding
Date: Mon, 03 Feb 2014 16:32:25 +0100
Message-ID: <3121595.GbLMuGPlvA@wuerfel>
References: <ed4cb31c9a549343e6b492cf62fc962d39034bd0.1391177880.git.michal.simek@xilinx.com> <201402031606.11753.arnd@arndb.de> <24ecacca-2714-4834-921c-b827c0e592a3@VA3EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <24ecacca-2714-4834-921c-b827c0e592a3@VA3EHSMHS003.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, monstr@monstr.eu, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Monday 03 February 2014 16:13:47 Michal Simek wrote:
> Intention wasn't to fix binding but document current one
> which is in mainline for a long time.

Ok, I see.

> Apart of this - yes, wdt-enable-once is nowayout and wdt-interval should be timeout
> is seconds, and clock-frequency should go out and use CCF for getting clock.

Could we make a common binding then, and document that the xilinx
watchdog can optionally provide either one?

	Arnd

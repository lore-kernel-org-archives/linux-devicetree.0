From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 3/4] ARM: dts: da850-lcdk: Add NAND to DT
Date: Wed, 10 Aug 2016 14:01:57 +0530
Message-ID: <57AAE67D.4000404@ti.com>
References: <20160809171518.22690-1-kbeldan@baylibre.com>
 <20160809171518.22690-4-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160809171518.22690-4-kbeldan@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 August 2016 10:45 PM, Karl Beldan wrote:
> This adds DT support for the NAND connected to the SoC AEMIF.
> The parameters (timings, ecc) are the same as what the board ships with
> (default AEMIF timings, 1bit ECC) and improvements will be handled in
> due course.

I disagree that we need to be compatible to the software that ships with
the board. Thats software was last updated 3 years ago. Instead I would
concern with what the hardware supports. So, if the hardware can support
4-bit ECC, I would use that.

If driver is broken for 4-bit ECC, please fix that up first.

> This passed elementary tests hashing a 20MB file on top of ubifs on my
> LCDK.
> 
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

Thanks,
Sekhar

From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v3 1/2] memory: ti-aemif: introduce AEMIF driver
Date: Sat, 14 Dec 2013 14:13:47 -0500
Message-ID: <52ACADEB.30307@ti.com>
References: <1386759570-29671-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386759570-29671-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386759570-29671-2-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, gregkh@linuxfoundation.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, nsekhar@ti.com, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, "[initial author] Murali Karicheri" <m-karicheri2@ti.com>, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 December 2013 05:59 AM, Ivan Khoronzhuk wrote:
> Add new AEMIF driver for EMIF16 Texas Instruments controller.
> The EMIF16 module is intended to provide a glue-less interface to
> a variety of asynchronous memory devices like ASRA M, NOR and NAND
> memory. A total of 256M bytes of any of these memories can be
> accessed at any given time via 4 chip selects with 64M byte access
> per chip select.
> 
> Synchronous memories such as DDR1 SD RAM, SDR SDRAM and Mobile SDR
> are not supported.
> 
> This controller is used on SoCs like Davinci, Keysone2
> 
> Signed-off-by: [initial author] Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>

From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 11 Jan 2016 10:06:30 -0600
Message-ID: <5693D306.9070001@opensource.altera.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1452486886-8049-1-git-send-email-marex@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, "R, Vignesh" <vigneshr@ti.com>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On 01/10/2016 10:34 PM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add binding document for the Cadence QSPI controller.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: "R, Vignesh" <vigneshr@ti.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Cc: devicetree@vger.kernel.org
> ---

I think you also need to CC the following people for proper review of
these bindings:

Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Pawel Moll <pawel.moll@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Ian Campbell <ijc+devicetree@hellion.org.uk> (maintainer:OPEN FIRMWARE
AND FLATTENED DEVICE TREE BINDINGS)
Kumar Gala <galak@codeaurora.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)

Dinh



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

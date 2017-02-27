From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: nand: atmel: Document the new DT bindings
Date: Mon, 27 Feb 2017 13:12:31 -0600
Message-ID: <20170227191231.qub5boyro2scb362@rob-hp-laptop>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487593718-20752-3-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Josh Wu <rainyfeeling@outlook.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 01:28:37PM +0100, Boris Brezillon wrote:
> The old NAND bindings were not exactly describing the hardware topology
> and were preventing definitions of several NAND chips under the same
> NAND controller.
> 
> New bindings address these limitations and should be preferred over the
> old ones for new SoCs/boards.
> Old bindings are still supported for backward compatibility but are
> marked deprecated in the doc.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 107 ++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

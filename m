From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Mon, 4 Apr 2016 00:15:59 -0500
Message-ID: <20160404051559.GI17806@rob-hp-laptop>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Harvey Hunt <harvey.hunt@imgtec.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
> 
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - fix typo
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

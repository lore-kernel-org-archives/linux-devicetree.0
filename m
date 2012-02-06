From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Date: Mon, 6 Feb 2012 17:20:24 +0100
Message-ID: <201202061720.24996.sr@denx.de>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-mtd@lists.infradead.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Christophe,

On Monday 06 February 2012 11:35:11 Jean-Christophe PLAGNIOL-VILLARD wrote:
> - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>   Supported values are: "none", "soft", "hw", "hw_syndrome",
> "hw_oob_first", "soft_bch".
> - nand-bus-width : 8 or 16 bus width if not present 8
> - nand-on-flash-bbt: boolean to enable on flash bbt option if not present
> false

Why not use an "empty" type (without argument) for nand-on-flash-bbt then?

Thanks,
Stefan

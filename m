From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Date: Tue, 7 Feb 2012 05:16:06 +0100
Message-ID: <20120207041606.GD15647@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
 <201202061720.24996.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201202061720.24996.sr@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Stefan Roese <sr@denx.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17:20 Mon 06 Feb     , Stefan Roese wrote:
> Hi Jean-Christophe,
> 
> On Monday 06 February 2012 11:35:11 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >   Supported values are: "none", "soft", "hw", "hw_syndrome",
> > "hw_oob_first", "soft_bch".
> > - nand-bus-width : 8 or 16 bus width if not present 8
> > - nand-on-flash-bbt: boolean to enable on flash bbt option if not present
> > false
> 
> Why not use an "empty" type (without argument) for nand-on-flash-bbt then?
I want to be able to disable it

I send a patch to add a helper to manage boolean

this will allow to disable a boolean

    is-ok;          => true
    is-ok = <1>;    => true
    is-ok = <0>;    => false

Best Regards,
J.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

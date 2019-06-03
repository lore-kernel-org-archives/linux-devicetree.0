From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength and nand-ecc-step-size optional
Date: Mon,  3 Jun 2019 10:02:51 +0200
Message-ID: <20190603080251.27710-1-miquel.raynal@bootlin.com>
References: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-05-21 at 14:44:21 UTC, Kamal Dasu wrote:
> nand-ecc-strength and nand-ecc-step-size can be made optional as
> brcmnand driver can support using raw NAND layer detected values.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

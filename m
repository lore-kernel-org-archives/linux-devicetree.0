From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 6/9] mtd: nand: add sunxi NFC dt bindings doc
Date: Thu, 9 Jan 2014 11:00:57 +0100
Message-ID: <201401091100.58174.arnd@arndb.de>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com> <201401082228.55807.arnd@arndb.de> <52CE5E5A.6050209@overkiz.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52CE5E5A.6050209@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: boris brezillon <b.brezillon@overkiz.com>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 09 January 2014, boris brezillon wrote:
> Sure, I'll remove references to the NFC acronym:
>   - change compatible string to "allwinner,sun4i-nand"
>   - avoid NFC references in the doc
>   - rename the driver into sunxi-nand.c (formerly sunxi_nfc.c)
> 
> Do you see any other references to this acronym ?
> 

Those are the important ones, thanks!

Regarding the binding, I would mention nfc once there to help people
that happen to look for that.

	Arnd

From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 1/6] arm: add msi.h to Kbuild
Date: Tue, 22 Sep 2015 19:23:48 +0100
Message-ID: <20150922192348.1c9814c8@arm.com>
References: <1442801587-3812-1-git-send-email-lftan@altera.com>
	<1442801587-3812-2-git-send-email-lftan@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442801587-3812-2-git-send-email-lftan@altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ley Foon Tan <lftan@altera.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lftan.linux@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Sep 2015 10:13:02 +0800
Ley Foon Tan <lftan@altera.com> wrote:

> Include asm-generic/msi.h to support CONFIG_GENERIC_MSI_IRQ_DOMAIN.
> This to fix compilation error:
> "include/linux/msi.h:123:21: fatal error: asm/msi.h:
> No such file or directory"
> 
> Signed-off-by: Ley Foon Tan <lftan@altera.com>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny.

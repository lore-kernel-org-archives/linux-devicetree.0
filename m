From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC 06/12] mtd: nand: add reworked Marvell NAND controller driver
Date: Thu, 19 Oct 2017 09:18:10 +0200
Message-ID: <20171019091810.13f54c78@bbrezillon>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-7-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171018143629.29302-7-miquel.raynal@free-electrons.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>, Stefan Agner <stefan@agner.ch>, Nadav Haklai <nadavh@marvell.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Marc Gonzalez <marc_gonzalez@sigma>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Oct 2017 16:36:23 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:


> +
> +enum marvell_nfc_variant {
> +	MARVELL_NFC_VARIANT_PXA3XX,
> +	MARVELL_NFC_VARIANT_ARMADA370,
> +	MARVELL_NFC_VARIANT_ARMADA_8K,
> +};
> +
> +/*
> + * NAND controller capabilities for distinction between compatible strings
> + *
> + * @variant:		Board type
> + * @max_cs_nb:		Number of Chip Select lines available
> + * @max_rb_nb:		Number of Ready/Busy lines available
> + * @legacy_of_bindings	Indicates if DT parsing must be done using the old
> + *			fashion way
> + */
> +struct marvell_nfc_caps {
> +	enum marvell_nfc_variant variant;

Do you really need this variant field. It seems you're only using it to
detect if you should MUX the NAND pins using the Special Function
registers on armada8k. Maybe you should just have:

	bool need_system_controller;

and set it to true for the "armada8k" compatible.

> +	unsigned int max_cs_nb;
> +	unsigned int max_rb_nb;
> +	bool legacy_of_bindings;
> +};
> +

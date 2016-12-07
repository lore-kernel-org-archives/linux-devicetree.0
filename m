From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v5 3/3] fpga manager: Add cyclone-ps-spi driver for
 Altera FPGAs
Date: Wed, 7 Dec 2016 22:21:27 +0100
Message-ID: <20161207222127.23f6b8b4@crub>
References: <cover.1481139171.git.stillcompiling@gmail.com>
 <1778a82d1989d13919b24e47fa09eeb56b2cb8e5.1481139171.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1778a82d1989d13919b24e47fa09eeb56b2cb8e5.1481139171.git.stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed,  7 Dec 2016 13:04:40 -0800
Joshua Clayton stillcompiling@gmail.com wrote:
...
>+static int cyclonespi_write_init(struct fpga_manager *mgr, u32 flags,
>+				 const char *buf, size_t count)

there is a minor API change in linux-next [1]. struct fpga_image_info *
is passed instead of u32 flags. I assume this will be merged soon, so
please prepare this driver accordingly.

...
>+static int cyclonespi_write_complete(struct fpga_manager *mgr, u32 flags)

same here.

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/fpga?id=1df2865f8dd9d56cb76aa7aa1298921e7bece2af

--
Anatolij

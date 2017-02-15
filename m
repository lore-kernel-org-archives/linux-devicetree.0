From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v9 2/3] fpga manager: Add cyclone-ps-spi driver for
 Altera FPGAs
Date: Wed, 15 Feb 2017 16:26:41 +0100
Message-ID: <20170215162641.5bc50cf3@crub>
References: <cover.1485295905.git.stillcompiling@gmail.com>
        <94f1d92f502b64669467c467038c3aa766b312ad.1485295905.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <94f1d92f502b64669467c467038c3aa766b312ad.1485295905.git.stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joshua,

On Tue, 24 Jan 2017 14:19:33 -0800
Joshua Clayton stillcompiling@gmail.com wrote:
...
>+static int cyclonespi_write(struct fpga_manager *mgr, const char *buf,
>+			    size_t count)
>+{
>+	struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
>+	const char *fw_data = buf;
>+	const char *fw_data_end = fw_data + count;
>+
>+	while (fw_data < fw_data_end) {
>+		int ret;
>+		size_t stride = min(fw_data_end - fw_data, SZ_4K);
>+
>+		rev_buf(fw_data, stride);

Can we make rev_buf() optional here? I've tested this driver with
Stratix-V FPGA using orion_spi driver. It works without swapping
the data.

Thanks,
Anatolij

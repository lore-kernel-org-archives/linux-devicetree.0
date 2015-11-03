From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Tue, 3 Nov 2015 09:20:00 +0100
Message-ID: <56386E30.4060905@i2se.com>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, manabian@gmail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, ezequiel@vanguardiasur.com.ar, galak@codeaurora.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Ariel,

Am 19.10.2015 um 19:32 schrieb Ariel D'Alessandro:
> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
> LPC185x/3x and LPC435x/3x/2x/1x devices.
>
> EEPROM size is 16384 bytes and it can be entirely read and
> written/erased with 1 word (4 bytes) granularity. The last page
> (128 bytes) contains the EEPROM initialization data and is not writable.
>
> Erase/program time is less than 3ms. The EEPROM device requires a
> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividing
> the system bus clock by the division factor, contained in the divider
> register (minus 1 encoded).
>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  drivers/nvmem/Kconfig          |   9 ++
>  drivers/nvmem/Makefile         |   2 +
>  drivers/nvmem/lpc18xx_eeprom.c | 266 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
> [...]
> +
> +static int lpc18xx_eeprom_gather_write(void *context, const void *reg,
> +				       size_t reg_size, const void *val,
> +				       size_t val_size)
> +{
> +	struct lpc18xx_eeprom_dev *eeprom = context;
> +	unsigned int offset = *(u32 *)reg;
> +
> +	/* 3 ms of erase/program time between each writing */
> +	while (val_size) {
> +		writel(*(u32 *)val, eeprom->mem_base + offset);
> +		usleep_range(3000, 4000);

i think it would be good to verify that the EEPROM write operation has
really finished.

Best regards
Stefan

> +		val_size -= eeprom->val_bytes;
> +		val += eeprom->val_bytes;
> +		offset += eeprom->val_bytes;
> +	}
> +
> +	return 0;
> +}

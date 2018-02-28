Return-Path: <SRS0=dTb0=FW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com> <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Feb 2018 12:17:32 +0100
Message-ID: <CAMuHMdWmaovpjuyzjYRRLBKk6g0WDeA8YHDCWwr94shpom0YNA@mail.gmail.com>
Subject: Re: [PATCHv4 2/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Trent Piepho <tpiepho@impinj.com>, Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Jassi,

On Tue, Feb 27, 2018 at 1:58 PM,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
>
> This patch adds support for controller found on synquacer platforms.
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/spi/spi-synquacer.c

> +static void read_fifo(struct synquacer_spi *sspi)
> +{
> +       u32 len = readl_relaxed(sspi->regs + DMSTATUS);
> +       int i;

unsigned int, as len is unsigned.

> +static void write_fifo(struct synquacer_spi *sspi)
> +{
> +       u32 len = readl_relaxed(sspi->regs + DMSTATUS);
> +       int i;

unsigned int, as len is unsigned.

> +static int synquacer_spi_config(struct spi_master *master,
> +                               struct spi_device *spi,
> +                               struct spi_transfer *xfer)
> +{
> +       struct synquacer_spi *sspi = spi_master_get_devdata(master);
> +       unsigned int speed, mode, bpw, cs, bus_width;
> +       unsigned long rate;

unsigned int, as max_speed_hz is u32, else you'll do a 64/32-bit division later.

> +static int synquacer_spi_transfer_one(struct spi_master *master,
> +                                     struct spi_device *spi,
> +                                     struct spi_transfer *xfer)
> +{
> +       struct synquacer_spi *sspi = spi_master_get_devdata(master);
> +       int ret, words, busy = 0;

unsigned int words, as xfr->len is unsigned.

> +       unsigned long bpw;

unsigned int is plenty (bits_per_word is even u8).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

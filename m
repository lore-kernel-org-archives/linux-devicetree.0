From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/12] of: add J-Core SPI master bindings
Date: Fri, 20 May 2016 10:05:02 +0200
Message-ID: <CAMuHMdV2FRhvRoP67WJNF5STyiQg5cvAEwTQBxsODjjhWwddLg@mail.gmail.com>
References: <cover.1463708766.git.dalias@libc.org>
	<32585cfb27d31e9d5cb399ecc4d8b89f4ec5e2cb.1463708766.git.dalias@libc.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32585cfb27d31e9d5cb399ecc4d8b89f4ec5e2cb.1463708766.git.dalias@libc.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 4:53 AM, Rich Felker <dalias@libc.org> wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/jcore,spi.txt
> @@ -0,0 +1,23 @@
> +Example:
> +
> +spi {

spi@40

> +       compatible = "jcore,spi2";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       reg = < 0x40 0x8 >;
> +       spi-max-frequency = <12500000>;
> +}

Gr{oetje,eeting}s,

                        Geert

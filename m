From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: Add driver for SPI serializers
Date: Wed, 10 Feb 2016 15:14:35 +0100
Message-ID: <CACRpkda26RVBzeOYv=pePpU3z=2Tb7jBO4vdpvd6DxegTQpqcg@mail.gmail.com>
References: <1453739851-31839-1-git-send-email-afd@ti.com>
	<1453739851-31839-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453739851-31839-3-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2016 at 5:37 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add generic parallel-in/serial-out shift register GPIO driver.
>
> This includes SPI compatible devices like SN74165 serial-out shift
> registers and the SN65HVS88x series of industrial serializers that can
> be read over the SPI bus and used for GPI (General Purpose Input).
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Patch applied, good work.

Yours,
Linus Walleij

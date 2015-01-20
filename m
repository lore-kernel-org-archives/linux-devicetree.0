From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/8] gpio-mm-lantiq: Use of_property_read_u32
Date: Tue, 20 Jan 2015 11:10:58 +0100
Message-ID: <CACRpkdZm7k+VCScU_Th_J5oA4gv_tCgRvvvC+9ZHLzxVbCogdQ@mail.gmail.com>
References: <20150119105753.GC21553@leverpostej>
	<1421666844-14599-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1421666844-14599-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 12:27 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Instead of parsing manually the shadow content, use the much simpler
> helper of_property_read_u32.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> v2: Reported by Mark Rutland <mark.rutland@arm.com>
>  -use of_property_read_u32 instead of u16

This v2 version applied.

Yours,
Linus Walleij

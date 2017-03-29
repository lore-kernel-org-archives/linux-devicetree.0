From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] XRA1403,gpio - add XRA1403 gpio expander driver
Date: Wed, 29 Mar 2017 03:50:41 +0200
Message-ID: <CACRpkdZ-wD5SwBNtSPceV-mwJiAAU_03obk3Gv97kz0MzX7RLw@mail.gmail.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1490595641.git.nandor.han@ge.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nandor Han <nandor.han@ge.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 8:22 AM, Nandor Han <nandor.han@ge.com> wrote:

> Testing:
>
> 1. XRA1403 connected to iMX53 MCU
> 2. Export gpio from userspace
> 3. Verify that corresponding gpio directories are created
>    in `/sys/class/gpio/gpioXX`
> 4. Export gpios from first and second bank as output
> 5. Set the output gpio pin to high/low and verify with the
>    oscilloscope that gpio status is according with the configured
>    value.

Do *NOT* use the sysfs for testing GPIO.
This is being phased out.

Use the tools in tools/gpio/* so that you exercise the
character device instead of the old deprecated ABI.

Yours,
Linus Walleij

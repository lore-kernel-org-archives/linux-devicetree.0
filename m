From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Documentation: gpio: guidelines for bindings
Date: Tue, 28 Oct 2014 10:08:45 +0100
Message-ID: <4048602.9BsHAsA6cq@wuerfel>
References: <1414470034-16143-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1414470034-16143-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 13:20:34 Alexandre Courbot wrote:
> +GPIO properties should be named "[<name>-]gpios", with <name> being the con_id
> +argument that is passed to gpiod_get(). While a NULL con_id is accepted by the
> +GPIO API for compatibility reasons (resolving to the "gpios" property), it is
> +not allowed for new bindings.
> +
> +GPIO properties can contain one or more GPIO phandles, but only in exceptional
> +cases should they contain more than one. If your device uses several GPIOs with
> +distinct functions, reference each of them under its own property, giving it a
> +meaningful name. The only case where an array of GPIOs is accepted is when
> +several GPIOs serve the same function (e.g. a parallel data line). In that case
> +individual GPIOs can be retrieved using gpiod_get_index().
> +
> +The exact meaning of each gpios property must be documented in the device tree
>  binding for each device.

The binding should be written in an OS neutral way, so it would be better to avoid
direct references to Linux APIs in the part that specifies the allowed properties.

Could you reword this so the Linux interfaces are described in an "implementation
notes" section that is separate from the main part?

	Arnd

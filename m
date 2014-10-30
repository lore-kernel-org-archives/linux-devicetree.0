From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] Documentation: gpio: guidelines for bindings
Date: Thu, 30 Oct 2014 16:42:45 +0100
Message-ID: <CACRpkda6GzoyKmx95u-exzrVrGfGfB8n-Z6iHWJ=mMQtgi4Wyg@mail.gmail.com>
References: <1414570394-11706-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414570394-11706-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 9:13 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Now that ACPI supports named GPIO properties, either through ACPI 5.1 or
> the per-driver ACPI GPIO mappings, we can be more narrow about the way
> GPIOs should be specified in Device Tree bindings.
>
> This patch updates the GPIO DT bindings documentation to highlight the
> following rules for new GPIO bindings:
>
> - All new bindings must have a meaningful name (e.g. the "gpios"
>   property must not be used)
> - The only suffix allowed is "-gpios", no matter the number of
>   descriptors in the property
> - GPIOs can only be grouped under the same property when they serve the
>   same purpose, a case that should remain exceptional (e.g. bit-banged
>   data lines).
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Rafael J. Wysocki <rjw@rjwysocki.net>
> CC: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes since v1:
> - Rewritten in OS-neutral manner.

Patch applied with the ACKs, thanks!

Yours,
Linus Walleij

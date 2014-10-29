From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] Documentation: gpio: guidelines for bindings
Date: Wed, 29 Oct 2014 10:56:52 +0200
Message-ID: <20141029085652.GK1304@lahna.fi.intel.com>
References: <1414570394-11706-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414570394-11706-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 05:13:14PM +0900, Alexandre Courbot wrote:
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

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

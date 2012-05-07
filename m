From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V1] regulator: fixed: dt: add property for gpio open drain
 flag
Date: Mon, 07 May 2012 09:05:07 -0600
Message-ID: <4FA7E4A3.6050004@wwwdotorg.org>
References: <1336386499-20408-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1336386499-20408-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, lrg@ti.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/07/2012 04:28 AM, Laxman Dewangan wrote:
> Add property for the gpio flag open drain when registering
> fixed regulator.

> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt ...

> +- gpio-open-drain: GPIO is open drain type.
> +  If this property is missing then default assumption is false.

Given that there's a GPIOF_OPEN_DRAIN, isn't the GPIO specifier in the
gpio property meant to encode this somehow (the format is up to the GPIO
controller's binding) - the flags are returned by of_get_named_gpio_flags().

(especially given you asked me off-list about updating the GPIO binding
documentation with information about the flags that Tegra's binding
documented for this)

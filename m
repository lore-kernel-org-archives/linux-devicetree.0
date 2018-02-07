From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 0/7] ARM: davinci: add genpd support
Date: Wed, 7 Feb 2018 16:43:50 -0600
Message-ID: <4dbc57ec-3506-eb1d-e00d-adfe75c3b39b@lechnology.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180207134553.13510-1-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 02/07/2018 07:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Hi Sekhar et al,
> 
> please take a look at the following patches. They add a simple genpd
> driver and use it in DT mode on da850 boards.
> 
> I was trying to use genpd in legacy mode too, but couldn't find neither
> any interfaces nor users that would do that. For now I added a check in
> arch/arm/mach-davinci/pm_domain.c that disables the clock pm setup if
> we're using genpd.
> 
> This series applies on top of and has been tested with David Lechner's
> for-bartosz branch. It fixes the clock look-up issues we faced with
> lcdc and emac.

I'm starting to think that it makes more sense to just make the PSC driver
a power-domain and reset provider rather than a clock provider. It is
unfortunate that genpd is DT only.

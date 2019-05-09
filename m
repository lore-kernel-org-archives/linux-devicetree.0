From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
Date: Thu, 09 May 2019 10:34:34 -0700
Message-ID: <7h36lnh6qd.fsf@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, linus.walleij@linaro.org
Cc: jbrunet@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so

Looks like you forgot to update the cover letter.

The new property in this series is actually named
"drive-strengh-micromap"

> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v3:
> - remove dev_err in meson_get_drive_strength
> - cleanup code

You didn't mention the property rename.

Kevin

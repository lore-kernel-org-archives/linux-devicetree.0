From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] pinctrl: meson: add g12a drive strength support
Date: Mon, 25 Mar 2019 10:44:00 +0100
Message-ID: <283b286671a65160ac8ae08b1e1889bc029db363.camel@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Go=C5=82aszewski=2C?= Bartosz <bgolaszewski@baylibre.com>Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-03-14 at 17:37 +0100, Jerome Brunet wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> Now the slightly annoying part :(
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> 
> 1) Rounding down the value, we could be requesting a 0mA drive strength.
>    That would look weird.
> 2) Rounding up, we can't distinguish between 2.5mA and 3mA
> 
> To solve this issue in this in this v1, we chose to document that, on Amlogic,
> drive-strength is expressed in uA instead of mA.
> It works well and there is no impact on the other platforms but I'm not sure this
> is really OK with the DT rules ?
> 
> Linus, if this is not OK with you, here are 2 other options we are
> considering. We would be very interested to get your opinion on the matter:
> 
> 1) instead the generic 'drive-strength' property, we could add an amlogic
> specific property, 'amlogic,drive-strength'. It would be expressed in uA
> and parsed in amlogic specific code.
> I think this option is kind of overkill. Expressing drive strength in uA is
> not really amlogic specific so it does not make much sense, but it would
> work ...
> 
> 2) Add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.

Hi Linus,

I know it has only been 10 days and you must be busy but I was wondering if we
could get your view on the issue above ?

Since the vast majority of SoC functions need a drive strength setting, DT
patches are somehow blocked until we decide which binding to use for it.

Sorry for this early ping.
Jerome


> 
> Cheers
> Jerome
> 
> Guillaume La Roque (2):
>   dt-bindings: pinctrl: meson: Add drive-strength property
>   pinctrl: meson: add support of drive-strength
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 166 +++++++++++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h         |  20 ++-
>  4 files changed, 165 insertions(+), 60 deletions(-)
> 

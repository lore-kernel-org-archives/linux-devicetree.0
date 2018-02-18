Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 16:49:08 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm-backlight: add a
 num-interpolation-steps property.
Message-ID: <20180218224908.x4s3usv345ywml75@rob-hp-laptop>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180208113032.27810-3-enric.balletbo@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 08, 2018 at 12:30:30PM +0100, Enric Balletbo i Serra wrote:
> The num-interpolated-steps property specifies the number of
> interpolated steps between each value of brightness-level table. This is
> useful for high resolution PWMs to not have to list out every possible
> value in the brightness-level array.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Changes since v2:
> - Add Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Changes since v1:
> - Add an example with a small but realistic curve. Suggested by Rob and
>   Daniel
> 
>  .../bindings/leds/backlight/pwm-backlight.txt         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: rockchip: Use interpolated brightness tables for veyron
Date: Thu, 10 Oct 2019 23:23:48 +0200
Message-ID: <3947291.Wl2KGcTfji@phil>
References: <20191003094137.v2.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003094137.v2.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. Oktober 2019, 18:41:52 CEST schrieb Matthias Kaehlcke:
> Use interpolated brightness tables (added by commit 573fe6d1c25
> ("backlight: pwm_bl: Linear interpolation between
> brightness-levels") for veyron, instead of specifying every single
> step. Some devices/panels have intervals that are smaller than
> the specified 'num-interpolated-steps', the driver interprets
> these intervals as a single step.
> 
> Another option would be to switch to a perceptual brightness curve
> (CIE 1931), with the caveat that it would change the behavior of
> the backlight. Also the concept of a minimum brightness level is
> currently not supported for CIE 1931 curves.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.5

Thanks
Heiko

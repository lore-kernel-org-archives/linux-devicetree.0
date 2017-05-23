From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 01/20] dt-bindings: i2c: eeprom: Document vendor to be
 used and deprecated ones
Date: Tue, 23 May 2017 10:30:35 -0500
Message-ID: <CAL_JsqKWfSrAOdJOCmNAe_PGkR1yntjTmO7q9wwA5W_NCcxmmw@mail.gmail.com>
References: <20170523133448.4794-1-javier@dowhile0.org> <20170523133448.4794-2-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170523133448.4794-2-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 8:34 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
>
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
>
> Document in the Device Tree binding document that this manufacturer should
> be used as the generic fallback. Also document the deprecated vendors.
>
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>
> ---
>
> Changes in v5:
> - Only deprecate the atmel variants at25 and at (Geert Uytterhoeven).
>
> Changes in v4:
> - Document the manufacturers that have been deprecated (Rob Herring).
>
> Changes in v3: None
> Changes in v2: None
>
>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

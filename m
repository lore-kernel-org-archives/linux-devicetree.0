From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] regulator: axp20x: Add support for the (external)
 drivebus regulator
Date: Mon, 6 Jun 2016 09:35:30 -0500
Message-ID: <20160606143530.GA21766@rob-hp-laptop>
References: <1464973184-17244-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464973184-17244-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 06:59:44PM +0200, Hans de Goede wrote:
> The axp20x pmics have 2 power inputs, one called ACIN which is intended
> for to be supplied via a powerbarrel on the board and one called VBUS
> which is intended to be supplied via an otg connector.
> 
> In the VBUS case the pmic needs to know if the board is supplying power
> to the otg connector, because then it should not take any power from
> its VBUS pin. The axp209 pmic has a N_VBUSEN input pin via which the
> board can signal to the pmic whether the board is supplying power to the
> otg connector or not.
> 
> On the axp221/axp223 this pin can alternatively be used as an output
> which controls an external regulator which (optionally) supplies
> power to the otg connector from the board. When the pin is used as
> output it is called DRIVEVBUS in the datasheet.
> 
> This commit adds support for the DRIVEVBUS pin as an extra pmic
> controlled regulator. Since this is optional a new x-powers,drivebus dt
> property is added. When this is present the misc-control register is
> written to change the N_VBUSEN input pin to DRIVEVBUS output pin mode and
> the extra drivebus regulator is registered with the regulator subsystem.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v2:
> -Set supply_name to just drivebus instead of drivevbus-supply
> -Fix some whitespace errors in the docs
> 
> Changes in v2:
> -Rename the dt property to drive-vbus-en
> -s/drivebus/drivevbus/
> -Add a line describing the drivevbus regulator to the table in
>  Documentation/devicetree/bindings/mfd/axp20x.txt
> -Set supply_name to drivevbus-supply
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt |  6 +++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/regulator/axp20x-regulator.c             | 30 ++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

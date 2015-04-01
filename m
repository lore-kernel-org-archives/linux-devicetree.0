From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: Add driver for Pistachio USB2.0 PHY
Date: Wed, 01 Apr 2015 13:38:48 -0700
Message-ID: <1427920728.31790.94.camel@perches.com>
References: <1427919394-3580-1-git-send-email-abrestic@chromium.org>
	 <1427919394-3580-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427919394-3580-3-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-01 at 13:16 -0700, Andrew Bresticker wrote:
> Add a driver for the USB2.0 PHY found on the IMG Pistachio SoC.

Spelling trivia:

> diff --git a/drivers/phy/phy-pistachio-usb.c b/drivers/phy/phy-pistachio-usb.c
[]
> +static int pistachio_usb_phy_power_on(struct phy *phy)
> +{
[]
> +	if (p_phy->refclk == REFCLK_XO_CRYSTAL && rate != 12000000) {
> +		dev_err(p_phy->dev, "Unspported rate for XO crystal: %ld\n",

typo

[]

> +	if (i == ARRAY_SIZE(fsel_rate_map)) {
> +		dev_err(p_phy->dev, "Unspported clock rate: %lu\n", rate);

here too


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

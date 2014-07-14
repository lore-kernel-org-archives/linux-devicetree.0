From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4] Input: Add driver for Microchip's CAP1106
Date: Mon, 14 Jul 2014 11:46:43 -0700
Message-ID: <20140714184642.GA38980@core.coreip.homeip.net>
References: <1405348082-24210-1-git-send-email-zonque@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405348082-24210-1-git-send-email-zonque@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Daniel Mack <zonque@gmail.com>
Cc: linux-input@vger.kernel.org, broonie@kernel.org, dh.herrmann@gmail.com, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 14, 2014 at 04:28:02PM +0200, Daniel Mack wrote:
> +
> +static int cap1106_i2c_remove(struct i2c_client *i2c_client)
> +{
> +	struct cap1106_priv *priv = i2c_get_clientdata(i2c_client);
> +
> +	input_unregister_device(priv->idev);
> +

No need to call unregister on managed input devices.

Otherwise if DT guys are happy with bindings I am happy with the patch.

Thanks.

-- 
Dmitry

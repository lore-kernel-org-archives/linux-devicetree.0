From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PING] [PATCH v5 1/7] nfc: pn533: i2c: "pn532" as dt compatible
 string
Date: Thu, 28 Feb 2019 11:48:01 +0100
Message-ID: <20190228104801.GA14788@lem-wkst-02.lemonage>
References: <20190111161812.26325-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111161812.26325-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

A gentle ping on this whole patch series.

Regards,
Lars

On Fri, Jan 11, 2019 at 05:18:04PM +0100, Lars Poeschel wrote:
> It is favourable to have one unified compatible string for devices that
> have multiple interfaces. So this adds simply "pn532" as the devicetree
> binding compatible string and makes a note that the old ones are
> deprecated.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
> Changes in v3:
> - This patch is new in v3
> 
>  drivers/nfc/pn533/i2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
> index 4389eb4c8d0b..f4eae9dd5305 100644
> --- a/drivers/nfc/pn533/i2c.c
> +++ b/drivers/nfc/pn533/i2c.c
> @@ -258,6 +258,11 @@ static int pn533_i2c_remove(struct i2c_client *client)
>  }
>  
>  static const struct of_device_id of_pn533_i2c_match[] = {
> +	{ .compatible = "nxp,pn532", },
> +	/*
> +	 * NOTE: The use of the compatibles with the trailing "...-i2c" is
> +	 * deprecated and will be removed.
> +	 */
>  	{ .compatible = "nxp,pn533-i2c", },
>  	{ .compatible = "nxp,pn532-i2c", },
>  	{},
> -- 
> 2.20.1
> 

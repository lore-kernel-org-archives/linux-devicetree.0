From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] adv7604: Add DT parsing support
Date: Thu, 23 Oct 2014 02:53:50 +0300
Message-ID: <1645583.LAOF2HV7Iq@avalon>
References: <1413992061-28678-1-git-send-email-jean-michel.hautbois@vodalys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413992061-28678-1-git-send-email-jean-michel.hautbois@vodalys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, wsa@the-dreams.de, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Wednesday 22 October 2014 17:34:21 Jean-Michel Hautbois wrote:
> This patch adds support for DT parsing of ADV7604 as well as ADV7611.
> It needs to be improved in order to get ports parsing too.

Let's improve it then :-) The DT bindings as proposed by this patch are 
incomplete, that's just asking for trouble.

How would you model the adv7604 ports ?

> Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7604.txt | 1 +
>  drivers/media/i2c/adv7604.c                             | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> b/Documentation/devicetree/bindings/media/i2c/adv7604.txt index
> c27cede..5c8b3e6 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> @@ -10,6 +10,7 @@ Required Properties:
> 
>    - compatible: Must contain one of the following
>      - "adi,adv7611" for the ADV7611
> +    - "adi,adv7604" for the ADV7604

Please switch the two lines to keep them alphabetically sorted.
> 
>    - reg: I2C slave address
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 47795ff..421035f 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -2677,6 +2677,7 @@ MODULE_DEVICE_TABLE(i2c, adv7604_i2c_id);
> 
>  static struct of_device_id adv7604_of_id[] __maybe_unused = {
>  	{ .compatible = "adi,adv7611", .data = &adv7604_chip_info[ADV7611] },
> +	{ .compatible = "adi,adv7604", .data = &adv7604_chip_info[ADV7604] },

Same comment here.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, adv7604_of_id);

-- 
Regards,

Laurent Pinchart

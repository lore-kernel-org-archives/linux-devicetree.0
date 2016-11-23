From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 1/5] ARM: memory: da8xx-ddrctl: new driver
Date: Wed, 23 Nov 2016 10:16:58 +0000
Message-ID: <60ae05f0-7719-f6c2-f725-97501f6fc219@arm.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-2-git-send-email-bgolaszewski@baylibre.com>
 <a309a738-7fa7-3aab-4457-f7d693e6b37f@ti.com> <5833A2DA.40701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5833A2DA.40701@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org



On 22/11/16 01:43, Frank Rowand wrote:
> Hi Sekhar,
>
> (And adding Sudeep since he becomes involved in this further
> down thread and at that point says he will re-work this
> proposed work around in a manner that is incorrect in a
> manner that is similar to this proposed work around.)
>
> On 11/21/16 08:33, Sekhar Nori wrote:


[...]

>>  static int da8xx_ddrctl_probe(struct platform_device *pdev)
>>  {
>>  	const struct da8xx_ddrctl_config_knob *knob;
>> @@ -118,7 +130,7 @@ static int da8xx_ddrctl_probe(struct platform_device *pdev)
>>  	setting = da8xx_ddrctl_get_board_settings();
>>  	if (!setting) {
>>  		dev_err(dev, "no settings for board '%s'\n",
>> -			of_flat_dt_get_machine_name());
>
> da8xx_ddrctl_get_board_settings() tries to match based on the "compatible"
> property in the root node.  The "model" property in the root node has
> nothing to do with the failure to match. So creating and then using
> da8xx_ddrctl_get_machine_name() to potentially report model is not useful.
>
> It should be sufficient to simply report that no compatible matched.
>

Agreed.

-- 
Regards,
Sudeep

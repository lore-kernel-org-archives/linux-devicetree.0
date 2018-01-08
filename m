From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 1/5] pinctrl: imx: use struct imx_pinctrl_soc_info as a
 const
Date: Mon, 08 Jan 2018 21:52:36 +0100
Message-ID: <f12aa7b7b3aea7a691a1acd14b8daa58@agner.ch>
References: <20180106142553.15322-1-stefan@agner.ch>
 <20180106142553.15322-2-stefan@agner.ch> <20180108164855.GA6504@t450s.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108164855.GA6504-gtbVdJvtf7D/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2018-01-08 17:48, Gary Bisson wrote:
> Hi Stefan,
> 
> On Sat, Jan 06, 2018 at 03:25:49PM +0100, Stefan Agner wrote:
>> For some SoCs the struct imx_pinctrl_soc_info is passed through
>> of_device_id.data which is const. Most variables are already const
>> or otherwise not written. However, some fields are modified at
>> runtime. Move those fields to the dynamically allocated struct
>> imx_pinctrl.
>>
>> Fixes: b3060044e495 ("pinctrl: freescale: imx7d: make of_device_ids const")
>> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
>> Cc: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> This is actually more or less a revert of a previous commit:
> b28742be4709 pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info

Hm, I see. However, back then imx_pinctrl_probe still consumed a
non-const struct imx_pinctrl_soc_info pointer. So this constifies all
the way through. 

> 
> Note that the idea for this commit was to get dt-overlays working and
> able to do pinctrl changes using configfs interface to load an overlay
> (using Pantelis patch). Not sure where we stand on loading such overlay
> from user-space, is it still something that will happen?

I am all for dt-overlays and actually also hope that it will make it
completely into mainline. So whatever prevents using device tree
overlays should be addressed.

It seems that ngroups is now part of struct pinctrl_dev (num_groups),
which is still writable. So we should be fine?

As far as I can tell all remaining properties come from the drivers
directly and should not be influenced by anything in the device tree....

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

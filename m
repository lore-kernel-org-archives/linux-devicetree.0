From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [RFC PATCH v3 1/5] dt: add of_get_child_count helper function
Date: Tue, 20 Dec 2011 15:58:43 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92EE2@HQMAIL01.nvidia.com>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-2-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1324402840-32451-2-git-send-email-b29396@freescale.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Dong Aisheng wrote at Tuesday, December 20, 2011 10:41 AM:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Currently most code to get child count in kernel are almost same,
> add a helper to implement this function for dt to use.

> diff --git a/include/linux/of.h b/include/linux/of.h

> +static inline int of_get_child_count(const struct device_node *np)
> +{
> +	return -ENOSYS;
> +}

Wouldn't it be better to return 0 here? -ENOSYS would be fine if the
function returned an error code, but it's really returning a count, and
other "dummy" functions that return data return 0/NULL already. This
would also allow you to just use the value directly in all cases rather
than having to check for a < 0 error case.

-- 
nvpublic

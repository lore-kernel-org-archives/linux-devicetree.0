From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/8] ARM: dts: keystone*: Use a single soc0 instance
Date: Fri, 15 Dec 2017 07:38:00 -0600
Message-ID: <1fce818d-f1a2-818d-7db8-d15a345f4c1e@ti.com>
References: <20171215132102.435-1-nm@ti.com> <20171215132102.435-3-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215132102.435-3-nm-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Crap.. couple of typos crept in. Apologies - Santosh, if you dont want 
to manualy change, I can rebase and repost if you like to any branch 
of your choice.

On 12/15/2017 07:20 AM, Nishanth Menon wrote:
> Provide and soc0 node and reference the same to simplify dts. This also
            ^^ - should have been a
> resolves the following warnings when built with W=1:
> arch/arm/boot/dts/keystone-k2hk-evm.dtb: Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
> arch/arm/boot/dts/keystone-k2l-evm.dtb: Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
> arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
> arch/arm/boot/dts/keystone-k2g-evm.dtb: Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
> arch/arm/boot/dts/keystone-k2g-ice.dtb: Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
> 
> NOTE: Though we can reformat files by reducing 1 level of indent due to
> the use of soc0 phandle, we ommit that change to prevent un-necessary
                               ^^ -> omit
> churn in code base.
> 
> Reported-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>


Apologies once again on my oversight.

-- 
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

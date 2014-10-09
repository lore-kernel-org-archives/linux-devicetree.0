From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH] reset: socfpga: use arch_initcall for early initialization
Date: Thu, 9 Oct 2014 08:16:18 -0500
Message-ID: <54368AA2.9000104@opensource.altera.com>
References: <1412822646-11257-1-git-send-email-dinguyen@opensource.altera.com> <1412845410.6809.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412845410.6809.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 10/9/14, 4:03 AM, Philipp Zabel wrote:
> Am Mittwoch, den 08.10.2014, 21:44 -0500 schrieb
> dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> There are certain drivers that are required to get loaded very early using
>> arch_initcall. An example of such a driver is the SOCFPGA's FPGA bridge driver.
>> This driver has to get loaded early because it needs to enable FPGA components
>> that are connected to the bridge.
>>
>> This FPGA bridge driver will using the reset controller API to toggle it's
>> reset bits, thus, it needs the reset driver to be loaded as early as possible
>> in order for it to get used properly.
> 
> Without knowing the details, this sounds like the wrong approach. Can't
> the bridge driver return -EPROBE_DEFER until the reset controller is
> available?
> 

The bridge driver is also using arch_initcall, as it also needs to get
loaded early for FPGA IPs to work, and so later driver loading will work
for the FPGA IPs.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

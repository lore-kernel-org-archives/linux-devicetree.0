From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v6 3/4] pmbus: add regulator support
Date: Thu, 16 Oct 2014 13:40:23 -0500
Message-ID: <alpine.DEB.2.02.1410161339450.28663@atx-linux-37>
References: <1413399310-19277-1-git-send-email-atull@opensource.altera.com> <1413399310-19277-4-git-send-email-atull@opensource.altera.com> <20141016183501.GA21253@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141016183501.GA21253-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: jdelvare-l3A5Bk7waGM@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Oct 2014, Guenter Roeck wrote:

> On Wed, Oct 15, 2014 at 01:55:09PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> > From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > 
> > Add support for simple on/off control of each channel.
> > 
> > To add regulator support, the pmbus part driver needs to add
> > regulator_desc information and number of regulators to its
> > pmbus_driver_info struct.
> > 
> > regulator_desc can be declared using default macro for a
> > regulator (PMBUS_REGULATOR) that is in pmbus.h
> > 
> > The regulator_init_data can be initialized from either
> > platform data or the device tree.
> > 
> > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> Hi Alan,
> 
> I am still seeing lots of the following:
> 
> vout0: Failed to create debugfs directory
> vout1: Failed to create debugfs directory
> vout2: Failed to create debugfs directory
> vout3: Failed to create debugfs directory
> vout4: Failed to create debugfs directory
> vout5: Failed to create debugfs directory
> vout6: Failed to create debugfs directory
> vout7: Failed to create debugfs directory
> 
> I thought there was a problem in the regulator core, but after looking
> into it concluded that the regulator core _should_ prepend the names
> with the device name when creating the debugfs entries, unless no device
> name is specified. So something must be missing. We'll need to sort
> this out before I can accept the code.
> 
> Thanks,
> Guenter
> 

Hi Guenter,

OK, I will look into it.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

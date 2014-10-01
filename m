From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] regulator support for pmbus and ltc2978
Date: Wed, 1 Oct 2014 13:07:43 -0700
Message-ID: <20141001200743.GA21388@roeck-us.net>
References: <1412190349-16343-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412190349-16343-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: jdelvare-l3A5Bk7waGM@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2014 at 02:05:46PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> This set of patches adds regulator support for pmbus_core.c and ltc2978.c
> 
> Each output has individual on/off control.
> 
> From PMBus_Specification_Part_II_Rev_1-3_20140318.pdf: 12.1.1. OPERATION
> Command Bit [7] Bit [7] controls whether the PMBus device output is on or off.
> If bit [7] is cleared (equals 0), then the output is off.  If bit [7] is set
> (equals 1), then the output is on.
> 
> Fixes in v4 are not huge: Add device tree bindings documentation for ltc2978.
> rename _pmbus_regulator_enable to _pmbus_regulator_on_off simplify
> _pmbus_regulator_on_off code s/regulator_regulator/regulator/ fix build break
> when !CONFIG_REGULATOR remove unused #define PB_OPERATION_CONTROL_SEQ_OFF fix
> a #endif comment simplify probe code, remove added switch statement remove
> BUG_ON(), add error message and fix num_regulators
> 
> Patch 1: document device tree bindings for ltc2978
> 
> Patch 2: add two helper functions for byte pmbus byte operations * byte write
> and byte read/modify/write
> 
> Patch 3: regulator support added in pmbus_core.c and pmbus.h * regulator_ops
> functions (is_enabled, enable, and disable) * gets regulator init data from
> device tree or platform data * registers the regulators * header has a macro
> for chip drivers to build their regulator_desc data
> 
> Patch 4: changes for ltc2978.c * Add Kconfig to enable/disable ltc2978
> regulator functionality * add regulator_desc and of_regulator_match info * use
> same structs for all parts; set num_regulators appropriately.
> 
Looks like this patch got lost. I did not get it, and I don't see it on lkml
either.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

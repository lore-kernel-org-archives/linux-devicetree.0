From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v18 4/6] fpga: add fpga bridge framework
Date: Fri, 15 Jul 2016 11:58:52 -0500
Message-ID: <CANk1AXRB8NorV_JQCZ0ZdqWj7fDqgeuE1cbvFxyQUz8ddwOJVg@mail.gmail.com>
References: <20160712193645.9098-1-atull@opensource.altera.com>
 <20160712193645.9098-5-atull@opensource.altera.com> <CAP=VYLpxK7qt25pmC2byYRm1zVbVrkf2f1+xctoSTSAy+n9QdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP=VYLpxK7qt25pmC2byYRm1zVbVrkf2f1+xctoSTSAy+n9QdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 14, 2016 at 3:54 PM, Paul Gortmaker
<paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> wrote:
> On Tue, Jul 12, 2016 at 3:36 PM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> This framework adds API functions for enabling/
>> disabling FPGA bridges under kernel control.
>>
>> This allows the Linux kernel to disable FPGA bridges
>> during FPGA reprogramming and to enable FPGA bridges
>> when FPGA reprogramming is done.  This framework is
>> be manufacturer-agnostic, allowing it to be used in
>> interfaces that use the FPGA Manager Framework to
>> reprogram FPGA's.
>>
>> The functions are:
>> * of_fpga_bridge_get
>> * fpga_bridge_put
>>    Get/put an exclusive reference to a FPGA bridge.
>>
>> * fpga_bridge_enable
>> * fpga_bridge_disable
>>    Enable/Disable traffic through a bridge.
>>
>> * fpga_bridge_register
>> * fpga_bridge_unregister
>>    Register/unregister a device-specific low level FPGA
>>    Bridge driver.
>>
>> Get an exclusive reference to a bridge and add it to a list:
>> * fpga_bridge_get_to_list
>>
>> To enable/disable/put a set of bridges that are on a list:
>> * fpga_bridges_enable
>> * fpga_bridges_disable
>> * fpga_bridges_put
>>
>> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>> v2:  Minor cleanup
>> v12: Bump version to line up with simple fpga bus
>>      Remove sysfs
>>      Improve get/put functions, get the low level driver too.
>>      Clean up class implementation
>>      Add kernel doc documentation
>>      Rename (un)register_fpga_bridge -> fpga_bridge_(un)register
>> v13: Add inlined empty functions for if not CONFIG_FPGA_BRIDGE
>>      Clean up debugging
>>      Remove unneeded #include in .h
>>      Remove unnecessary prints
>>      Remove 'label' DT binding.
>>      Document the mutex
>> v14: Allow bridges with no ops
>>      *const* struct fpga_bridge_ops
>>      Add functions to git/put/enable/disable list of bridges
>>      Add list node to struct fpga_bridge
>>      Do of_node_get/put in of_fpga_bridge_get()
>>      Add r/o attributes: name and state
>> v15: No change in this patch for v15 of this patch set
>> v16: Remove of_get_fpga_bus function
>> v17: No change to this patch in v17 of patch set
>> v18: No change to this patch in v18 of patch set
>> ---
>>  drivers/fpga/Kconfig             |   7 +
>>  drivers/fpga/Makefile            |   3 +
>>  drivers/fpga/fpga-bridge.c       | 388 +++++++++++++++++++++++++++++++++++++++
>>  include/linux/fpga/fpga-bridge.h |  55 ++++++
>>  4 files changed, 453 insertions(+)
>>  create mode 100644 drivers/fpga/fpga-bridge.c
>>  create mode 100644 include/linux/fpga/fpga-bridge.h
>>
>> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
>> index d614102..46e20af 100644
>> --- a/drivers/fpga/Kconfig
>> +++ b/drivers/fpga/Kconfig
>> @@ -25,6 +25,13 @@ config FPGA_MGR_ZYNQ_FPGA
>>         help
>>           FPGA manager driver support for Xilinx Zynq FPGAs.
>>
>> +config FPGA_BRIDGE
>> +       bool "FPGA Bridge Framework"
>
> Same here. A bool Kconfig but module.h etc. used in the driver.
>
> Either make the code modular with a tristate if there is a valid
> use case for that, or get rid of the modular references.

Yes, of course.  Thanks!

Alan Tull

>
> Thanks,
> Paul.
> --
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

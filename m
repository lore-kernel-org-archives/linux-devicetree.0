From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] of: unittest: Disable interrupt node tests for old world
 MAC systems
Date: Tue, 25 Sep 2018 19:59:51 -0700
Message-ID: <1bfac4f9-e666-1c48-6846-3ff4474e09f2@roeck-us.net>
References: <1537896763-6160-1-git-send-email-linux@roeck-us.net>
 <d8cec9b3-0250-590d-c8a0-e91c2f0e4325@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8cec9b3-0250-590d-c8a0-e91c2f0e4325@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/25/2018 07:49 PM, Frank Rowand wrote:
> Hi Guenter,
> 
> Moving in the right direction, but some comments below.
> 
> 
> On 09/25/18 10:32, Guenter Roeck wrote:
>> On systems with OF_IMAP_OLDWORLD_MAC set in of_irq_workarounds, the
>> devicetree interrupt parsing code is different, causing unit tests of
>> devicetree interrupt nodes to fail. Due to a bug in unittest code, which
>> tries to dereference an uninitialized pointer, this results in a crash.
>>
>> OF: /testcase-data/phandle-tests/consumer-a: arguments longer than property
>> Unable to handle kernel paging request for data at address 0x00bc616e
>> Faulting instruction address: 0xc08e9468
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> BE PREEMPT PowerMac
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.72-rc1-yocto-standard+ #1
>> task: cf8e0000 task.stack: cf8da000
>> NIP:  c08e9468 LR: c08ea5bc CTR: c08ea5ac
>> REGS: cf8dbb50 TRAP: 0300   Not tainted  (4.14.72-rc1-yocto-standard+)
>> MSR:  00001032 <ME,IR,DR,RI>  CR: 82004044  XER: 00000000
>> DAR: 00bc616e DSISR: 40000000
>> GPR00: c08ea5bc cf8dbc00 cf8e0000 c13ca517 c13ca517 c13ca8a0 00000066 00000002
>> GPR08: 00000063 00bc614e c0b05865 000affff 82004048 00000000 c00047f0 00000000
>> GPR16: c0a80000 c0a9cc34 c13ca517 c0ad1134 05ffffff 000affff c0b05860 c0abeef8
>> GPR24: cecec278 cecec278 c0a8c4d0 c0a885e0 c13ca8a0 05ffffff c13ca8a0 c13ca517
>>
>> NIP [c08e9468] device_node_gen_full_name+0x30/0x15c
>> LR [c08ea5bc] device_node_string+0x190/0x3c8
>> Call Trace:
>> [cf8dbc00] [c007f670] trace_hardirqs_on_caller+0x118/0x1fc (unreliable)
>> [cf8dbc40] [c08ea5bc] device_node_string+0x190/0x3c8
>> [cf8dbcb0] [c08eb794] pointer+0x25c/0x4d0
>> [cf8dbd00] [c08ebcbc] vsnprintf+0x2b4/0x5ec
>> [cf8dbd60] [c08ec00c] vscnprintf+0x18/0x48
>> [cf8dbd70] [c008e268] vprintk_store+0x4c/0x22c
>> [cf8dbda0] [c008ecac] vprintk_emit+0x94/0x130
>> [cf8dbdd0] [c008ff54] printk+0x5c/0x6c
>> [cf8dbe10] [c0b8ddd4] of_unittest+0x2220/0x26f8
>> [cf8dbea0] [c0004434] do_one_initcall+0x4c/0x184
>> [cf8dbf00] [c0b4534c] kernel_init_freeable+0x13c/0x1d8
>> [cf8dbf30] [c0004814] kernel_init+0x24/0x118
>> [cf8dbf40] [c0013398] ret_from_kernel_thread+0x5c/0x64
>>
>> The problem was observed when running a qemu test for the g3beige machine
>> with devicetree unittests enabled.
>>
>> Disable interrupt node tests on affected systems to avoid both false
>> unittest failures and the crash.
>>
>> Fixes: 53a42093d96ef ("of: Add device tree selftests")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> The changes in of_unittest_platform_populate() are kept at the minimum;
>> I wanted to avoid changing the intendation.
>> An alternative fix might be to move the interrupt tests to a separate
>> function.
>>
>>   drivers/of/unittest.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index 722537e14848..bd1d56cf1962 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
> 
> The previous patch had fixes for of_unittest_parse_phandle_with_args() and
> of_unittest_parse_phandle_with_args_map().  Do those two functions need to
> have the test for OF_IMAP_OLDWORLD_MAC and return that this patch adds to
> the other functions?
> 

No. The reason for adding those locations was that they accessed args.np
after an error. As mentioned before, the primary idea of the original patch
was to address the problem of accessing args.np, not to address the
unnecessarily failing test. Sorry for the confusion.

> 
>> @@ -771,6 +771,9 @@ static void __init of_unittest_parse_interrupts(void)
>>   	struct of_phandle_args args;
>>   	int i, rc;
>>   
>> +	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
>> +		return;
>> +
>>   	np = of_find_node_by_path("/testcase-data/interrupts/interrupts0");
>>   	if (!np) {
>>   		pr_err("missing testcase data\n");
>> @@ -845,6 +848,9 @@ static void __init of_unittest_parse_interrupts_extended(void)
>>   	struct of_phandle_args args;
>>   	int i, rc;
>>   
>> +	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
>> +		return;
>> +
>>   	np = of_find_node_by_path("/testcase-data/interrupts/interrupts-extended0");
>>   	if (!np) {
>>   		pr_err("missing testcase data\n");
>> @@ -1001,6 +1007,9 @@ static void __init of_unittest_platform_populate(void)
>>   	pdev = of_find_device_by_node(np);
>>   	unittest(pdev, "device 1 creation failed\n");
>>   
>> +	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
>> +		goto skip_irqtests;
>> +
> 
> This does not follow the normal use of goto.  Just put the skipped over code
> into an indented if block.
> 
> The code being skipped over already has some unittest() lines that are over
> 80 characters, and the indentation will make them worse.  Please clean up those
> unittest() lines up when you add the indentation.
> 
Sure, NP.

Thanks,
Guenter

> -Frank
> 
>>   	irq = platform_get_irq(pdev, 0);
>>   	unittest(irq == -EPROBE_DEFER, "device deferred probe failed - %d\n", irq);
>>   
>> @@ -1011,6 +1020,7 @@ static void __init of_unittest_platform_populate(void)
>>   	irq = platform_get_irq(pdev, 0);
>>   	unittest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
>>   
>> +skip_irqtests:
>>   	np = of_find_node_by_path("/testcase-data/platform-tests");
>>   	unittest(np, "No testcase data in device tree\n");
>>   	if (!np)
>>
> 
> 

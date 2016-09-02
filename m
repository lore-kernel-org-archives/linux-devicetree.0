From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 1/3] misc: Add Aspeed BT IPMI host driver
Date: Fri, 2 Sep 2016 15:22:50 +0200
Message-ID: <c06a8afb-9143-6aef-3425-ad1e50cae35d@kaod.org>
References: <1472664259-23933-1-git-send-email-clg@kaod.org>
 <1472664259-23933-2-git-send-email-clg@kaod.org> <8157811.GypLEN0R9B@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8157811.GypLEN0R9B@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hello,

Adding Corey in cc: . I guess I should have done that in the first place.

Arnd is suggesting to put this IPMI BT driver under drivers/char/ipmi =

which is indeed a better place than drivers/misc. =


Below some comments,

On 08/31/2016 09:57 PM, Arnd Bergmann wrote:
> On Wednesday, August 31, 2016 7:24:17 PM CEST C=E9dric Le Goater wrote:
>> From: Alistair Popple <alistair@popple.id.au>
>>
>> This patch adds a simple device driver to expose the iBT interface on
>> Aspeed chips as a character device (/dev/bt).
>>
>> The iBT interface is used to perform in-band IPMI communication from a
>> BMC to the host.
>>
>> Signed-off-by: Alistair Popple <alistair@popple.id.au>
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [clg: checkpatch fixes
>>       devicetree binding documentation]
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>> ---
>>  .../devicetree/bindings/misc/aspeed,bt-host.txt    |  19 +
>>  drivers/misc/Kconfig                               |   5 +
>>  drivers/misc/Makefile                              |   1 +
>>  drivers/misc/bt-host.c                             | 433 ++++++++++++++=
+++++++
>>  include/uapi/linux/Kbuild                          |   1 +
>>  include/uapi/linux/bt-host.h                       |  18 +
>>  6 files changed, 477 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,bt-hos=
t.txt
>>  create mode 100644 drivers/misc/bt-host.c
>>  create mode 100644 include/uapi/linux/bt-host.h
>>
>> diff --git a/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt b=
/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt
>> new file mode 100644
>> index 000000000000..938c5998c331
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/aspeed,bt-host.txt
> =

> "misc" seems like a bad category here. Does this fit nowhere else?
> =

>> @@ -0,0 +1,19 @@
>> +* Aspeed BT IPMI interface
> =

> What does "BT" stand for? IPMI is a more commonly known acronym,
> but maybe list both with their full name as well.

"Block Transfer" which is described in the IPMI specs. =


yes, I need to rephrase the commit log a bit and put some references =

to the specs.

> =

>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 7410c6d9a34d..71a7b9feb0f0 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -57,6 +57,7 @@ obj-$(CONFIG_ECHO)		+=3D echo/
>>  obj-$(CONFIG_VEXPRESS_SYSCFG)	+=3D vexpress-syscfg.o
>>  obj-$(CONFIG_CXL_BASE)		+=3D cxl/
>>  obj-$(CONFIG_PANEL)             +=3D panel.o
>> +obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+=3D bt-host.o
>>  =

>>  lkdtm-$(CONFIG_LKDTM)		+=3D lkdtm_core.o
>>  lkdtm-$(CONFIG_LKDTM)		+=3D lkdtm_bugs.o
> =

> Maybe put this in a subdirectory of drivers/char/ipmi?
> I understand that this is the other end of the protocol,
> but they are closely related after all.

I agree. There are also some definitions we could make common.

Let's see what Corey thinks about it.

>> +#define DEVICE_NAME	"bt-host"
> =

> here maybe "ipmi/bt-host" or "ipmi-bt-host"?

yes. a name containing 'ipmi' is certainly wanted.
  =

>> +static ssize_t bt_host_read(struct file *file, char __user *buf,
>> +				size_t count, loff_t *ppos)
>> +{
>> +	struct bt_host *bt_host =3D file_bt_host(file);
>> +	char __user *p =3D buf;
>> +	u8 len;
>> +
>> +	if (!access_ok(VERIFY_WRITE, buf, count))
>> +		return -EFAULT;
>> +
>> +	WARN_ON(*ppos);
>> +
>> +	if (wait_event_interruptible(bt_host->queue,
>> +				bt_inb(bt_host, BT_CTRL) & BT_CTRL_H2B_ATN))
>> +		return -ERESTARTSYS;
>> +
>> +	set_b_busy(bt_host);
>> +	clr_h2b_atn(bt_host);
>> +	clr_rd_ptr(bt_host);
>> +
>> +	len =3D bt_read(bt_host);
>> +	__put_user(len, p++);
>> +
>> +	/* We pass the length back as well */
>> +	if (len + 1 > count)
>> +		len =3D count - 1;
>> +
>> +	while (len) {
>> +		if (__put_user(bt_read(bt_host), p))
>> +			return -EFAULT;
>> +		len--; p++;
>> +	}
> =

> If there are larger chunks of data to be transferred,
> using a temporary buffer with copy_from_user/copy_to_user
> would be more efficient. Since the size appears to
> be limited to 256 bytes anyway, that easily fits on the stack.

ok. I will change that.

>> +
>> +	clr_b_busy(bt_host);
>> +
>> +	return p - buf;
>> +}
> =

> What is the motivation for only allowing complete messages
> to be transferred or truncated for short buffers?
> =

> Have you considered reading the message into a device specific
> buffer and allowing continued reads?
> =

> I don't see an obvious reason one way or another, and I suppose
> you had an idea of what you were doing, so maybe explain it
> in a comment.

The interface is not byte oriented. It is called 'Block Transfer'
because an entire message is buffered and then the host or the bmc
is notified that there is data to be read.  =


I will add a comment on that.

>> +static long bt_host_ioctl(struct file *file, unsigned int cmd,
>> +		unsigned long param)
>> +{
>> +	struct bt_host *bt_host =3D file_bt_host(file);
>> +
>> +	switch (cmd) {
>> +	case BT_HOST_IOCTL_SMS_ATN:
>> +		set_sms_atn(bt_host);
>> +		return 0;
>> +	}
>> +	return -EINVAL;
>> +}
> =

> Is this ioctl interface defined in a way that makes sense on
> any IPMI host hardware, or did you just do it like this because =

> it is the easiest way  on the hardware. =


This platform runs OpenBMC on which a dbus daemon acts as a proxy =

between the IPMI BT char device and the rest of the system. So yes, =

the ioctl is relatively easy to use. =


> I think it's important for the user interface to be extensible =

> to other implementations if we ever add any.

I agree but I don't know of any other BMC side implementations. =

May be others ? =


>> +static int bt_host_config_irq(struct bt_host *bt_host,
>> +		struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	uint32_t reg;
>> +	int rc;
>> +
>> +	bt_host->irq =3D irq_of_parse_and_map(dev->of_node, 0);
>> +	if (!bt_host->irq)
>> +		return -ENODEV;
> =

> I think platform_get_irq() is the preferred interface here.

OK.

Thanks,

C.

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI bus
 driver core
Date: Wed, 21 Feb 2018 14:03:37 -0800
Message-ID: <6c67978c-9283-6c8d-95b4-9900b3b9a810@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180221170434.GF29204@lunn.ch>
 <650488e8-8516-1329-b35b-88d628d21cc2@linux.intel.com>
 <20180221215133.GA9056@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221215133.GA9056@lunn.ch>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 2/21/2018 1:51 PM, Andrew Lunn wrote:
>>> Is there a real need to do transfers in atomic context, or with
>>> interrupts disabled?
>>>
>>
>> Actually, no. Generally, this function will be called in sleep-able context
>> so this code is for an exceptional case handling.
>>
>> I'll rewrite this code like below:
>> 	if (in_atomic() || irqs_disabled()) {
>> 		dev_dbg(&adapter->dev,
>> 			"xfer in non-sleepable context is not supported\n");
>> 		return -EWOULDBLOCK;
>> 	}
> 
> I would not even do that. Just add a call to
> might_sleep(). CONFIG_DEBUG_ATOMIC_SLEEP will then find bad calls.
> 

Thanks for the suggestion. I've learned one thing. :)

>>>> +static int peci_ioctl_get_temp(struct peci_adapter *adapter, void *vmsg)
>>>> +{
>>>> +	struct peci_get_temp_msg *umsg = vmsg;
>>>> +	struct peci_xfer_msg msg;
>>>> +	int rc;
>>>> +
>>>
>>> Is this getting the temperature?
>>>
>>
>> Yes, this is getting the 'die' temperature of a processor package.
>   
> So the hwmon driver provides this. No need to have both.
> 

This this common API in core driver of PECI bus. The hwmon is also uses 
it through peci_command call.

>>>> +static long peci_ioctl(struct file *file, unsigned int iocmd, unsigned long arg)
>>>> +{
>>>> +	struct peci_adapter *adapter = file->private_data;
>>>> +	void __user *argp = (void __user *)arg;
>>>> +	unsigned int msg_len;
>>>> +	enum peci_cmd cmd;
>>>> +	u8 *msg;
>>>> +	int rc = 0;
>>>> +
>>>> +	dev_dbg(&adapter->dev, "ioctl, cmd=0x%x, arg=0x%lx\n", iocmd, arg);
>>>> +
>>>> +	switch (iocmd) {
>>>> +	case PECI_IOC_PING:
>>>> +	case PECI_IOC_GET_DIB:
>>>> +	case PECI_IOC_GET_TEMP:
>>>> +	case PECI_IOC_RD_PKG_CFG:
>>>> +	case PECI_IOC_WR_PKG_CFG:
>>>> +	case PECI_IOC_RD_IA_MSR:
>>>> +	case PECI_IOC_RD_PCI_CFG:
>>>> +	case PECI_IOC_RD_PCI_CFG_LOCAL:
>>>> +	case PECI_IOC_WR_PCI_CFG_LOCAL:
>>>> +		cmd = _IOC_TYPE(iocmd) - PECI_IOC_BASE;
>>>> +		msg_len = _IOC_SIZE(iocmd);
>>>> +		break;
>>>
>>> Adding new ioctl calls is pretty frowned up. Can you export this info
>>> via /sysfs?
>>>
>>
>> Most of these are not simple IOs so ioctl is better suited, I think.
> 
> Lets see what other reviewers say, but i think ioctls are
> wrong.
> 
>       Andrew
> 

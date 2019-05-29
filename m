From: Richard Gong <richard.gong@linux.intel.com>
Subject: Re: [PATCHv4 2/4] firmware: add Intel Stratix10 remote system update
 driver
Date: Wed, 29 May 2019 09:55:32 -0500
Message-ID: <1e3b5447-b776-f929-bca6-306f90ac0856@linux.intel.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
 <20190528232224.GA29225@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528232224.GA29225@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org


Hi Greg,

On 5/28/19 6:22 PM, Greg KH wrote:
> On Tue, May 28, 2019 at 03:20:31PM -0500, richard.gong@linux.intel.com wrote:
>> +/**
>> + * rsu_send_msg() - send a message to Intel service layer
>> + * @priv: pointer to rsu private data
>> + * @command: RSU status or update command
>> + * @arg: the request argument, the bitstream address or notify status
>> + * @callback: function pointer for the callback (status or update)
>> + *
>> + * Start an Intel service layer transaction to perform the SMC call that
>> + * is necessary to get RSU boot log or set the address of bitstream to
>> + * boot after reboot.
>> + *
>> + * Returns 0 on success or -ETIMEDOUT on error.
>> + */
>> +static int rsu_send_msg(struct stratix10_rsu_priv *priv,
>> +			enum stratix10_svc_command_code command,
>> +	unsigned long arg,
>> +	void (*callback)(struct stratix10_svc_client *client,
>> +			 struct stratix10_svc_cb_data *data))
>> +{
>> +	struct stratix10_svc_client_msg msg;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->lock);
>> +	reinit_completion(&priv->completion);
>> +	priv->client.receive_cb = callback;
>> +
>> +	msg.command = command;
>> +	if (arg)
>> +		msg.arg[0] = arg;
>> +
>> +	ret = stratix10_svc_send(priv->chan, &msg);
> 
> meta-question, can you send messages that are on the stack and not in
> DMA-able memory?  Or should this be a dynamicly created variable so you
> know it can work properly with DMA?
> 
> And how big is that structure, will it mess with stack sizes?
> 

stratix10_svc_send() is a function from Intel Stratix10 service layer 
driver, which is used by service clients (RSU and FPGA manager drivers 
as now) to add a message to the service layer driver's queue for being 
sent to the secure world via SMC call.

It is not DMA related, we send messages via FIFO API.

The size of FIFO is sizeof(struct stratix10_svc_data) * 
SVC_NUM_DATA_IN_FIFO, SVC_NUM_DATA_IN_FIFO is defined as 32.

fifo_size = sizeof(struct stratix10_svc_data) * 	SVC_NUM_DATA_IN_FIFO;
ret = kfifo_alloc(&controller->svc_fifo, fifo_size, GFP_KERNEL);
if (ret) {
	dev_err(dev, "failed to allocate FIFO\n");
         return ret;
}
spin_lock_init(&controller->svc_fifo_lock);

It will not mess with stack sizes.

> thanks,
> 
> greg k-h
> 

Regards,
Richard

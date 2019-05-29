From: Richard Gong <richard.gong@linux.intel.com>
Subject: Re: [PATCHv4 2/4] firmware: add Intel Stratix10 remote system update
 driver
Date: Wed, 29 May 2019 10:12:22 -0500
Message-ID: <ac379a9a-9613-3f66-78ff-a38c0045764d@linux.intel.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
 <20190528232400.GB29225@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528232400.GB29225@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org


Hi Greg,

On 5/28/19 6:24 PM, Greg KH wrote:
> On Tue, May 28, 2019 at 03:20:31PM -0500, richard.gong@linux.intel.com wrote:
>> +static int rsu_send_msg(struct stratix10_rsu_priv *priv,
>> +			enum stratix10_svc_command_code command,
>> +	unsigned long arg,
>> +	void (*callback)(struct stratix10_svc_client *client,
>> +			 struct stratix10_svc_cb_data *data))
> 
> Odd indentation for arg, and then callback.
> 
> Why isn't callback a typedef to make this simpler to use?
> 

I will make correction in the next submission.

> thanks,
> 
> greg k-h
> 

Regards,
Richard

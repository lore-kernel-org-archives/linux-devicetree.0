From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 3/5] misc: fastrpc: Add support for context Invoke
 method
Date: Fri, 8 Feb 2019 14:26:32 +0000
Message-ID: <32aac00f-39f5-34a7-e1e3-a0eef62daa3f@linaro.org>
References: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
 <20190208132306.12571-4-srinivas.kandagatla@linaro.org>
 <20190208135514.GA23406@kroah.com>
 <b60a0c35-6e5a-4166-9dd8-3891fce1cd0b@linaro.org>
 <20190208141120.GA9516@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208141120.GA9516@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>
List-Id: devicetree@vger.kernel.org



On 08/02/2019 14:11, Greg KH wrote:
>> On 08/02/2019 13:55, Greg KH wrote:
>>>> +
>>>> +		/* Make sure reserved field is set to 0 */
>>>> +		if (args->reserved) {
>>>> +			kfree(args);
>>>> +			return -EINVAL;
>>> Am I wrong in that you are only checking the first reserved field in
>>> this array of args?  Don't you have a whole bunch of them here (nscalars
>>> of them)?  Don't you need to check them all and not just the first one?
>> My Bad, there should be a loop here!
>> I will fix this in next version!
> No, you don't need to loop it here, check it in the call that evaluates
> the individual args, which will catch the issue when people send
> "internal" commands.
> 
Yes, that makes more sense. We can avoid a loop here and do the check in 
  fastrpc_get_args().

> Which reminds me, what happens if a sequence has problems half way
> through the list of args?  Do you "roll back" to the beginning, or just
> abort?  What happens to the internal device state then?

We should abort the invoke if this check fails.

All the arguments are passed in a single invoke call to dsp, so if the 
sanity fails we should not even attempt to send it to dsp.

fastrpc_context_put in fastrpc_internal_invoke() should take care of any 
mappings created half way thru this checks.

--srini

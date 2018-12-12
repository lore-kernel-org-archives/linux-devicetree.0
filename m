From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/6] misc: fastrpc: Add support for context Invoke
 method
Date: Wed, 12 Dec 2018 11:14:43 +0000
Message-ID: <224ec2f3-7f48-63c3-5e13-27e01fe53e1b@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-4-srinivas.kandagatla@linaro.org>
 <20181212110234.GB1990@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212110234.GB1990@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org



On 12/12/18 11:02, Greg KH wrote:
> On Fri, Dec 07, 2018 at 04:35:10PM +0000, Srinivas Kandagatla wrote:
>> +#define FASTRPC_BUILD_SCALARS(attr, method, in, out, oin, oout) \
>> +		((((uint32_t)  (attr) & 0x07) << 29) | \
>> +		(((uint32_t) (method) & 0x1f) << 24) | \
> 
> Why all of the uint32_t and uint64_t types in this patch, but not the
> previous one?
> 
> Please just stick with u32 and u64, those are the correct kernel types
> to be using everywhere.  uint32_t and friends are userspace things that
> make no sense in kernel space.
> 
> Yes, I know people use them, but we should not be adding to the problem
> by creating new instances of them for no good reason.

Thanks for the feedback, Sure I will revisit and cleanup such instances!

--srini
> 
> thanks,
> 
> greg k-h
> 

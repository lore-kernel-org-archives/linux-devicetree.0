From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/4] mailbox: mailbox-test: support single channel with
 separate Tx and Rx buffer
Date: Fri, 12 Feb 2016 09:41:55 +0000
Message-ID: <56BDA8E3.8060800@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <20160212091718.GT20693@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160212091718.GT20693@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/02/16 09:17, Lee Jones wrote:
> On Thu, 11 Feb 2016, Sudeep Holla wrote:
>
>> Hi Lee, Jassi,
>>
>> Assuming mailbox-test was designed to be generic, I am trying to extend
>> it to support single channel with separate Tx and Rx buffer. With these
>> changes I am able to test arm_mhu driver. However I couldn't understand
>> the intention of converting buffer to ASCII hex dump in read method.
>> I have a local change to remove that so that it can deal with any data
>> in any format(e.g. some protocol format)
>
> Not sure quite what you mean.  Hexdump can handle any data?  If the
> hex value read isn't an ASCII value, a '.' is printed on the right
> hand side.  What data are you expecting that you can't analyse with
> hexdump?
>

Sorry for not being clear. Hexdump can handle any data. I do see that
it displays quite nicely at the driver level which is nice.

However my question was why is the the buffer copied to user space is
not the original raw data, rather it's ASCII converted which is good for
nice logging.

One of the use-case the testing guys wants is the check the protocol
specification using this. In their case they expect the test driver to
send the raw data as is from the driver rather than the converted ASCII
buffer. I tend to agree with them for 2 reasons:

1. userspace can do the conversion if required
2. the input buffer is not converted(i.e. in the write path), so it's
    bit of inconsistent there.

-- 
Regards,
Sudeep

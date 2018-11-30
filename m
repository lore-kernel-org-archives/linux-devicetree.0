From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 3/6] char: fastrpc: Add support for context Invoke
 method
Date: Fri, 30 Nov 2018 16:40:01 +0000
Message-ID: <35bfe1db-ae9c-4858-c1a3-12a0306bfa3a@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-4-srinivas.kandagatla@linaro.org>
 <CAK8P3a1mFWJyXCn74_Yd_y3Df0JN=qM4nw4-2t_LjRO7yXmXBw@mail.gmail.com>
 <3c177508-cf6f-1f8d-a324-5bec40fd9a9c@linaro.org>
 <CAK8P3a0d=VRP+9vZm+eJeJM933PWYL4sruMAYBYzWjg5B_kL2g@mail.gmail.com>
 <633cb111-f5d7-3648-54af-a476f3cbb279@linaro.org>
 <CAK8P3a1JSyxjuH2Xez-K3SFV20f-FJnzZHdNR1o41VrNNZkUPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1JSyxjuH2Xez-K3SFV20f-FJnzZHdNR1o41VrNNZkUPQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org



On 30/11/18 16:19, Arnd Bergmann wrote:
> On Fri, Nov 30, 2018 at 5:03 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>> On 30/11/18 15:08, Arnd Bergmann wrote:
>>> On Fri, Nov 30, 2018 at 4:01 PM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>> Thanks Arnd for the review comments!
>>>> On 30/11/18 13:41, Arnd Bergmann wrote:
>>>>> On Fri, Nov 30, 2018 at 11:48 AM Srinivas Kandagatla
>>>>> <srinivas.kandagatla@linaro.org> wrote:
>>>
>>>>>> +static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>>>>> +                                unsigned long arg)
>>>>>> +{
>>>>>> +       struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
>>>>>> +       struct fastrpc_channel_ctx *cctx = fl->cctx;
>>>>>> +       char __user *argp = (char __user *)arg;
>>>>>> +       int err;
>>>>>> +
>>>>>> +       if (!fl->sctx) {
>>>>>> +               fl->sctx = fastrpc_session_alloc(cctx, 0);
>>>>>> +               if (!fl->sctx)
>>>>>> +                       return -ENOENT;
>>>>>> +       }
>>>>>
>>>>> Shouldn't that session be allocated during open()?
>>>>>
>>>> Yes, and no, we do not need context in all the cases. In cases like we
>>>> just want to allocate dmabuf.
>>>
>>> Can you give an example what that would be good for?
>>>
>>
>> Currently the instance which does not need session is used as simple
>> memory allocator (rpcmem), TBH, this is the side effect of trying to fit
>> in with downstream application infrastructure which uses ion for andriod
>> usecases.
> 
> That does not sound like enough of a reason then, user space is
> easy to change here to just allocate the memory from the device itself.
> The only reason that I can see for needing a dmabuf would be if
> you have to share a buffer between two instances, and then you
> can use either of them.

I agree, I will try rework this and remove the instances that does not 
require sessions!

Sharing buffer is also a reason for dmabuf here.

> 
>>>>>> +static void fastrpc_notify_users(struct fastrpc_user *user)
>>>>>> +{
>>>>>> +       struct fastrpc_invoke_ctx *ctx, *n;will go
>>>>>> +
>>>>>> +       spin_lock(&user->lock);
>>>>>> +       list_for_each_entry_safe(ctx, n, &user->pending, node)
>>>>>> +               complete(&ctx->work);
>>>>>> +       spin_unlock(&user->lock);
>>>>>> +}
>>>>>
>>>>> Can you explain here what it means to have multiple 'users'
>>>>> a 'fastrpc_user' structure? Why are they all done at the same time?
>>
>> user is allocated on every open(). Having multiple users means that
>> there are more than one compute sessions running on a given dsp.
>>
>> They reason why all the users are notified here is because the dsp is
>> going down, so all the compute sessions associated with it will not see
>> any response from dsp, so any pending/waiting compute contexts are
>> explicitly notified.
> 
> I don't get it yet. What are 'compute sessions'? Do you have
> multiple threads running on a single instance at the same time?

compute sessions are "compute context-banks" instances in DSP.

DSP supports multiple compute banks, Ideally 12 context banks, 4 which 
are reserved for other purposes and 8 of them are used for compute, one 
for each process. So ideally we can run 8 parallel computes.


> I would have expected to only ever see one thread in the
> 'wait_for_completion()' above, and others possibly waiting
> for a chance to get to but not already running.
> 
>>>> struct fastrpc_remote_crc {
>>>>           __u64 crc;
>>>>           __u64 reserved1
>>>>           __u64 reserved2
>>>>           __u64 reserved3
>>>> };
>>>
>>> I don't see a need to add extra served fields for structures
>>> that are already naturally aligned here, e.g. in
>>> fastrpc_remote_arg we need the 'reserved1' but not
>>> the 'reserved2'.
>> Yes, I see, I overdone it!
>> Other idea, is, may be I can try to combine these into single structure
>> something like:
>>
>> struct fastrpc_invoke_arg {
>>          __u64 ptr;
>>          __u64 len;
>>          __u32 fd;
>>          __u32 reserved1
>>          __u64 attr;
>>          __u64 crc;
>> };
>>
>> struct fastrpc_ioctl_invoke {
>>          __u32 handle;
>>          __u32 sc;
>>          /* The minimum size is scalar_length * 32*/
>>          struct fastrpc_invoke_args *args;
>> };
> 
> That is still two structure, not one ;-)
> 
>>>> struct fastrpc_ioctl_invoke {
>>>>           __u32 handle;
>>>>           __u32 sc;
>>>>           /* The minimum size is scalar_length * 32 */
>>>>           struct fastrpc_remote_args *rargs;
>>>>           struct fastrpc_remote_fd *fds;
>>>>           struct fastrpc_remote_attr *attrs;
>>>>           struct fastrpc_remote_crc *crc;
>>>> };
>>>
>>> Do these really have to be indirect then? Are they all
>>> lists of variable length? How do you know how long?
>> Yes, they are variable length and will be scalar length long.
>> Scalar length is derived from sc variable in this structure.
> 
> Do you mean we have a variable number 'sc', but each array
> always has the same length as the other ones? In that
> case: yes, combining them seems sensible.
Yes thats what I meant!

> 
> The other question this raises is: what is 'handle'?
> Why is the file descriptor not enough to identify the
> instance we want to talk to?
This is remote handle to opened interface on which this method has to be 
invoked.
For example we are running a calculator application, calculator will 
have a unique handle on which calculate() method needs to be invoked.


thanks,
srini
> 
>        Arnd
> 

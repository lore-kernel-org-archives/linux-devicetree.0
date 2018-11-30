From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 4/6] char: fastrpc: Add support for create remote init
 process
Date: Fri, 30 Nov 2018 13:34:33 +0000
Message-ID: <ccfd45be-d51a-f6f5-1c36-fcd1a37359d9@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-5-srinivas.kandagatla@linaro.org>
 <CAK8P3a0CzU5mGE9YBfe5FVPGCBhjFRsZbgbyy8Yvopu4wQ7uxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0CzU5mGE9YBfe5FVPGCBhjFRsZbgbyy8Yvopu4wQ7uxA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks Arnd for the review comments,

On 30/11/18 13:26, Arnd Bergmann wrote:
> On Fri, Nov 30, 2018 at 11:48 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> +
>> +static int fastrpc_init_process(struct fastrpc_user *fl,
>> +                               struct fastrpc_ioctl_init *init)
>> +{
>> +       struct fastrpc_ioctl_invoke *ioctl;
>> +       struct fastrpc_phy_page pages[1];
>> +       struct fastrpc_map *file = NULL, *mem = NULL;
>> +       struct fastrpc_buf *imem = NULL;
>> +       int err = 0;
>> +
>> +       ioctl = kzalloc(sizeof(*ioctl), GFP_KERNEL);
>> +       if (!ioctl)
>> +               return -ENOMEM;
>> +
>> +       if (init->flags == FASTRPC_INIT_ATTACH) {
>> +               remote_arg_t ra[1];
>> +               int tgid = fl->tgid;
>> +
>> +               ra[0].buf.pv = (void *)&tgid;
>> +               ra[0].buf.len = sizeof(tgid);
>> +               ioctl->handle = 1;
>> +               ioctl->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>> +               ioctl->pra = ra;
>> +               fl->pd = 0;
>> +
>> +               err = fastrpc_internal_invoke(fl, 1, ioctl);
>> +               if (err)
>> +                       goto bail;
> 
> It doesn't seem right to me to dynamically allocate an 'ioctl' data structure
> from kernel context and pass that down to another function. Maybe eliminate
> that structure and change fastrpc_internal_invoke to take the individual
> arguments here instead of a pointer?
Yes, I totally agree with you, Will rework this part as suggested.
> 
>> +       } else if (init->flags == FASTRPC_INIT_CREATE) {
> 
> How about splitting each flags== case into a separate function?

Once I move this to a command code then make this a separate function.
> 
>> diff --git a/include/uapi/linux/fastrpc.h b/include/uapi/linux/fastrpc.h
>> index 8fec66601337..6b596fc7ddf3 100644
>> --- a/include/uapi/linux/fastrpc.h
>> +++ b/include/uapi/linux/fastrpc.h
>> @@ -6,6 +6,12 @@
>>   #include <linux/types.h>
>>
>>   #define FASTRPC_IOCTL_INVOKE   _IOWR('R', 3, struct fastrpc_ioctl_invoke)
>> +#define FASTRPC_IOCTL_INIT     _IOWR('R', 4, struct fastrpc_ioctl_init)
>> +
>> +/* INIT a new process or attach to guestos */
>> +#define FASTRPC_INIT_ATTACH      0
>> +#define FASTRPC_INIT_CREATE      1
>> +#define FASTRPC_INIT_CREATE_STATIC  2
> 
> Maybe use three command codes here, and remove the 'flags' member?
> 
Make sense, will do it in next version.

>> @@ -53,4 +59,16 @@ struct fastrpc_ioctl_invoke {
>>          unsigned int *crc;
>>   };
>>
>> +struct fastrpc_ioctl_init {
>> +       uint32_t flags;         /* one of FASTRPC_INIT_* macros */
>> +       uintptr_t file;         /* pointer to elf file */
>> +       uint32_t filelen;       /* elf file length */
>> +       int32_t filefd;         /* ION fd for the file */
> 
> What does this have to do with ION? The driver seems to otherwise
> just use the generic dma_buf interfaces.
Yes, the driver just uses dma_buf, it looks like leftover from downstream!

> 
>> +       uintptr_t mem;          /* mem for the PD */
>> +       uint32_t memlen;        /* mem length */
>> +       int32_t memfd;          /* fd for the mem */
>> +       int attrs;
>> +       unsigned int siglen;
>> +};
> 
> This structure is again not suitable for ioctls. Please used fixed-length
> members and no holes in the structure.
Sure, Will recheck all the structures before sending next version!


--srini
> 
>         Arnd
> 

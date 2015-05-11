From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v2 04/13] musb: Do not use
 musb_read[b|w] / _write[b|w] wrappers in generic fifo functions
Date: Mon, 11 May 2015 20:14:12 +0200
Message-ID: <5550F174.6000709@redhat.com>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com> <1426878682-14521-5-git-send-email-hdegoede@redhat.com> <20150511155846.GH19476@saruman.tx.rr.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB7XCYOVAKGQEYQFBVSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150511155846.GH19476-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11-05-15 17:58, Felipe Balbi wrote:
> On Fri, Mar 20, 2015 at 08:11:13PM +0100, Hans de Goede wrote:
>> The generic fifo functions already use non wrapped accesses in various
>> cases through the iowrite#_rep functions, and all platforms which override
>> the default musb_read[b|w] / _write[b|w] functions also provide their own
>> fifo access functions, so we can safely drop the unnecessary indirection
>> from the fifo access functions.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/usb/musb/musb_core.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
>> index 01ed3a6..016b5b9 100644
>> --- a/drivers/usb/musb/musb_core.c
>> +++ b/drivers/usb/musb/musb_core.c
>> @@ -313,7 +313,7 @@ static void musb_default_write_fifo(struct musb_hw_ep *hw_ep, u16 len,
>>   				index += len & ~0x03;
>>   			}
>>   			if (len & 0x02) {
>> -				musb_writew(fifo, 0, *(u16 *)&src[index]);
>> +				__raw_writew(*(u16 *)&src[index], fifo);
>
> not all architectures provide __raw_* accessors, right ?

As Arnd mentions in his reply, these are available everywhere.

Also note, that as I've tried to explain in the commit message already this commit
makes no functional changes what so ever, the generic musb_default_read/write_fifo
functions are only used by musb platforms which do not overwrite musb_write* /
musb_read* and musb_write* / musb_read* are already just thin wrappers around
the __raw_* functions.

Regards,

Hans

From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sun6i: dt: Add new Mele I7 device
Date: Tue, 03 Mar 2015 14:20:31 +0100
Message-ID: <54F5B51F.6030609@redhat.com>
References: <1425131285-8640-1-git-send-email-codekipper@gmail.com> <20150303071635.GC4713@lukather> <54F568F8.1040104@redhat.com> <20150303082209.GE4713@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBKXK22TQKGQEZTI7LFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150303082209.GE4713@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03-03-15 09:22, Maxime Ripard wrote:
> On Tue, Mar 03, 2015 at 08:55:36AM +0100, Hans de Goede wrote:
>>>> +/ {
>>>> +	model = "Mele I7 Quad top set box";
>>>> +	compatible = "mele,i7", "allwinner,sun6i-a31";
>>>> +
>>>> +	chosen {
>>>> +		bootargs = "earlyprintk console=ttyS0,115200";
>>>
>>> Using earlyprintk by default is a bad idea if the kernel is configured
>>> with DEBUG_LL support for another SoC.
>>
>> While on this subject, u-boot now sets the chosen/stdout-path property
>> up by default, which means that the kernel will do the right thing by
>> default. So we we really do not need any bootargs= in our dts files.
>
> I just tested that this weekend, and it turned out that the kernel
> couldn't use it so far (ie, no output until init takes over and setup
> a TTY on ttyS0).
>
> Was it working for you?

Yes, note that the kernel only honors the stdout-path property if
there is no console= argument present if there is a console= argument
present on the kernel cmdline then that will overrule the stdout-path
property.

Which board did you test with, and what u-boot and kernel version ?

>> Currently we've a random mix where we do have bootargs in some, but
>> not in most sunxi dts files. I believe we should simply remove it
>> everywhere...
>
> We used to set them in SoCs that are not supported by U-boot yet, and
> where the bootloader won't come and patch the DT (A31, A23, A80).

Ah, so that is (was) the logic, following that logic we should probably
remove bootargs= from at least the a23 and a31 boards (basically
from all boards but a80).

Regards,

Hans

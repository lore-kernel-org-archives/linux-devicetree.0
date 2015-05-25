From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3 v3] Documentation: dt: add the CSR atlas7 hwspinlock
 bindings document
Date: Mon, 25 May 2015 13:33:05 +0800
Message-ID: <CAGsJ_4wEA4AxVmz8_s5wRLy_aeS0dLZ5HVTR+7RZtVhANzGMBg@mail.gmail.com>
References: <1432017698-23725-1-git-send-email-21cnbao@gmail.com>
 <1432017698-23725-2-git-send-email-21cnbao@gmail.com> <555FB14A.2070505@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555FB14A.2070505-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-05-23 6:44 GMT+08:00 Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>:
> Hi Barry,
>
> On 05/19/2015 01:41 AM, Barry Song wrote:
>> From: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
>>
>> The Hardware Spinlock device on atlas7 provides hardware assistance
>> for synchronization between the multiple processors in the system
>> (dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
>> This patch adds the DT bindings information for this hwspinlock
>> module.
>>
>> Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>> Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
>> Signed-off-by: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
>> Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
>> ---
>>  .../devicetree/bindings/hwlock/sirf,hwspinlock.txt | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
>> new file mode 100644
>> index 0000000..cc6d351
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
>> @@ -0,0 +1,25 @@
>> +SIRF Hardware spinlock device Binding
>> +-----------------------------------------------
>> +
>> +Required properties :
>> +- compatible : shall contain only one of the following:
>> +     "sirf,hwspinlock"
>> +
>> +- reg : the register address of hwspinlock
>
> Also suggest to document the value to be used for #hwlock-cells, the
> generic hwlock binding does not mention that.

do you think whether we can put one line like?

#hwlock-cells : <1>, as required by generic hwspinlock binding.
>
>> +
>> +Please look at the generic hwlock binding for usage information for consumers,
>> +"Documentation/devicetree/bindings/hwlock/hwlock.txt"
>> +
>
> regards
> Suman
>

-barry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

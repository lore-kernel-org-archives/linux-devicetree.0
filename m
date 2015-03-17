From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4 v3] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 17 Mar 2015 15:14:50 -0700
Message-ID: <5508A75A.4070203@broadcom.com>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-2-git-send-email-eric@anholt.net> <20150317172758.GC3318@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150317172758.GC3318@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lubomir,


On 15-03-17 10:27 AM, Lee Jones wrote:
> On Thu, 12 Mar 2015, Eric Anholt wrote:
>
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>
>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>
>>
>> v2: Split into a separate patch for submitting to the devicetree list.
>>      Consistently start node docs with a capital letter. device's
>>      address in the example shouldn't have "0x". Drop machine-specific
>>      interrupt numbers from the docs.  (changes by anholt).
>>
>> v3: Move the file to just bcm2835-mbox.txt, clean up formatting
>>      (changes by anholt, from review by Lee Jones).
>
> Thanks for fixing up.
>
>> .../devicetree/bindings/mailbox/bcm2835-mbox.txt      | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
>
> I don't see any unruliness or causes of controversy.
>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>> diff --git a/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
>> new file mode 100644
>> index 0000000..0bb2b9d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
I am trying to standarize all broadcom device tree bindings in the 
format "brcm,binding.txt".

Could you please rename this file to brcm,bcm2835-mbox.txt for 
consistency in bindings?

Regards,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

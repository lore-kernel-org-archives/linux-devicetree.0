From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 03 Mar 2015 19:37:17 -0700
Message-ID: <54F66FDD.2040409@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vbih98za.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/2015 12:28 PM, Eric Anholt wrote:
> Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> 
>> On Mon, 02 Mar 2015, Eric Anholt wrote:
>> 
>>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>> 
>>> v2: Split into a separate patch for submitting to the 
>>> devicetree list.
...
>>> ---

Generally, the changelog should go below the --- since most people
don't want to see the changelog committed into the source.

>>> .../devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt | 19 
>>> +++++++++++++++++++ 1 file changed, 19 insertions(+) create 
>>> mode 100644 
>>> Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>>
>>>
>>>
>>> 
diff --git
a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>> new file mode 100644 index 0000000..f5741a0 --- /dev/null +++ 
>>> b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>
>>
>>>
>>> 
Rename these files to conform to the current naming convention.  In
>> -next we currently have 'altera-mailbox.txt' and 
>> 'omap-mailbox.txt', so 'bcm2835-mbox.txt' seems appropriate.
> 
> Will do.

I believe all the current bcm2835 bindings use the compatible value as
the filename. I personally prefer this to picking a different "random"
name for the filenames. It means you only have to name the thing once,
and then use the same value for the compatible property and binding
document.

>>> +Example: + +mailbox: mailbox@7e00b800 { +	compatible = 
>>> "brcm,bcm2835-mbox"; +	reg = <0x7e00b880 0x40>; +	interrupts = 
>>> <0 1>; +	#mbox-cells = <1>; +};
>> 
>> It would be good to see the client examples here as well.
>> Please consider pulling in brcm,bcm2835-mbox-power.txt and 
>> brcm,bcm2835-mbox-property.txt.
> 
> Oh, so have those two just smashed into this file as one set of 
> documentation for everything to do with mailbox on bcm2835?  That 
> seems good to me.  When I was adding the client drivers, the fact 
> that the other brcm file was named after the compatible string
> made me generate new files under then new compatible strings, but
> the other drivers already in the tree obviously aren't formatted
> that way.

The HW mailbox seems like a different process to the upper-layer
protocols/message formats running over the top of it. Sure right now
the Pi has a single firmware, but do all bcm2835-based devices share
the same firmware? Is so, we'd be warranted in lumping the HW and
firmware protocol together, but I rather wonder whether e.g. the
bcm2835-based Roku uses the same firmware protocol?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

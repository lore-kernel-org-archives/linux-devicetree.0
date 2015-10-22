From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add document of Rockchip mailbox
Date: Thu, 22 Oct 2015 10:07:00 +0800
Message-ID: <562844C4.5040304@gmail.com>
References: <1442228798-15191-1-git-send-email-wxt@rock-chips.com>
 <1442228798-15191-2-git-send-email-wxt@rock-chips.com>
 <CABb+yY2Z9soGR0OcCRcfr2Ei7zX29qHPhYEKf3LPe+OhAuZMjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY2Z9soGR0OcCRcfr2Ei7zX29qHPhYEKf3LPe+OhAuZMjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Jassi,

Sorry for delay reply.
=E5=9C=A8 2015=E5=B9=B410=E6=9C=8806=E6=97=A5 18:34, Jassi Brar =E5=86=99=
=E9=81=93:
> On Mon, Sep 14, 2015 at 4:36 PM, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wro=
te:
>> This add the necessary binding documentation for mailbox
>> found on RK3368 SoC.
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   .../bindings/mailbox/rockchip-mailbox.txt          | 33 ++++++++++=
++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/rockc=
hip-mailbox.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/rockchip-mail=
box.txt b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.tx=
t
>> new file mode 100644
>> index 0000000..b9b4768
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
>> @@ -0,0 +1,33 @@
>> +Rockchip mailbox
>> +
>> +The Rockchip mailbox is used by the Rockchip CPU cores to communica=
te
>> +requests to MCU processor.
>> +
>> +Refer to ./mailbox.txt for generic information about mailbox device=
-tree
>> +bindings.
>> +
>> +Required properties:
>> +
>> + - compatible: should be one of the following.
>> +   - "rockchip,rk3368-mbox" for rk3368
>> + - reg: physical base address of the controller and length of memor=
y mapped
>> +       region.
>> +       physical base address of the share buffer and length of memo=
ry mapped
>> +       region.
> Please make shared-sram a property of user drivers.

As Rob points out,
maybe, don't we need also define it in user drivers.
As the SRAM binding (misc/sram.txt) had defined.

I just make the SCPI protocol client driver to work for mailbox.
>
> Location and size of shared-memory is a platform property, mailbox
> controller doesn't need sram to function.
>    For example, protocol on some platform, with this controller, may =
be
> trivial enough to not need a shared sram... say only 32-bits wide
> requests and responses which can be passed via mailbox registers
> directly.   mbox_client.tx_prepare() is where the user driver sets up
> the shared-memory.
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

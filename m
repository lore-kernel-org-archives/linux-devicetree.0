From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Subject: Re: [PATCH v3 04/11] ARM: bcm2835: dt: add bindings for shared
 interrupt properties
Date: Tue, 22 Mar 2016 10:23:45 +0100
Message-ID: <56F10F21.9020709@martin.sperl.org>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org>
 <1457175142-28665-5-git-send-email-kernel@martin.sperl.org>
 <20160310085714.GA31313@svinekod>
 <E60A6B56-0F3F-465C-8BF7-59EF35D41070@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E60A6B56-0F3F-465C-8BF7-59EF35D41070-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark!

On 11.03.2016 09:51, Martin Sperl wrote:
>> On 10.03.2016, at 09:57, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> Alternative options that have been considered:
>> * there is unfortunately no =E2=80=9Cinterrupt-names=E2=80=9D proper=
ty (like it exists for
>>    reg, dma), because then I would have preferred to used:
>>       interrupts =3D <...>, <...>, =E2=80=A6;
>>       interrupt-name =3D =E2=80=9Cdma0=E2=80=9D, =E2=80=9Cdma1=E2=80=
=9D, ..., =E2=80=9Cdma10=E2=80=9D, =E2=80=9Cdmashared=E2=80=9D, =E2=80=9C=
dmaall=E2=80=9D;
>>    with something like this we could probably have avoided both prop=
erties
>>    and just added a legacy mapping
>>    This would require some changes to the irq framework (which I wan=
ted
>>    to avoid)

I have posted a patch based on this approach (after having found out=20
that it is possible
with the current framework using platform_get_irq_byname).

Rob Herring has "Acked" the documentation patch:
   [PATCH 1/3] dt/bindings: bcm2835: add interrupt-names property

Is this approach acceptable for you as well, so that we can try to get=20
it merged?

Thanks, Martin






--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [kernel PATCH] devicetree: document ARM bindings for QEMU's Firmware
 Config interface
Date: Fri, 28 Nov 2014 14:49:31 +0100
Message-ID: <54787D6B.5000302@redhat.com>
References: <1417177604-21194-1-git-send-email-lersek@redhat.com> <4081425.dh6XptxTnn@wuerfel> <54787715.6030407@redhat.com> <20141128133300.GG25883@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141128133300.GG25883@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/28/14 14:33, Mark Rutland wrote:
> On Fri, Nov 28, 2014 at 01:22:29PM +0000, Laszlo Ersek wrote:
>> On 11/28/14 13:59, Arnd Bergmann wrote:

>>> We don't normally list contiguous registers separately. Maybe just round
>>> up to one page and make the register property
>>>
>>> 	reg = <0x0 0x9020000 0x0 0x1000>;
>>
>> The registers are not necessarily placed shoulder to shoulder (it's not
>> a requirement in the QEMU source).
> 
> It might not be at the moment, but if no-one separates them it could be
> a requirement for using this binding. Is there any benefit to having
> them separated?

I couldn't name any.

Thanks
Laszlo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

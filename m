From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v3 9/9] NFC: nfcmrvl: update device tree
 bindings for Marvell NFC
Date: Sat, 24 Oct 2015 02:22:02 +0200
Message-ID: <20151024002202.GC23609@zurbaran.home>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
 <1445602986-3254-10-git-send-email-cuissard@marvell.com>
 <CAL_JsqJ7a+MNA8BPseGu_L+3yMr=jK-3YiSo+HZkoqJq2XpWgg@mail.gmail.com>
 <CE8AEFC3-74F2-44B9-B7B6-EBDD1966FB3A@marvell.com>
 <20151023230034.GA23609@zurbaran.home>
 <3CAE2505-C17A-4A4F-A222-0F0D814B8491@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3CAE2505-C17A-4A4F-A222-0F0D814B8491-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Sat, Oct 24, 2015 at 12:15:28AM +0000, Vincent Cuissard wrote:
> >>>> diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> >>>> index 41058fc..0f95924 100644
> >>>> --- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> >>>> +++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> >>>> @@ -2,9 +2,9 @@
> >>>> 
> >>>> Required properties:
> >>>> - compatible: Should be:
> >>>> -  - "mrvl,nfc-uart" for UART devices
> >>>> -  - "mrvl,nfc-i2c" for I2C devices
> >>>> -  - "mrvl,nfc-spi" for SPI devices
> >>>> +  - "marvell,nfc-uart" for UART devices
> >>>> +  - "marvell,nfc-i2c" for I2C devices
> >>>> +  - "marvell,nfc-spi" for SPI devices
> >>> 
> >>> There is no point in changing these and doing so breaks backwards compatibility.
> >> 
> >> There is no break since these 2 drivers are new. In the same patchset I first set mrvl and replace it to marvell since I figured out that this is the name for all other Marvell drivers.
> >> 
> > I agree the i2c and spi drivers are new, but not the uart one.
> > That one should be supported in a backward compatible way.
> 
> Since our chips are not sold through distributors yet I know that no one is using this UART driver yet.
> 
> That's why I changed this compatible string without any trouble.
> 
> If you really want I can keep the compatibility here but it will just add code that will never be used.
> 
> As you wish.
I consider a device tree binding as an ABI and I don't think there
should be any exception for breaking a kernel ABI backward
compatibility. Please keep this code in.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

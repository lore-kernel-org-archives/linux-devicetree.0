From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v3 0/2] Marvell NFC NCI UART driver and DT configuration
Date: Tue, 23 Jun 2015 09:42:52 -0500
Message-ID: <CAL_JsqJ6MuJOb2BpWse7GbV1+pH_-KSjZGXZgWjVRAdBc8G3ow@mail.gmail.com>
References: <1434024020-17048-1-git-send-email-cuissard@marvell.com> <20150611214400.GD10011@ribalta.mp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150611214400.GD10011-41CF7WKNp/HfYmLG0ciiYFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 4:44 PM, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Hi Vincent,
>
> On Thu, Jun 11, 2015 at 02:00:18PM +0200, Vincent Cuissard wrote:
>> Hi,
>>
>> Please find patches that add platform data configuration, DT bindings,
>> and UART driver for nfcmrvl NFC NCI driver.
>>
>> Br,
>> Vincent
>>
>> Vincent Cuissard (2):
>>   NFC: nfcmrvl: add platform_data and DT configuration
>>   NFC: nfcmrvl: add UART driver
> Both patches applied to nfc-next, thanks a lot.

This binding needs some work still. I just noticed you applied it a
few hours before I replied.

Primarily, this is one function of a combo chip. If the NFC functions
are completely independent from the other functions, then the binding
like this is probably okay. But I would expect there are some
inter-dependencies such as clock, reset line, or regulators. We should
be reviewing an 8887 binding as a whole including WiFi and BT. There's
a similar discussion happening for BT on Broadcom chips.

Rob

>
> Cheers,
> Samuel.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

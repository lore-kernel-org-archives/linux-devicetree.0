From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 resend 1/2] ehci-platform: Add support for controllers
 with multiple reset lines
Date: Wed, 8 Jun 2016 18:52:30 +0200
Message-ID: <20236f14-549e-5acc-3f95-90db44b1f49d@redhat.com>
References: <1464880446-5919-1-git-send-email-hdegoede@redhat.com>
 <1464880446-5919-2-git-send-email-hdegoede@redhat.com>
 <20160608052216.GA7766@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608052216.GA7766-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08-06-16 07:22, Greg Kroah-Hartman wrote:
> On Thu, Jun 02, 2016 at 05:14:05PM +0200, Hans de Goede wrote:
>> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>>
>> At least the EHCI/OHCI found on the Allwinnner H3 SoC needs multiple
>> reset lines, the controller will not initialize while the reset for
>> its companion is still asserted, which means we need to de-assert
>> 2 resets for the controller to work.
>>
>> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -Use the new reset_control_[de]assert_shared reset-controller functions
>> ---
>>  Documentation/devicetree/bindings/usb/usb-ehci.txt |  2 +-
>>  drivers/usb/host/ehci-platform.c                   | 41 ++++++++++++----------
>>  2 files changed, 24 insertions(+), 19 deletions(-)
>
> This patch doesn't apply to my usb-testing branch at all, what went
> wrong?

You merged this patch:

https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?id=d0e08b0077f49e209bc90305ddf1ca434ac6cc0e

Which does almost the same, except that it only supports dedicated reset
controllers and not shared reset controllers.

I'll send a new patch which changes things to add support for shared
reset controllers.

This will also bring the ehci-platform reset handling code inline
with ohci-platform again.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

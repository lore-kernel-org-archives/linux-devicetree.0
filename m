From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: Add a dts file for the Mele A1000G quad
 top set box
Date: Mon, 01 Jun 2015 20:12:58 +0200
Message-ID: <556CA0AA.4030202@redhat.com>
References: <1433170979-13725-1-git-send-email-hdegoede@redhat.com> <1433182022.5748.281.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433182022.5748.281.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01-06-15 20:07, Ian Campbell wrote:
> On Mon, 2015-06-01 at 17:02 +0200, Hans de Goede wrote:
>> The Mele A1000G-quad and the Mele M9 have the same PCB, sofar we've been using
>> the same dts for both models. Unfortunately this does not work for the otg
>> controller, on the M9 this is routed to a micro-usb connector on the outside,
>> while as on the A1000G-quad it is connected to an usb to sata bridge
>> (which is not populated on the M9 pcb).
>>
>> This commit adds a new dts for the Mele-A1000G-quad to allow using
>> different otg controller settings on the 2 boards.
>
> But isn't intending to actually change the otg settings, right?

Right, that comes in a separate commit as the otg kernel driver is
still in the process of being merged. For those curious the actual commit
making the changes can be found in my sunxi-wip kernel branch (hint
it is a boring change, do not bother looking).

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH RESEND] w1: masters: omap_hdq: Add support for 1-wire mode
Date: Wed, 13 May 2015 18:03:20 +0300
Message-ID: <5984861431529400@web10h.yandex.ru>
References: <1430728735-22747-1-git-send-email-vigneshr@ti.com> <5552FCB2.8060300@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5552FCB2.8060300@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, NeilBrown <neilb@suse.de>, Tony Lindgren <tony@atomide.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabian Frederick <fabf@skynet.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

13.05.2015, 10:27, "Vignesh R" <vigneshr@ti.com>:
> On Monday 04 May 2015 02:08 PM, Vignesh R wrote:
>> =9AThis patches makes following changes to omap_hdq driver
>> =9A=9A- Enable 1-wire mode.
>> =9A=9A- Implement w1_triplet callback to facilitate search rom
>> =9A=9A=9A=9Aprocedure and auto detection of 1-wire slaves.
>> =9A=9A- Proper enabling and disabling of interrupt.
>> =9A=9A- Cleanups (formatting and return value checks).
>>
>> =9AHDQ mode remains unchanged.
>>
>> =9ASigned-off-by: Vignesh R <vigneshr@ti.com>
>> =9A---
>>
>> =9AThis patch was sent for v4.1 but was never picked up.
>> =9AHere is the link to the previous patch
>> =9Ahttp://www.spinics.net/lists/linux-omap/msg116228.html
>
> Hi Andrew, Evgeniy Polyakov,
>
> Gentle ping....
> This patch has been waiting since 4.1 merge window.

I believe it should go via omap tree.

It looks good to me, Greg, please pull it upstream, if it continues to =
be quiet

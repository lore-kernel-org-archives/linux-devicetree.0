From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] ARM64: dts: amlogic: Add basic support for Amlogic
 S905X
Date: Tue, 13 Sep 2016 09:36:01 +0200
Message-ID: <7755ed8c-6083-4e2a-620c-85f55ca1d16e@baylibre.com>
References: <20160903082227.30559-1-narmstrong@baylibre.com>
 <20160903082227.30559-3-narmstrong@baylibre.com>
 <7e27e8c0-bb18-40d8-10d6-3928e66815c7@suse.de>
 <CAOQ7t2bWLq2XP2rKx3msf=1tUfXkQuBWagun46TaKk73qXr=FQ@mail.gmail.com>
 <7ha8fcq26c.fsf@baylibre.com> <28d9160a-ce40-cbbb-b4e9-3ec34be52368@suse.de>
 <CAOQ7t2ZjDjZbUfCKwUf4PHywOZx-UiQmy37TEQhWDNYRg0BOag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOQ7t2ZjDjZbUfCKwUf4PHywOZx-UiQmy37TEQhWDNYRg0BOag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 09/13/2016 08:14 AM, Carlo Caione wrote:
> On Mon, Sep 12, 2016 at 11:43 PM, Andreas Färber <afaerber@suse.de> wrote:
> 
> [cut]
>> I'm not arguing over the file name, where it perfectly makes sense to
>> have a meson-gxl- prefix (already discussed), just about the compatible
>> string where we don't have "amlogic,meson-gxl-s905x-p231" either because
>> it is completely unnecessary and does _not_ add any value.
>>
>> Not that we're checking this string anywhere anyway... If you want to
>> check for the GXL family you have to use "amlogic,meson-gxl"; if you
>> want to check for the specific SoC you use "amlogic,s905x". Simple. We
>> never match partial strings, so there is no sense in a hardcoded prefix
>> that is duplicating information already available.
> 
> Ok, then. Fine with me.
> 
> Neil, do you want to resend my patch or you can take care of the fixes
> for the whole patchset?
> 
> Thanks,
> 

Ok, I still need to synchronize with kevin for when and where to rebase from.

Neil

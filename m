From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
Date: Fri, 22 Dec 2017 11:47:42 +0100
Message-ID: <18403050-7b4c-ecae-75bd-b67d72d63eeb@suse.de>
References: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?T=c3=bcrk=2c_Jan?= <Jan.Tuerk@emtrion.de>
Cc: 'Rob Herring' <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, SZ Lin <sz.lin@moxa.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LinuxArmKernelMailingListe <linux-arm-kernel@lists.infradead.or>
List-Id: devicetree@vger.kernel.org

Am 22.12.2017 um 11:34 schrieb Türk, Jan:
>> On Wed, Dec 20, 2017 at 02:47:04PM +0100, jan.tuerk@emtrion.com wrote:
>>> + * SPDX-License-Identifier: GPL-2.0
>>
>> You have this.
>>
>> Also, the rules around this are getting a bit stricter saying the SPDX
>> tag should be the first line of the file using a C++ style comment.
>>
> I'll change it for v3 of this patch however it will end up like this:
> //SPDX-License...

I would've expected:

// SPDX-License...
> /*
>  *  Copyright 

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)

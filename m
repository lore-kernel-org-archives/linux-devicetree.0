From: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH v2 1/1] drm/panel: Add support for Olimex LCD-OLinuXino
 panel
Date: Tue, 10 Jul 2018 16:41:54 +0300
Message-ID: <a5aaf30e-4fd5-b47c-664b-55d00b862262@olimex.com>
References: <1529909093-17021-1-git-send-email-stefan@olimex.com>
 <20180710103250.GG1504@ulmo> <e1229a90-1bdb-0c8e-c371-cde0bc30ea56@gmail.com>
 <20180710132740.GA19600@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710132740.GA19600@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 07/10/2018 04:27 PM, Greg Kroah-Hartman wrote:
> On Tue, Jul 10, 2018 at 04:08:54PM +0300, Stefan Mavrodiev wrote:
>> On 07/10/2018 01:32 PM, Thierry Reding wrote:
>>>> +MODULE_AUTHOR("Stefan Mavrodiev <stefan@olimex.com>");
>>>> +MODULE_DESCRIPTION("LCD-OLinuXino driver");
>>>> +MODULE_LICENSE("GPL v2");
>>> This seems to contradict the GPL-2.0+ in the SPDX header.
>> Can you elaborate on this?
> Please read module.h for what this string means.
Oh.... My bad. License should be "GPL", not "GPL v2".
>
> thanks,
>
> greg k-h

Regards,
Stefan Mavrodiev

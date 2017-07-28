From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 0/4] Broadcom STB S2/S3/S5 support for ARM and MIPS
Date: Fri, 28 Jul 2017 16:59:52 -0700
Message-ID: <4bebae92-5ae3-8b89-a85a-c06f9d70d658@gmail.com>
References: <20170706222225.9758-1-f.fainelli@gmail.com>
 <72d54e9c-6a50-2eac-52db-b1e8c234c552@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72d54e9c-6a50-2eac-52db-b1e8c234c552@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE
List-Id: devicetree@vger.kernel.org

On 07/18/2017 12:52 PM, Florian Fainelli wrote:
> On 07/06/2017 03:22 PM, Florian Fainelli wrote:
>> Hi,
>>
>> This patch series adds support for S2/S3/S5 suspend/resume states on
>> ARM and MIPS based Broadcom STB SoCs.
>>
>> This was submitted a long time ago by Brian, and I am now picking this
>> up and trying to get this included with support for our latest chips.
>>
>> Provided that I can collect the necessary Acks from Rob (DT) and other
>> people (Rafael?) I would probably take this via the Broadcom ARM SoC
>> pull requests.
> 
> Rafael, any feedback on this?

Applied these 4 patches to drivers/next now.
-- 
Florian

From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Mon, 28 Jul 2014 18:39:46 +0200
Message-ID: <53D67CD2.9040200@metafoo.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <53D677B1.2000700@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D677B1.2000700@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Andreas Olofsson <andreas@adapteva.com>, linux-kernel@vger.kernel.org, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, linux-arm-kernel@lists.infradead.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On 07/28/2014 06:17 PM, Andreas F=C3=A4rber wrote:
> Hi Lars-Peter,
>
> Am 25.07.2014 01:00, schrieb Andreas F=C3=A4rber:
>> most notably I'm missing
>> ADI ADV7513 and AXI-HDMI support
> [...]
>> Cc: Lars-Peter Clausen <lars@metafoo.de> (HDMI)
>
> Could you please enlighten us what the status of upstreaming
> ADV7511/ADV7513 support is? It is declared "work in progress" here:
>
> http://wiki.analog.com/resources/tools-software/linux-drivers/drm/adv=
7511
>
> I see some adv7511 V4L bits in drivers/media/i2c/adv7511.c, but no
> drivers/gpu/drm/i2c/adv7511_{core,audio}.c as on the xcomm_zynq branc=
h,
> nor any devicetree documentation. Patchwork doesn't show any recent
> submissions to LKML.
>
> Is any major rework needed for you to get the 3.14.12 based driver up=
stream?
>

It's complicated. The plan for the driver was to wait for the common di=
splay=20
framework (CDF) and convert it to use CDF and then submit it upstream. =
The=20
CDF has been rejected though. Meanwhile the V4L2 adv7511 driver has bee=
n=20
merged. So now we are in the ugly situation that we have two different=20
drivers for two different frameworks. To fix this we need to merge thes=
e two=20
drivers while still exposing the interfaces to both frameworks.

> AXI SPDIF I found in 3.16, as you noticed; what about AXI HDMI? [*]
> Is there any work ongoing to get that upstream as well?

We need to teach the DMAengine framework about cyclic interleaved trans=
fers=20
before the AXI HDMI driver can be submitted upstream.

- Lars

From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] ARM: dts: berlin: fix dtc warnings
Date: Wed, 28 Sep 2016 21:40:21 +0200
Message-ID: <57EC1CA5.2030102@gmail.com>
References: <20160906084013.2887-1-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160906084013.2887-1-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06.09.2016 10:40, Jisheng Zhang wrote:
> This is a clean up series to fix berlin arm platforms dtc warnings.
> Firstly we remove skeleton.dtsi inclusion. Then add missing unit name
> of /soc node and /memory node. Lastly, we fix regulators' name
>
> Jisheng Zhang (10):
>    ARM: dts: berlin2q: Remove skeleton.dtsi inclusion
>    ARM: dts: berlin2cd: Remove skeleton.dtsi inclusion
>    ARM: dts: berlin2: Remove skeleton.dtsi inclusion
>    ARM: dts: berlin2q: Add missing unit name to /soc node
>    ARM: dts: berlin2cd: Add missing unit name to /soc node
>    ARM: dts: berlin2: Add missing unit name to /soc node
>    ARM: dts: berlin2q-marvell-dmp: add missing unit name to /memory node
>    ARM: dts: chromecast: add missing unit name to /memory node

Jisheng,

Applied the 8 patches above.

>    ARM: dts: sony-nsz-gs7: add missing unit name to /memory node

I didn't receive this one and could not find it online.
I recreated the patch by using the chromecast patch above, so
applied.

>    ARM: dts: berlin2q-marvell-dmp: fix regulators' name

I have no clue what it should be fixed to.

Sebastian

>   arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        |  2 +-
>   arch/arm/boot/dts/berlin2.dtsi                    |  5 +++--
>   arch/arm/boot/dts/berlin2cd-google-chromecast.dts |  2 +-
>   arch/arm/boot/dts/berlin2cd.dtsi                  |  5 +++--
>   arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 12 ++++++------
>   arch/arm/boot/dts/berlin2q.dtsi                   |  6 +++---
>   6 files changed, 17 insertions(+), 15 deletions(-)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

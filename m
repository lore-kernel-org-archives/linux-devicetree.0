From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 0/6] ARM: berlin: relicense the device trees under
 GPLv2/X11
Date: Tue, 28 Apr 2015 13:41:33 +0800
Message-ID: <20150428134133.5ada5804@xhacker>
References: <1430057013-12842-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430057013-12842-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Dear Antoine,

On Sun, 26 Apr 2015 07:03:27 -0700
Antoine Tenart <antoine.tenart@free-electrons.com> wrote:

> Hi,
> 
> The GPLv2 license makes it impractical for other software components
> licensed under another license to use our device trees. To fix this,
> and make our device tree usable by other software components, relicense
> them under a GPLv2/X11 dual-license.
> 
> In order to get this accepted, we *need* all contributors to the Berlin
> device tree files to ack-by the patches applying on a file they
> contributed on. A list of needed ack-by by device tree is shown below:

For all of them:

Acked-by: Jisheng Zhang <jszhang@marvell.com>

> 
>  * berlin2q.dtsi:
>         Antoine Tenart <antoine.tenart@free-electrons.com>
>         Jisheng Zhang <jszhang@marvell.com>
> 	Alexandre Belloni <alexandre.belloni@free-electrons.com>
>         Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> 
>  * berlin2q-marvell-dmp.dtsi:
>         Antoine Tenart <antoine.tenart@free-electrons.com>
>         Jisheng Zhang <jszhang@marvell.com>
> 
>  * berlin2.dtsi:
>         Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>         Antoine Tenart <antoine.tenart@free-electrons.com>
>         Jisheng Zhang <jszhang@marvell.com>
> 
>  * berlin2-sony-nsz-gs7.dts:
>         Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> 
>  * berlin2cd.dtsi:
>         Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>         Antoine Tenart <antoine.tenart@free-electrons.com>
>         Jisheng Zhang <jszhang@marvell.com>
> 
>  * berlin2cd-google-chromecast.dts:
>         Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> 
> Thanks!
> 
> Antoine
> 
> Antoine Tenart (6):
>   ARM: dts: berlin: relicense the berlin2q dtsi under GPLv2/X11
>   ARM: dts: berlin: relicense the BG2Q Marvell DMP dts under GPLv2/X11
>   ARM: dts: berlin: relicense the berlin2 dtsi under GPLv2/X11
>   ARM: dts: berlin: relicense the BG2 Sony NSZ-GS7 dts under GPLv2/X11
>   ARM: dts: berlin: relicense the berlin2cd dtsi under GPLv2/X11
>   ARM: dts: berlin: relicense the BG2CD Google Chromecast dts under
>     GPLv2/X11
> 
>  arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        | 34 +++++++++++++++++++++--
>  arch/arm/boot/dts/berlin2.dtsi                    | 34 +++++++++++++++++++++--
>  arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 34 +++++++++++++++++++++--
>  arch/arm/boot/dts/berlin2cd.dtsi                  | 34 +++++++++++++++++++++--
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 34 +++++++++++++++++++++--
>  arch/arm/boot/dts/berlin2q.dtsi                   | 34 +++++++++++++++++++++--
>  6 files changed, 186 insertions(+), 18 deletions(-)
> 

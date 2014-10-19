From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: RE: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Sun, 19 Oct 2014 15:57:06 +0000
Message-ID: <30e1a5024949427cb08f5c1c8b4ac87f@BY2FFO11FD031.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>,<CAOesGMjAb5oXjauhbqjDhJXWct7qoXxy3XpA1=DioK7vPTwetA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMjAb5oXjauhbqjDhJXWct7qoXxy3XpA1=DioK7vPTwetA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Michal Simek <michals@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

Sorry, for top-posting, but I currently just have Outlook webmail.
The cause for this issue is relatively easily identified. The ethernet =
drivers sets the Ethernet clock according to the negotioated link speed=
=2E For this adjustment a 6-bit divider in the clock path is used. In t=
his case, it seems, the input to the 6-bit divider doesn't allow genera=
ting the full range of required frequencies for all supported link spee=
ds.

I guess this could be solved in multiple ways.
1. Disable 1G mode/auto negotiation, the other modes are probably fine =
(yeah, not a solution, but might give you a working ethernet link)
2. Ensure the divider input allows to generate all required frequencies=
=2E This essentially means to go back into Xilinx tools and play around=
 with the clock/PLL setup and re-generating a bootloader that sets thin=
gs up with the updated values.
3. Support to run-time-adust the PLLs in Zynq. This is definitely the m=
ost complex one. I never seriously pursued this, since it seemed close =
to impossible to change the PLLs at run-time without crashing pretty mu=
ch every downstream user except for the one that requested the frequenc=
y change. And even if every driver would be able to handle such a chang=
e, I could imagine that frequency constraints from  all the drivers tog=
ether would still prevent any change.

        Thanks,
        S=F6ren

________________________________________
=46rom: devicetree-owner@vger.kernel.org [devicetree-owner@vger.kernel.=
org] on behalf of Olof Johansson [olof@lixom.net]
Sent: Friday, October 17, 2014 9:28 PM
To: Andreas F=E4rber
Cc: Michal Simek; Andreas Olofsson; Matteo Vit; Sean Rickerd; devicetre=
e@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-kernel@v=
ger.kernel.org; Punnaiah Choudary Kalluri; Lars-Peter Clausen
Subject: Re: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella

Hi Andreas,

On Thu, Jul 24, 2014 at 4:00 PM, Andreas F=E4rber <afaerber@suse.de> wr=
ote:
> Hello,
>
> This patch series adds an initial device tree for the Parallella boar=
d.
> UART, SD card, Ethernet are enabled.
> Not yet enabled are HDMI, QSPI flash and 2x USB.

Andreas (Olofsson) kindly sent me a board, and I added it to the boot
farm today, it'll be included in boot reports from here on.

I did a test run with yesterday's -next It looks like networking isn't
working there at the moment, clock related. Same happens with 3.17 and
latest mainline, config multi_v7_defconfig:

[WARN] [    7.943648] macb e000b000.ethernet eth0: unable to generate
target frequency: 125000000 Hz
[WARN] [   10.948681] macb e000b000.ethernet eth0: unable to generate
target frequency: 125000000 Hz

=46ull boot log at:

http://arm-soc.lixom.net/bootlogs/misc/next-20141017/parallella-arm-mul=
ti_v7_defconfig.html

I'll be happy to try things, but I'm a bit short on cycles to debug
myself. Should hopefully be easy to reproduce.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


This email and any attachments are intended for the sole use of the nam=
ed recipient(s) and contain(s) confidential information that may be pro=
prietary, privileged or copyrighted under applicable law. If you are no=
t the intended recipient, do not read, copy, or forward this email mess=
age or any attachments. Delete this email message and any attachments i=
mmediately.

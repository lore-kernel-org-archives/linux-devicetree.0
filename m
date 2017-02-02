From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry Pi
 3, for arm (32)
Date: Thu, 2 Feb 2017 10:50:03 +0100
Message-ID: <3b3ffeb9-6e92-114c-8fdc-9586bdc68373@i2se.com>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com>
 <87fukcgsqp.fsf@eliezer.anholt.net> <878tpqki0k.fsf@eliezer.anholt.net>
 <1485944672.1076.50.camel@redhat.com> <1485951653.1076.54.camel@redhat.com>
 <1486024672.11636.1.camel@crowfest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486024672.11636.1.camel@crowfest.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Zoran <mzoran@crowfest.net>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 02.02.2017 um 09:37 schrieb Michael Zoran:
> This is actually a problem I had to deal with way in the begging of
> ARM64.  What was done in the github tree was to have the one of the DTS
>   files(in this case 64) #include the 32 bit dts.  That way it's not
> needed to have the symbolic link and install should work.
>
> I know it's ulgy, but it works...
>
> Take a look at:
> https://github.com/raspberrypi/linux/blob/rpi-4.10.y/arch/arm64/boot/dt
> s/broadcom/bcm2710-rpi-3-b.dts
>
> Here is what the file contains:
> #define RPI364
>
> #include "../../../../arm/boot/dts/bcm2710-rpi-3-b.dts"
>
>
>

This do not work in the context of the split device-tree repository [0] 
(where the directory structure differs).

[0] 
https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

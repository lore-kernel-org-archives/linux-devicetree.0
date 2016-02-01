From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] ARM: dts: porter: add MAX3355 support
Date: Mon, 1 Feb 2016 11:17:30 +0000
Message-ID: <SG2PR06MB0919361DC5805AE3F5B74041D8DE0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <4506196.xOgpYRO52t@wasted.cogentembedded.com>
 <SG2PR06MB0919D09C1146EAC0681EE109D8DA0@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <56ABCB69.1070800@cogentembedded.com> <56ABD066.7020804@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56ABD066.7020804@cogentembedded.com>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "horms@verge.net.au" <horms@verge.net.au>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> From: Sergei Shtylyov
> Sent: Saturday, January 30, 2016 5:50 AM
> 
> On 01/29/2016 11:28 PM, Sergei Shtylyov wrote:
> 
> >>> From: linux-renesas-soc-owner@vger.kernel.org
> >>> [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Sergei
> >>> Shtylyov
> >>> Sent: Wednesday, January 27, 2016 7:14 AM
> >>>
> >>> Now that Maxim Integrated MAX3355 'extcon' driver and device tree bindings
> >>> are upstream along with the 'extcon' hook  in the Renesas USBHS driver, we
> >>> can add  MAX3355 device node to  the Porter device tree and properly refer
> >>> to it from the USBHS node instead of using  "renesas,enable-gpio" property
> >>> which only allowed checking the USB ID pin  at the driver probe time;  now
> >>> this  pin's  state can be monitored dynamically!
> >>>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> I tested this patch on Porter, but interrupt of "usb-otg" didn't happened
> >> even if I connected/disconnected a usb convert cable (usb micro-ab to A).
> >> Remarks: I confirmed that the usb convert cable worked correctly on other
> >> board.
> >
> >     I guess I have the same cable
> 
>     No, I have mini-AB connector here and hence my cable is mini-AB to A.

I checked Porter specification and then I found 2 specifications exist...
 Porter "B" : mini AB connecter and Max3355 is on the board.
 Porter "C" : micro AB connect and Max3355 is not on the board. (Select host/peripheral by a jumper.)

I guess that your current target is "B".
If so, I think this patch is acceptable.

Best regards,
Yoshihiro Shimoda

> > and IRQs do happen for me when I connect and
> > disconnect it (as it should be).
> 
> >> Best regards,
> >> Yoshihiro Shimoda
> 
> MBR, Sergei

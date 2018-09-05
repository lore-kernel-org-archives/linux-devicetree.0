From: Yang Li <pku.leo@gmail.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: dwc3: description of incr burst type
Date: Wed, 5 Sep 2018 15:52:33 -0500
Message-ID: <CADRPPNQQE1ESJ5WkMxySstxpaQir-w5XOdiwDe3qTTQ_cim5Xw@mail.gmail.com>
References: <1532341959-3478-1-git-send-email-pengbo.mu@nxp.com>
 <1532341959-3478-3-git-send-email-pengbo.mu@nxp.com> <20180724232018.GA16709@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724232018.GA16709@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pengbo.mu@nxp.com, Felipe Balbi <balbi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 24, 2018 at 6:23 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 23, 2018 at 06:32:38PM +0800, Pengbo Mu wrote:
> > Add description of 'snps,incr-burst-type-adjustment' to binding
> > so that configuring devicetree.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > Signed-off-by: Pengbo Mu <pengbo.mu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Felipe,

What do you think about this patch?  The patch title prefix should be
updated from "arm64: dts: dwc3" to "dt-bindings: usb: dwc3" though.

Regards,
Leo

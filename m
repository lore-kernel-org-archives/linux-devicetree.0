From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/8] SH: intc: Add support OF for INTC
Date: Thu, 10 Jan 2013 17:42:58 +0900
Message-ID: <CANqRtoSvUdEbs-vkJZtAvVY5ypiBWeZwhPr39_nZpJj7MOtk0g@mail.gmail.com>
References: <1357713007-4005-1-git-send-email-horms+renesas@verge.net.au>
	<1357713007-4005-2-git-send-email-horms+renesas@verge.net.au>
	<20130109115352.GB7337@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20130109115352.GB7337@e106331-lin.cambridge.arm.com>
Sender: linux-sh-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Bastian Hecht <hechtb@gmail.com>, Magnus Damm <damm@opensource.se>, Paul Mundt <lethal@linux-sh.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Wed, Jan 9, 2013 at 8:53 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> Hi,
>
> Thanks for updating the text, this is far easier to read than previously.
>
> However, I'm still concerned by how complex the binding seems. As I don't have
> any familiarity with the device, I don't know whether that's just an artifact
> of the hardware or something that can be cleared up.

Iwamatsu-san wrote this binding based on our C version of the INTC
tables. And I wrote the original INTC table code based on perhaps 30+
data sheet. They code was initially designed to allow people to input
data straight off the data sheet - this so we could support a wide
range of slightly different interrupt controllers.

> I think the approach used by the binding needs some serious review before this
> should be merged. It seems far more complex than any existing interrupt
> controller binding. Without a dts example for a complete board (complete with
> devices wired up to the interrupt controller), it's difficult to judge how this
> will work in practice.

Feel free to review the code, but I am not sure why anyone would case
about this Renesas specific legacy interrupt controller. If I were to
chose how cycles should be spent then I think it is better to try to
come up with power domain DT bindings for all SoC vendors.

Also, there are the DT board code queued up that makes use of this controller.

Thanks,

/ magnus

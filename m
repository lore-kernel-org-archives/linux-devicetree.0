From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCHv6 2/5] Documentation: dt: add the omap hwspinlock bindings document
Date: Wed, 12 Nov 2014 17:16:37 +0200
Message-ID: <CAK=Wgba2hS6jwZ0+-YVPjjg2M9rTSccWmUEKYF_RMPoq14cxaw@mail.gmail.com>
References: <1410553499-55951-1-git-send-email-s-anna@ti.com> <1410553499-55951-3-git-send-email-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1410553499-55951-3-git-send-email-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Tony Lindgren <tony@atomide.com>, Josh Cartwright <joshc@codeaurora.org>, Bjorn Andersson <bjorn@kryo.se>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Suman,

On Fri, Sep 12, 2014 at 11:24 PM, Suman Anna <s-anna@ti.com> wrote:
> HwSpinlock IP is present only on OMAP4 and other newer SoCs,
> which are all device-tree boot only. This patch adds the
> DT bindings information for OMAP hwspinlock module.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../devicetree/bindings/hwlock/omap-hwspinlock.txt | 24 ++++++++++++++++++++++

I need an ACK from a DT maintainer here as well, please try to get it.

Thanks,
Ohad.

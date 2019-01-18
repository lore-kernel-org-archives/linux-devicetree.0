From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v3 0/4] Add MediaTek MUSB Controller Driver
Date: Fri, 18 Jan 2019 09:17:48 +0800
Message-ID: <1547774268.4433.238.camel@mhfsdcap03>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
         <20190117150053.GH18026@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117150053.GH18026@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com
List-Id: devicetree@vger.kernel.org

Hi Bin,

On Thu, 2019-01-17 at 09:00 -0600, Bin Liu wrote:
> On Thu, Jan 17, 2019 at 03:15:44PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > These patches introduce the MediaTek MUSB controller driver.
> > 
> > The driver can be configured as Dual-Role Device (DRD),
> > Peripheral Only and Host Only modes. This has beed tested on
> > MT2701 with a variety of devices in host mode and with the 
> > f_mass gadget driver in peripheral mode, plugging otg cables
> > in/out a lot of times in all possible imaginable plug orders.
> > 
> > changes in v3:
> 
> Please put the change log in each individual patch, which helps in
> viewing patches.

Okay.

> Regards,
> -Bin.

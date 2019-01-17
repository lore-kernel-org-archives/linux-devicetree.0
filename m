From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v3 0/4] Add MediaTek MUSB Controller Driver
Date: Thu, 17 Jan 2019 09:00:53 -0600
Message-ID: <20190117150053.GH18026@uda0271908>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: min.guo@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, hdegoede@redhat.com, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 03:15:44PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> These patches introduce the MediaTek MUSB controller driver.
> 
> The driver can be configured as Dual-Role Device (DRD),
> Peripheral Only and Host Only modes. This has beed tested on
> MT2701 with a variety of devices in host mode and with the 
> f_mass gadget driver in peripheral mode, plugging otg cables
> in/out a lot of times in all possible imaginable plug orders.
> 
> changes in v3:

Please put the change log in each individual patch, which helps in
viewing patches.

Regards,
-Bin.

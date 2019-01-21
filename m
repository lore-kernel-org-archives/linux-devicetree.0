From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v3 4/4] usb: musb: Add support for MediaTek musb controller
Date: Mon, 21 Jan 2019 09:08:37 +0800
Message-ID: <1548032917.4433.255.camel@mhfsdcap03>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
 <1547709348-17506-5-git-send-email-min.guo@mediatek.com>
 <20190117143342.GS5544@atomide.com> <1547792054.4433.254.camel@mhfsdcap03>
 <20190118133408.GA30080@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190118133408.GA30080@uda0271908>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bin Liu <b-liu@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yonglong Wu <yonglong.wu@mediatek.com>, hdegoede@redhat.com, Tony Lindgren <tony@atomide.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-01-18 at 07:34 -0600, Bin Liu wrote:
> Hi Min,
> 
> On Fri, Jan 18, 2019 at 02:14:14PM +0800, Min Guo wrote:
> > On Thu, 2019-01-17 at 06:33 -0800, Tony Lindgren wrote:
> > > Hi,
> > > 
> > > * min.guo@mediatek.com <min.guo@mediatek.com> [190117 07:16]:
> > > > There are some quirk of MediaTek musb controller, such as:
> > > >  -W1C interrupt status registers
> > > >  -Private data toggle registers
> > > >  -No dedicated DMA interrupt line
> > > 
> > > Can you please separate the musb generic changes listed above
> > > into separate individual patches in preparation for adding
> > > support for new hardware?
> > > 
> > > Otherwise we'll have hard time finding out with git bisect what
> > > exactly breaks things if we run into trouble.
> > 
> > Thanks for your suggestion.
> > I prepared to divide these changes into separate patches. Later, Mr.Bin
> > suggested not to do this.
> 
> Initially I thought the clearb/w() changes should be just a couple
> lines, so didn't think to separate it. But after reviewed the final
> implemenation, I agree Tony's comment is the right thing to do, please
> separate the musb core changes, each for clearb/w(), get/set_toggle(),
> and dma.

OKay.

> Regards,
> -Bin.

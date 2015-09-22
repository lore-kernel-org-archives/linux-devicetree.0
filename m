From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v2 00/10] USB: chipidea misc patches
Date: Tue, 22 Sep 2015 14:03:14 +0800
Message-ID: <20150922060313.GC20558@shlinux2>
References: <1438577238-10153-1-git-send-email-peter.chen@freescale.com>
 <20150805140813.GO12927@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150805140813.GO12927@tiger>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jun.li@freescale.com, pawel.moll@arm.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de, linux-usb@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 05, 2015 at 10:08:14PM +0800, Shawn Guo wrote:
> On Mon, Aug 03, 2015 at 12:47:08PM +0800, Peter Chen wrote:
> > Hi all,
> > 
> > In this series, I add several new interfaces for chipidea driver,
> > they are mainly for system configuration adjustment. The USB
> > performance may be improved with these configuration changing,
> > but each vendor driver owner needs to consult with your IC
> > owner which configuration parameters are suitable for your system
> > before changing it, and only change it if necessary.
> > 
> > The other changes are for imx, it shows how imx uses these interfaces.
> > Shawn, the patch [5/10] and [9/10] are dts changes, help to review it
> > please.
> 
> Ping me, after driver and bindings are accepted.  Then I will pick up
> the dts changes.
> 

Shawn, The driver and bingings have been accepted.
And I send v2 changes for you, which apply changes for imx6ul.

-- 

Best Regards,
Peter Chen

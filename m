From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: amba uarts - arm type uarts fifo size provided by device tree
Date: Thu, 19 Feb 2015 00:34:09 +0000
Message-ID: <20150219003409.GX8656@n2100.arm.linux.org.uk>
References: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20150218190601.GI29429@leverpostej> <54E4E916.1010009@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <54E4E916.1010009@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 02:33:42PM -0500, Jorge Ramirez-Ortiz wrote:
> On 02/18/2015 02:06 PM, Mark Rutland wrote:
> > Hi,
> >
> > Please Cc lakml for patches in this area in future.
> >
> > On Wed, Feb 18, 2015 at 06:53:11PM +0000, Jorge Ramirez-Ortiz wrote:
> >> [PATCH 1/2] Documentation: bindings: add optional fifo size property
> >> [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present
> >>
> >>
> >> These patches aim at resolving an issue present on some of the amba pl011
> >> uarts.  
> > Which systems are affected? Neither of your two patches add the property
> > to any dts file.
> 
> 
> yes, the system affected is still under revision (I should have mentioned)
> https://lkml.org/lkml/2015/2/5/144

Sorry, I can't follow that thread.  What FIFO size do your UARTs have?
What is the full ID of the UARTs?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.

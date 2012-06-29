From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] MXS: Add DT binding support into stmp3xxx-rtc
Date: Fri, 29 Jun 2012 19:30:49 +0800
Message-ID: <20120629113047.GD29197@S2101-09.ap.freescale.net>
References: <1339181804-22822-1-git-send-email-marex@denx.de>
 <20120625043711.GA18156@S2101-09.ap.freescale.net>
 <4FED8CA1.5000800@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FED8CA1.5000800-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2012 at 01:08:17PM +0200, Marc Kleine-Budde wrote:
> On 06/25/2012 06:37 AM, Shawn Guo wrote:
> > On Fri, Jun 08, 2012 at 08:56:44PM +0200, Marek Vasut wrote:
> >> Add simple binding for the stmp3xxx-rtc.
> >>
> >> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> >> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> > 
> > Hi Alessandro,
> > 
> > The patch has some changes on arch/arm/boot/dts/imx28.dtsi, and also we
> > need the patch to convert some board files over to device tree.  May I
> > have your ack to queue the patch on my tree?
> 
> The interrupt numbers are not as the driver expects them..
> 
Right.  I sent a v3 fixing it.

http://article.gmane.org/gmane.linux.drivers.devicetree/17133

-- 
Regards,
Shawn

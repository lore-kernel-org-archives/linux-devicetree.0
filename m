From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 00/14] add imx usb driver based on Greg next tree
Date: Mon, 25 Jun 2012 11:00:30 +0800
Message-ID: <20120625030029.GA4384@b20223-02.ap.freescale.net>
References: <1340260875-21934-1-git-send-email-richard.zhao@freescale.com>
 <4FE2CC37.8010202@pengutronix.de>
 <20120621085246.GC1582@b20223-02.ap.freescale.net>
 <4FE2E4FF.8030700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE2E4FF.8030700-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2012 at 11:10:23AM +0200, Marc Kleine-Budde wrote:
> On 06/21/2012 10:52 AM, Richard Zhao wrote:
> > On Thu, Jun 21, 2012 at 09:24:39AM +0200, Marc Kleine-Budde wrote:
> >> On 06/21/2012 08:41 AM, Richard Zhao wrote:
> >>> The work is based on  ci13xxx rework done by Alexander Shishkin.
> >>>
> >>> To let Greg pick up, I also added patches Alex queued that I depends on.
> >>> Patch #1 - #9 : It can also be found at
> >>> http://github.com/virtuoso/linux-ci.git ci
> >>>
> >>> This patch series can also be found at:
> >>> https://github.com/riczhao/kernel-imx/commits/topics/usb-driver
> >>>
> >>> Status:
> >>>   - this version only support host
> >>>   - usbotg controler works at host role
> >>
> >> I'm interested in usb device support on mx28, what has to be implemented
> >> to get it working?
> > I don't have patch yet, but on the plan.
> 
> What needs to be done? I want to help/implement it.
I didn't have time to look at details yet. Things in FSL kernel may find
a way to implement.

Thanks
Richard
> 
> Marc
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
> 

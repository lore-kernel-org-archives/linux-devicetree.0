From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/5] i.MX53 TVE clock patches
Date: Mon, 08 Apr 2013 18:17:18 +0200
Message-ID: <1365437838.6626.7.camel@pizza.hi.pengutronix.de>
References: <1365432383-7787-1-git-send-email-p.zabel@pengutronix.de>
 <CAOMZO5CjC4HEvZo7rqdN1inAz_=xif=5aANLPhB9oF_mygJeGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOMZO5CjC4HEvZo7rqdN1inAz_=xif=5aANLPhB9oF_mygJeGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Am Montag, den 08.04.2013, 12:26 -0300 schrieb Fabio Estevam:
> Hi Phiipp,
> 
> On Mon, Apr 8, 2013 at 11:46 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Hi,
> >
> > the first two are just cleanups, the following three patches are changes
> > to the i.MX53 clock tree that are necessary to use the TVEv2 module as
> > VGA output on the Freescale i.MX53-QSB or TQ MBa53 boards.
> 
> I would like to test this series on a mx53qsb.
>
> Is the TVE driver available in some git tree?

I have pushed the series for you at:

    git://git.pengutronix.de/git/pza/linux.git imx-ipu-tve/wip

regards
Philipp

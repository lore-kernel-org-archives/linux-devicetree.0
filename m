From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: issues calling of_platform_bus_probe() twice
Date: Sun, 18 Mar 2012 10:29:33 +1100
Message-ID: <1332026973.3105.191.camel@pasglop>
References: <31B4E554-FA95-431D-B353-92680CD14A0A@kernel.crashing.org>
 <1331933034.3105.171.camel@pasglop> <20120317072717.738953E08CE@localhost>
 <4F649304.9010001@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F649304.9010001-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
 Discuss" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org list" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2012-03-17 at 13:35 +0000, Tabi Timur-B04825 wrote:
> >>> >  >  Are you aware of any reason that we can't call
> of_platform_bus_probe()
> >>> >  >  or multiple times.  Timur's run into an issue in which all
> devices
> >>> >  >  don't get registered properly if we call
> of_platform_bus_probe() times
> >>> >  >  with different of_device_id struct's.
> >> >
> >> >  Nothing comes to mind... Grant ?
> > Neither for me.  Should work.
> 
> I posted a work-around patch here:
> 
> http://patchwork.ozlabs.org/patch/128533/
> 
> Without this patch, drivers cannot probe on DMA *channels*, or any
> other 
> grandchildren of the root node. 

Why don't you track down the actual bug instead ?

Cheers,
Ben.

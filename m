From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] DMA: Freescale: update driver to support 8-channel
 DMA engine
Date: Wed, 3 Jul 2013 11:41:31 -0500
Message-ID: <1372869691.8183.130@snotra>
References: <51D39EE0.1040901@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D39EE0.1040901-KZfg59tc24xl57MIdRCFDg@public.gmane.org> (from
 hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org on Tue Jul  2 22:47:44 2013)
Content-Disposition: inline
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
To: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vakul-KZfg59tc24xl57MIdRCFDg@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/02/2013 10:47:44 PM, Hongbo Zhang wrote:
> On 07/03/2013 07:13 AM, Scott Wood wrote:
>> Wait a second -- how are we even getting into this code on these new  
>> DMA controllers?  All 85xx-family DMA controllers use  
>> fsldma_chan_irq directly.
>> 
> Right, we are using fsldma_chan_irq, this code never run.
> I just see there is such code for elo/eloplus DMA controllers, so I  
> update it for the new 8-channel DMA.

That code is used for elo (e.g. mpc83xx DMA), but not eloplus.

-Scott

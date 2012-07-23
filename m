From: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Forcing PIO mode instead of DMA via DT property
Date: Mon, 23 Jul 2012 03:25:35 +0000
Message-ID: <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B4DAE@039-SN2MPN1-013.039d.mgd.msft.net>
References: <201207222328.27008.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207222328.27008.marex-ynQEQJNshbs@public.gmane.org>
Content-Language: en-US
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "pavel-ynQEQJNshbs@public.gmane.org" <pavel-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: devicetree-discuss [mailto:devicetree-discuss-
> bounces+poonam.aggrwal=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of Marek
> Vasut
> Sent: Monday, July 23, 2012 2:58 AM
> To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: pavel-ynQEQJNshbs@public.gmane.org; Wolfgang Denk
> Subject: Forcing PIO mode instead of DMA via DT property
> 
> Hi guys,
> 
> I'm trying to implement a driver that can do both DMA and PIO, and it
> would be nice if the user was able to select the mode (on a per-bus
> basis) using the DT.
> The PIO mode can reduce the overhead in some cases and therefore be
> better choice than the DMA (for example when most transfers move only
> very few data, or when board-specific hardware properties kick in).
> 
> I was thinking about using some "manf,use-pio" DT property, but I haven't
> found any such example yet, so I wonder if this is a good idea.
Not sure, but as far as I understand device tree is to publish the hardware capabilities, not the user choice/configuration.
One option would be to put a compile time flag in the driver, which prefers PIO than DMA.
I believe by default DMA is the first preference.

Regards
Poonam
> 
> What is your suggestion how I shoud address such a problem?
> 
> Thanks in advance!
> 
> Best regards,
> Marek Vasut
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

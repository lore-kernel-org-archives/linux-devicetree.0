From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Fri, 15 Jul 2011 16:45:38 +0000
Message-ID: <CAOZdJXVeM4Axf=TC4qKNHyqb=iDoDceGr-xjLNpD20WfL2h46Q@mail.gmail.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110715163254.GG1840-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Content-ID: <B546B0C96BC44A49B9DE3957120BF57C-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 11:32 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> First of all, using powerpc dma-channel binding on such dma event
> seems not reflecting the hardware facts. =A0Secondly, the binding in
> this case (below) looks silly. =A0Thirdly, device driver need to make
> code change for simply getting a dma event number.

Take a look at p1022ds.dts or mpc8610hpcd.dts.  We create separate DMA
channel nodes on Freescale PowerPC parts because the channels really
are independent.  On these two boards, some of the DMA channels are
used by the async DMA driver, and two of the channels are used by the
audio driver.  The compatible property is used to differentiate among
them.

-- =

Timur Tabi
Linux kernel developer at Freescale

From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Writing Device Tree Source (DTS)
Date: Mon, 23 Nov 2009 09:48:18 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA3057BD338@az33exm25.fsl.freescale.net>
References: <200911230858.nAN8vsWf006884@arlmailha04.patni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <200911230858.nAN8vsWf006884-QAxaCDP67tRcIBjhHP3Ktq0bRtRcJeJQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: amarjit.kumar-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: amarjit.kumar.mtech-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Mon, Nov 23, 2009 at 2:57 AM, Kumar Amarjit <amarjit.kumar-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org>
wrote:
>
> Hi All,
> We are using PowerPc440 core on our Soc that consists of PCIe core,
SAS core and many other things.
> We are writing DTS for our board to be used during booting, we have
gone through various dts files available inside the Linux Kernel 2.6.31.
> Our board is closets match with Taishan board.
> While referring the Taishan.dts, we are unable to get the information
regarding Interrupt-map and interrupt-map-mask property.
> Please refer to the snippet.......
> It would be great if anybody help me to understand the way they are
writing these properties?
> I also gone through the DTS document booting-without-of but that does
not help us, so anybody having any documents on How To Write DTS can
help me out.

Take a look at the ePAPR:
http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

See section 2.4 which discusses interrupts and interrupt
mapping.

This is not a how to, but explains the properties.

Stuart

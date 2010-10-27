From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: question about dma-ranges
Date: Wed, 27 Oct 2010 14:47:37 -0500
Message-ID: <4CC881D9.6020808@freescale.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306911C5F@az33exm25.fsl.freescale.net>	<4CC77784.2070701@firmworks.com>	<AANLkTikTu_p0-Uk7=FuUay4mvCEEU0e9V5eY6bjuK5RQ@mail.gmail.com>	<20101027024227.GD7023@yookeroo>
	<20101027144602.2c5ef098@udp111988uds.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101027144602.2c5ef098-N/eSCTBpGwP7j4BuCOFQISmX4OfbXNuMKnGXBo5VDl8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Scott Wood wrote:
> Or can the QE code just know about that because it only has 32-bit
> registers/descriptor fields for DMA addresses?  I.e. it is a limitation
> of all instances of QE, not just as integrated in this system.

It's a limitation of the QE registers -- they're only 32-bit.  If we ever
produce a new QE that has bigger registers, we can use the compatible property
to distinguish between them.

-- 
Timur Tabi
Linux kernel developer at Freescale

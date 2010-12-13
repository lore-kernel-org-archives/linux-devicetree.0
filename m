From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: microblaze console init
Date: Mon, 13 Dec 2010 12:59:47 -0600
Message-ID: <20101213125947.12a6db54@udp111988uds.am.freescale.net>
References: <4D03F229.9070403@home.nl>
	<AANLkTinw3mqpmiUkzf9Drgg+f+b3hFBUoHLmtWSO75GY@mail.gmail.com>
	<4D03F803.6060903@home.nl>
	<AANLkTi=Ys++TwYA_Z6-s_bsDbyw+wKgvPitwRahYmB3=@mail.gmail.com>
	<4D03FA1B.9040804@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D03FA1B.9040804-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 11 Dec 2010 23:24:27 +0100
Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org> wrote:

> On 12/11/10 11:18 PM, Grant Likely wrote:
> > Implement ranges translation in the flat tree code.  It wouldn't be
> > very hard, and will be a lot more maintainable in the long run.
> >
> > g.
> >
> I'll have a stab at it.

Some code for this exists in arch/powerpc/boot/devtree.c

-Scott

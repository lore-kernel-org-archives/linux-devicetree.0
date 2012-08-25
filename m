From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 16:06:48 +0200
Message-ID: <201208251606.48789.marex@denx.de>
References: <1345729313-10831-1-git-send-email-marex@denx.de>
 <1345899551.1815.10.camel@kyv>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345899551.1815.10.camel@kyv>
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
To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Artem Bityutskiy,

> On Thu, 2012-08-23 at 15:41 +0200, Marek Vasut wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> > 
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Cc: David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> Does not compile if (I think) OF is not enabled.
> 
> drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
> drivers/mtd/devices/m25p80.c:920:2: error: implicit declaration of function
> 'of_property_read_bool' [-Werror=implicit-function-declaration] cc1: some
> warnings being treated as errors
> make[4]: *** [drivers/mtd/devices/m25p80.o] Error 1

Argh, of course. Wrapping that part in ifdef CONFIG_OF should do the trick. So 
much for having CONFIG_OF on all the time.

Thanks!

Best regards,
Marek Vasut

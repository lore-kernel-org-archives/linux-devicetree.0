From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: vexpress: DT-based support for Cortex-A5 and
 Cortex-A9 based tiles
Date: Wed, 07 Dec 2011 23:50:26 +0100
Message-ID: <3031582.pcIGOLc7WK@wuerfel>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <27584177.XzoGq1stOI@wuerfel>
 <1323284788.32116.11.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323284788.32116.11.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 December 2011 19:06:28 Pawel Moll wrote:
> On Tue, 2011-12-06 at 23:13 +0000, Arnd Bergmann wrote:
> > Actually, I have to take that back. Looking at both patch 5 and 6,
> > the dt-ca*.c files are almost identical and all the differences are about stuff
> > that you can find in the device tree:
> 
> You are obviously right - I was rushing with that. Less is better then
> more  Will respin tomorrow.

Ok, great!

> > * The iotable gets initialized from "mrc p15, 4, %0, c15, c0, 0", which would
> > be fine if that worked on all machines, but in order to unify the two
> > files, I would recommend searching the flat device tree for the respective
> > node and only map it if present.
> > 
> > * You have two ways of finding out the number of cores, but looking in
> > the device tree would just work either way.
> 
> Those two are actually related, as it's all about memory mapped SCU in
> case of A5/A9 and CP15-controlled on A7/15 (the *smp_enable() is
> different as well).
> 
> I'll probably just define a "scu" node compatible with
> "arm,cortex-a9-scu" and use the A5/A9 SMP callbacks if it's present (and
> create static mapping for it) or the A7/15 if it's missing.

Fair enough.

	Arnd

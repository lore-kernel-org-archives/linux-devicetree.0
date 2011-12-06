From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: vexpress: DT-based support for Cortex-A5 and
 Cortex-A9 based tiles
Date: Wed, 07 Dec 2011 00:13:20 +0100
Message-ID: <27584177.XzoGq1stOI@wuerfel>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <1323186229-22054-6-git-send-email-pawel.moll@arm.com>
 <3527082.WMy5vX2qZB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3527082.WMy5vX2qZB@wuerfel>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 December 2011 23:53:46 Arnd Bergmann wrote:
> On Tuesday 06 December 2011 15:43:48 Pawel Moll wrote:
> > This patch adds Flattened Device Trees based support for ARM Ltd.
> > Versatile Express platforms based on Cortex-A5 and Cortex-A9
> > processors.
> > 
> > Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Actually, I have to take that back. Looking at both patch 5 and 6,
the dt-ca*.c files are almost identical and all the differences are about stuff
that you can find in the device tree:

* The iotable gets initialized from "mrc p15, 4, %0, c15, c0, 0", which would
be fine if that worked on all machines, but in order to unify the two
files, I would recommend searching the flat device tree for the respective
node and only map it if present.

* You have two ways of finding out the number of cores, but looking in
the device tree would just work either way.

* You set the twd_base unconditionally on a5/a9 but never on a7/a15.
This looks correct, but you could just as well see if a twd node exists
and use its base address.

* You only initialize the l2x0 on a5/a9. If a7/a15 don't have a matching
l2x0 device, then calling the same function unconditionally should be harmless.

	Arnd

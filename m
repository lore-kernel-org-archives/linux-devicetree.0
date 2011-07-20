From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
Date: Wed, 20 Jul 2011 08:52:36 +0300
Message-ID: <1311141162.20738.159.camel@sauron>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
	<20110715025407.GF2927@ponder.secretlab.ca>
	<20110715044919.GB1840@S2100-06.ap.freescale.net>
	<1311136844.20738.131.camel@sauron>
	<20110720045547.GA5766@S2100-06.ap.freescale.net>
	<1311139071.20738.147.camel@sauron>
	<20110720052824.GB5766@S2100-06.ap.freescale.net>
	<1311139971.20738.154.camel@sauron>
	<20110720055228.GC5766@S2100-06.ap.freescale.net>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110720055228.GC5766-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2011-07-20 at 13:52 +0800, Shawn Guo wrote:
> The argument about this #ifdef thing was the driver could be used by
> some platforms that will never migrate to device tree.  This table
> will be just a waste of bytes for those platforms, if we do not
> protect the table by '#ifdef CONFIG_OF'.

OK, anyway, I picked your v2 already and less bytes wastage is a good
enough argument.

-- 
Best Regards,
Artem Bityutskiy

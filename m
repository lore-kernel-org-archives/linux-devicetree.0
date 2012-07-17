From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Tue, 17 Jul 2012 13:45:56 +0000
Message-ID: <201207171345.56988.arnd@arndb.de>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <201207171307.23514.arnd@arndb.de> <2808767.4NLQARgpQ0@flexo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2808767.4NLQARgpQ0@flexo>
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
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 17 July 2012, Florian Fainelli wrote:
> On Tuesday 17 July 2012 13:07:23 Arnd Bergmann wrote:

> > But is there much difference between the two? How much code would
> > actually get built for one chip but not the other? If all the
> > differences can be run-time detected from the device tree, I
> > think it's better to not have different compile-time options at
> > all.
> 
> The big difference between the two is actually the CPU core, for MCS8140 they 
> used a genuine ARM926EJS and for MCS8142 they actually use a FA526 core.

Ok, I see. That probably is enough difference to justify separate Kconfig
statements, especially since building a combined ARMv4/v5 kernel has some
overhead compared to supporting just one of the two.

	Arnd

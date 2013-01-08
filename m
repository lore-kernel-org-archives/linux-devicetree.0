From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: machine_is_dt() ?
Date: Tue, 8 Jan 2013 08:48:57 +0800
Message-ID: <20130108004855.GE29281@S2101-09.ap.freescale.net>
References: <20130106131805.GQ17242@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130106131805.GQ17242-g2DYL2Zd6BY@public.gmane.org>
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
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 06, 2013 at 02:18:05PM +0100, Andrew Lunn wrote:
> Hi Folks
> 
> I'm moving the cpuidle code for Kirkwood into drivers/cpuidle. I'm
> following the way cpuidle-calxeda.c instantiates the driver, it uses
> module_init(calxeda_cpuidle_init) and calxeda_cpuidle_init() uses
> of_machine_is_compatible("calxeda,highbank") so only loading the
> driver in a ARCH_MULTIPLATFORM kernel when needed.

A little bit off the topic, but I want to understand if moving cpuidle
driver out of arch/arm is the right direction.  From what I have seen,
more or less, cpuidle drivers generally have dependency on platform
code.  Looking at cpuidle-calxeda.c, I found though it does not include
any <mach/*> header, the following two extern declarations tell that
it actually needs to.

extern void highbank_set_cpu_jump(int cpu, void *jump_addr);
extern void *scu_base_addr;

Shawn

From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: machine_is_dt() ?
Date: Sun, 6 Jan 2013 14:18:05 +0100
Message-ID: <20130106131805.GQ17242@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
To: linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Folks

I'm moving the cpuidle code for Kirkwood into drivers/cpuidle. I'm
following the way cpuidle-calxeda.c instantiates the driver, it uses
module_init(calxeda_cpuidle_init) and calxeda_cpuidle_init() uses
of_machine_is_compatible("calxeda,highbank") so only loading the
driver in a ARCH_MULTIPLATFORM kernel when needed.

I can follow this model for when kirkwood is booted using device
tree. However, i would also like to use the driver for those boards
which are not yet converted to DT. In that situation, we have a kernel
dedicate to kirkwood and the cpuidle driver is always relevant.

Thus i need to code something like:

(of_machine_is_compatible("marvell, kirkwood") ||
 !machine_is_dt())

However, there is no macro machine_is_dt().

Is there a way to tell if a machine has been booted using a machine
number as opposed to DT?

Thanks
       Andrew

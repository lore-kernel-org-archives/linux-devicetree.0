From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Sharing *.dtsi between Linux architectures?
Date: Fri, 12 Jul 2013 13:58:35 -0600
Message-ID: <51E05FEB.1090308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Is there a (possibly just proposed) mechanism in place to allow *.dts
from multiple Linux architectures to share common *.dtsi files?

As an example, consider two SoCs that are identical except for the CPU
complex. One uses an ARMv7 CPU (DTs in arch/arm/boot/dts/) and the other
uses some ARMv8 CPU (DTs in arch/am64/boot/dts/). It'd be useful to
define all the SoC components in some common .dtsi file to avoid
duplication, and have both arch/arm/boot/dts/tegraXXX.dtsi and
arch/arm64/boot/dts/tegraYYY.dtsi include that and add the relevant
CPU-related nodes.

I could imagine creating one of the following paths for this purpose:

arch/common/dts/
include/dt-common/
include/dtsi/

... or perhaps re-using the existing:

include/dt-bindings/

... although my original intent for that last location was just to house
header files that define constants that are part of binding definitions,
rather than actual structural content.

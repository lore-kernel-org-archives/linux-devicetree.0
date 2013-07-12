From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Sharing *.dtsi between Linux architectures?
Date: Sat, 13 Jul 2013 04:23:36 +0800
Message-ID: <0A6B2945-FE3B-4CF9-BB4B-0ED9126D5A27@jcrosoft.com>
References: <51E05FEB.1090308@wwwdotorg.org> <51E06475.6010006@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51E06475.6010006@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org


On Jul 13, 2013, at 4:17 AM, Rob Herring <robherring2@gmail.com> wrote:

> On 07/12/2013 02:58 PM, Stephen Warren wrote:
>> Is there a (possibly just proposed) mechanism in place to allow *.dts
>> from multiple Linux architectures to share common *.dtsi files?
> 
> Nothing proposed yet. There was some discussion at Connect (which I
> missed part of). We're certainly going to start to have that issue
> between arm and arm64 as well as probably FSL powerpc and arm.
> 
> I would like to move all dts files out of arch. I think we should think
> about how we construct a separate dts repository and then move the
> kernel structure in that direction (it's still believed there is too
> much interdependency to have separate repo yet). I don't think cpu
> architecture is the right top level structure for dts files. Probably
> something by vendor and/or SOC family is more appropriate. Then you have
> to figure out how to handle board vs. chip vendors.
> 
>> As an example, consider two SoCs that are identical except for the CPU
>> complex. One uses an ARMv7 CPU (DTs in arch/arm/boot/dts/) and the other
>> uses some ARMv8 CPU (DTs in arch/am64/boot/dts/). It'd be useful to
>> define all the SoC components in some common .dtsi file to avoid
>> duplication, and have both arch/arm/boot/dts/tegraXXX.dtsi and
>> arch/arm64/boot/dts/tegraYYY.dtsi include that and add the relevant
>> CPU-related nodes.
>> 
>> I could imagine creating one of the following paths for this purpose:
>> 
>> arch/common/dts/
>> include/dt-common/
>> include/dtsi/
>> 
>> ... or perhaps re-using the existing:
>> 
>> include/dt-bindings/
>> 
>> ... although my original intent for that last location was just to house
>> header files that define constants that are part of binding definitions,
>> rather than actual structural content.
> 
> I think we should stick with defines there.

I think it's to do it how move the dt simple in dt directory at the root of
the kernel tree

this will simplify the move to out of tree

and include/dt-bindings/ to dt/include/dt-bindings/ and just handle the include
via a -i in the Makefile

Best Regards,
J.
> 
> Rob
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

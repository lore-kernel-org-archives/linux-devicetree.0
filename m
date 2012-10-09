From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ARM_ATAG_DTB_COMPAT fails on fdt_ro.c compiling
Date: Tue, 09 Oct 2012 10:15:54 -0600
Message-ID: <50744DBA.3070900@wwwdotorg.org>
References: <20121009031715.GC21822@S2101-09.ap.freescale.net>
 <alpine.LFD.2.02.1210090018470.16518@xanadu.home>
 <20121009050109.GD21822@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121009050109.GD21822-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2012 11:01 PM, Shawn Guo wrote:
> On Tue, Oct 09, 2012 at 12:25:44AM -0400, Nicolas Pitre wrote:
>> On Tue, 9 Oct 2012, Shawn Guo wrote:
>>
>>> I have seen this error on mainline for a couple days when
>>> ARM_ATAG_DTB_COMPAT is enabled.
>>>
>>>   CC      arch/arm/boot/compressed/fdt_ro.o
>>> arch/arm/boot/compressed/fdt_ro.c: In function =91fdt_path_offset=92:
>>> arch/arm/boot/compressed/fdt_ro.c:172:3: error: implicit declaration of=
 function =91fdt_get_alias_namelen=92 [-Werror=3Dimplicit-function-declarat=
ion]
>>> arch/arm/boot/compressed/fdt_ro.c:172:5: warning: assignment makes poin=
ter from integer without a cast [enabled by default]
>>> arch/arm/boot/compressed/fdt_ro.c: At top level:
>>> arch/arm/boot/compressed/fdt_ro.c:340:13: error: conflicting types for =
=91fdt_get_alias_namelen=92
>>> arch/arm/boot/compressed/fdt_ro.c:172:7: note: previous implicit declar=
ation of =91fdt_get_alias_namelen=92 was here
>>> cc1: some warnings being treated as errors
>>
>> I just tried building mainline now.  It is at commit f5a246eab9.
>>
> The build still fails for me at this commit.

I can't reproduce this.

I tried both my local next-20121005-based dev branch and that exact
commit above. I tried both the crosstool-ng-based compiler I normally
use and Ubuntu 10.04's ARM compiler (possibly from a PPA). In both
cases, I ran git clean -f -d -x ; git reset --hard HEAD first, and then
build zImage, dtbs, and modules, and of course used your attached .config.

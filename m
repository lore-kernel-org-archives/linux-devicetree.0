From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 4/4] dtc/libfdt: sparse fixes
Date: Sun, 06 Jan 2013 15:58:52 -0600
Message-ID: <E1TryF2-0000M2-S1@jdl.com>
References: <20121113183430.472a0d989815fbd73ee9b437@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20121113183430.472a0d989815fbd73ee9b437-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> libfdt/fdt.c:104:28: warning: incorrect type in argument 1 (different base types)
> libfdt/fdt.c:104:28:    expected restricted fdt32_t [usertype] x
> libfdt/fdt.c:104:28:    got unsigned int const [unsigned] [usertype] <noident>
> libfdt/fdt.c:124:40: warning: incorrect type in argument 1 (different base types)
> libfdt/fdt.c:124:40:    expected restricted fdt32_t [usertype] x
> libfdt/fdt.c:124:40:    got unsigned int const [unsigned] [usertype] <noident>
> libfdt/fdt_ro.c:337:29: warning: incorrect type in argument 1 (different base types)
> libfdt/fdt_ro.c:337:29:    expected restricted fdt32_t [usertype] x
> libfdt/fdt_ro.c:337:29:    got unsigned int const [unsigned] [usertype] <noident>
> libfdt/fdt_rw.c:370:17: warning: incorrect type in assignment (different base types)
> libfdt/fdt_rw.c:370:17:    expected unsigned int [unsigned] [usertype] <noident>
> libfdt/fdt_rw.c:370:17:    got restricted fdt32_t
> libfdt/fdt_sw.c:164:13: warning: incorrect type in assignment (different base types)
> libfdt/fdt_sw.c:164:13:    expected unsigned int [unsigned] [usertype] <noident>
> libfdt/fdt_sw.c:164:13:    got restricted fdt32_t
> libfdt/fdt_sw.c:227:14: warning: incorrect type in assignment (different base types)
> libfdt/fdt_sw.c:227:14:    expected unsigned int [unsigned] [usertype] <noident>
> libfdt/fdt_sw.c:227:14:    got restricted fdt32_t
> libfdt/fdt_wip.c:80:20: warning: incorrect type in assignment (different base types)
> libfdt/fdt_wip.c:80:20:    expected unsigned int [unsigned] [usertype] <noident>
> libfdt/fdt_wip.c:80:20:    got restricted fdt32_t
> libfdt/libfdt.h:1001:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:1001:13:    expected unsigned long [unsigned] [usertype] val
> libfdt/libfdt.h:1001:13:    got restricted fdt64_t
> libfdt/libfdt.h:1157:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:1157:13:    expected unsigned int [unsigned] [usertype] val
> libfdt/libfdt.h:1157:13:    got restricted fdt32_t
> libfdt/libfdt.h:1192:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:1192:13:    expected unsigned long [unsigned] [usertype] val
> libfdt/libfdt.h:1192:13:    got restricted fdt64_t
> libfdt/libfdt.h:1299:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:1299:13:    expected unsigned int [unsigned] [usertype] val
> libfdt/libfdt.h:1299:13:    got restricted fdt32_t
> libfdt/libfdt.h:1334:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:1334:13:    expected unsigned long [unsigned] [usertype] val
> libfdt/libfdt.h:1334:13:    got restricted fdt64_t
> libfdt/libfdt.h:885:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:885:13:    expected unsigned int [unsigned] [usertype] val
> libfdt/libfdt.h:885:13:    got restricted fdt32_t
> libfdt/libfdt.h:920:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:920:13:    expected unsigned long [unsigned] [usertype] val
> libfdt/libfdt.h:920:13:    got restricted fdt64_t
> libfdt/libfdt.h:996:13: warning: incorrect type in assignment (different base types)
> libfdt/libfdt.h:996:13:    expected unsigned int [unsigned] [usertype] val
> libfdt/libfdt.h:996:13:    got restricted fdt32_t
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied.

Thanks,
jdl

From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v4 3/4] dtc/libfdt: introduce fdt types for annotation by
 endian checkers
Date: Sun, 06 Jan 2013 15:52:36 -0600
Message-ID: <E1Try8y-0000Jz-UZ@jdl.com>
References: <E1TYeB5-0003oB-IS@jdl.com>
 <1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
 <1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
 <20121115044340.GI32290@truffula.fritz.box>
 <20121114231204.8f19082c7acc1cea2a2d794f@freescale.com>
 <20121119023039.GK5735@truffula.fritz.box>
 <20121128173301.2b52b22a39fe6c3ce5a088fb@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20121128173301.2b52b22a39fe6c3ce5a088fb-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Projects such as linux and u-boot run sparse on libfdt.  libfdt
> contains the notion of endianness via usage of endian conversion
> functions such as fdt32_to_cpu.  As such, in order to pass endian
> checks, libfdt has to annotate its fdt variables such that sparse
> can warn when mixing bitwise and regular integers.  This patch adds
> these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
> defines), includes the bitwise annotation.
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied.

Thanks,
jdl

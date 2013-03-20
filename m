From: "Markus Mayer" <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/1] Makefile: build asm-generic before building scripts
Date: Tue, 19 Mar 2013 17:27:33 -0700
Message-ID: <1363739254-9425-1-git-send-email-mmayer@broadcom.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

Last week I came across the issue that building "dtbs" for ARM in a recent
(3.9-rcX) kernel fails if it's done in a clean tree, right after "make
xxx_defconfig". I am quite certain that this used to work in 3.8. The error is
"asm/types.h not found". The problem does not happen if "zImage" is built first
and "dtbs" is built second.

Eventually, I found that the root cause seems to be that "asm-generic" is not
a dependency for "dtbs" or, rather, "scripts" in the top-level makefile.
Building target "zImage" will implicitly build "asm-generic", and subsequent
"dtbs" builds will therefore succeed.

The proposed patch adds "asm-generic" as dependency of the "scripts" target.
I don't know if the proposed solution is the best possible. It does, however,
work for me.

Regards,
-Markus

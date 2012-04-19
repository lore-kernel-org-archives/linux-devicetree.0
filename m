From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] fdt: Adjust Makefile to find .dtsi include files
Date: Thu, 19 Apr 2012 20:29:33 +0200
Message-ID: <20120419182933.CDE17202B35@gemini.denx.de>
References: <1334845777-30913-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1334845777-30913-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Simon Glass,

In message <1334845777-30913-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> you wrote:
> The device tree compiler now has an option to specify the search path
> for its files. Use this option when compiling in preference to
> pre-processing the file.
> 
> Update Tegra here also to prevent build breakage.
> 
> This requires a recent dtc (commit de6b762 in git://jdl.com/software/dtc.git).
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  board/nvidia/dts/tegra2-seaboard.dts |    2 +-
>  dts/Makefile                         |    8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)

NAK.  THis breaks building on all systems that use the
distribution-provided DTC with this error:

	dtc: invalid option -- 'i'


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
"What if" is a trademark of Hewlett Packard, so stop using it in your
sentences without permission, or risk being sued.

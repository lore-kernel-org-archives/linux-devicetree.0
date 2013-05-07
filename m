From: Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v4 06/19] libfdt: Add fdt_next_subnode() to permit
 easy subnode iteration
Date: Tue, 07 May 2013 17:48:11 -0400
Message-ID: <5189769B.5060708@gmail.com>
References: <1367943123-16013-1-git-send-email-sjg@chromium.org>
 <1367943123-16013-7-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367943123-16013-7-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Simon,

On 05/07/2013 12:11 PM, Simon Glass wrote:
> Iterating through subnodes with libfdt is a little painful to write as we
> need something like this:

[snip]

> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> (Cherry-picked from dtc commit 4e76ec79)

Acked-by: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>

Unless I hear otherwise, I'll drop this patch from my u-boot-fdt repo 
and let you (Tom?) apply it with the "sandbox" patch series since that 
is where it came from and where it logically belongs.

> ---
> Changes in v4:
> - Bring in upstream version of fdt_first/next_subnode()
>
> Changes in v3: None
> Changes in v2: None
>
>   include/libfdt.h | 22 ++++++++++++++++++++++
>   lib/libfdt/fdt.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)

Thanks,
gvb

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 08/20] fdt: Add staging area for device tree binding
 documentation
Date: Wed, 18 Jan 2012 15:30:06 -0700
Message-ID: <4F1747EE.6020805@nvidia.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
 <1326342789-5781-9-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326342789-5781-9-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/11/2012 09:32 PM, Simon Glass wrote:
> Add a directory to hold device tree binding files, to permit easy review
> of this material in U-Boot patches.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> diff --git a/doc/device-tree-bindings/README b/doc/device-tree-bindings/README

> +The intent is not to commit these files to U-Boot, or at least only
> +temporarily, Rather we hope that the files will be stored in another
> +repo (shared with Linux) which is brought in as needed. Failing that,
> +changes here will be  commited to the Linux
> +Documentation/devicetree/bindings/ directory.

Given there is no shared repo right now, I'd assert we should be
specific and explicitly state that the intent /is/ to check in the
binding documentation here, and mirror the kernel tree.

But, the patch is fine to me as-is if you wish.

-- 
nvpublic

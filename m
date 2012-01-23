From: Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 1/2] fdt: Add fdtdec_find_aliases() to deal
 with alias nodes
Date: Sun, 22 Jan 2012 21:04:07 -0500
Message-ID: <4F1CC017.1090501@gmail.com>
References: <1326824452-14786-1-git-send-email-sjg@chromium.org>
 <1326824452-14786-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326824452-14786-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/17/2012 01:20 PM, Simon Glass wrote:
> Stephen Warren pointed out that we should use nodes whether or not they
> have an alias in the /aliases section. The aliases section specifies the
> order so far as it can, but is not essential. Operating without alisses

Nitpick: aliases

> is useful when the enumerated order of nodes does not matter (admittedly
> rare in U-Boot).
> 
> This is considerably more complex, and it is important to keep this
> complexity out of driver code. This patch creates a function
> fdtdec_find_aliases() which returns an ordered list of node offsets
> for a particular compatible ID, taking account of alias nodes.
> 
> Signed-off-by: Simon Glass<sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>

Thanks,
gvb

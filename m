From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add a registry of vendor prefixes
Date: Thu, 22 Sep 2011 10:00:23 +0200
Message-ID: <4E7AEB17.9010009@atmel.com>
References: <20110921152324.15993.96272.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110921152324.15993.96272.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

Le 21/09/2011 17:23, Grant Likely :
> There is no centralized listing for the in-use vendor prefixes
> used in compatible strings and property names.  This patch adds one.
> New prefixes should get added to this list to reduce the likelyhood
> of namespace collisions.
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   38 ++++++++++++++++++++
>  1 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> new file mode 100644
> index 0000000..81465c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -0,0 +1,38 @@
> +Device tree binding vendor prefix registry.  Keep list in alphabetical order.
> +
> +This isn't an exhaustive list, but you should add new prefixes to it before
> +using them to avoid name-space collisions.
> +
> +adi	Analog Devices, Inc.
> +amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
> +apm	Applied Micro Circuits Corporation (APM)
> +arm	ARM Ltd.

Can we add:
+atmel	Atmel Corporation

I am working on a revival of patches that I have cooked at Linaro
Connect for AT91...

Best regards,
-- 
Nicolas Ferre

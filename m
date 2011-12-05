From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: vexpress: Add DT support in v2m
Date: Mon, 5 Dec 2011 16:25:31 +0000
Message-ID: <20111205162520.GA27547@localhost.localdomain>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322579473-8804-4-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 03:11:11PM +0000, Pawel Moll wrote:
> This patch provides hooks for DT-based tile machine implementations
> and adds Device Tree description for the motherboard.

[...]

> +static struct of_dev_auxdata v2m_dt_auxdata_lookup[] __initdata = {
> +	OF_DEV_AUXDATA("arm,vexpress-flash", V2M_NOR0, "physmap-flash",
> +			&v2m_flash_data),
> +	OF_DEV_AUXDATA("arm,primecell", V2M_MMCI, "mb:mmci", &v2m_mmci_data),
> +	{}

Are we missing some AUXDATA here?  I thought we had a lot more drivers
which are not converted to OF, such as ambakmi and many more.

I notice some things explicitly failing, e.g.:

clcd-pl11x: probe of 10020000.clcd failed with error -22
clcd-pl11x: probe of 1001f000.clcd failed with error -22

...I haven't tracked down exactly what is going on here, yet.

Cheers
---Dave

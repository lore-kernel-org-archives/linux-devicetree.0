From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 3/6] ARM: vexpress: Add DT support for the motherboard
Date: Wed, 07 Dec 2011 23:49:18 +0100
Message-ID: <47277884.EQ6QaTZjNt@wuerfel>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <1323186229-22054-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323186229-22054-4-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 December 2011 15:43:46 Pawel Moll wrote:
> +
> +static struct of_dev_auxdata v2m_dt_auxdata_lookup[] __initdata = {
> +       OF_DEV_AUXDATA("arm,vexpress-flash", V2M_NOR0, "physmap-flash",
> +                       &v2m_flash_data),
> +       OF_DEV_AUXDATA("arm,primecell", V2M_MMCI, "mb:mmci", &v2m_mmci_data),
> +       {}
> +};
> 

One more thing I noticed. While I'm not familiar with the progress on
device driver conversion, I think you should be using the physmap_of
driver instead of physmap, which will remove the need for the
platform data.

For mmci, it should not be hard to do change the driver so it
understands the device tree, too. The easiest implementation for
that would be to add some code into mmci_probe and allocate
an mmci_platform_data structure that gets filled with the required
attributes.

	Arnd

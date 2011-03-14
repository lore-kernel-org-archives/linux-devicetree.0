From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/7] support sdhci-esdhc-imx as an OF device
Date: Mon, 14 Mar 2011 23:46:52 +0800
Message-ID: <20110314154651.GB3674@S2101-09.ap.freescale.net>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300112759-3495-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to something I should not put on git send-email command, the
following CC setting did not work for this patch set.

[sendemail]
       cc = patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Sorry.  I will be careful next time.

-- 
Regards,
Shawn

On Mon, Mar 14, 2011 at 10:25:52PM +0800, Shawn Guo wrote:
> This patch set is to support sdhci-esdhc-imx as an OF device.  As
> there is already powerpc based esdhc OF support, it chose to add OF
> support for imx esdhc driver in a different way from what sdhci-tegra
> did.  
> 
> It consolidates sdhci_pltfm_data sdhci_of_data into sdhci_data and get
> sdhci-esdhc-imx work with both platform bus and OF.
> 

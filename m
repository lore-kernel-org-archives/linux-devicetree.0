From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PULL] of nand generic binding
Date: Wed, 29 Feb 2012 16:25:34 +0100
Message-ID: <20120229152534.GH3318@game.jcrosoft.org>
References: <20120217155707.GR1214@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120217155707.GR1214-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16:57 Fri 17 Feb     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> HI,
> 
> 	please find attached the generic binding for the MTD nand
> 
> 	This will add boolean and nand helpers
is it ok?

Best Regards,
J.
> 
> The following changes since commit d65b4e98d7ea3038b767b70fe8be959b2913f16d:
> 
>   Linux 3.3-rc3 (2012-02-08 19:21:53 -0800)
> 
> are available in the git repository at:
>   git://github.com/at91linux/linux-at91.git for-grant-dt
> 
> Jean-Christophe PLAGNIOL-VILLARD (2):
>       of: introduce helper to manage boolean
>       of/mtd/nand: add generic bindings and helpers
> 
>  Documentation/devicetree/bindings/mtd/nand.txt |    7 ++
>  drivers/of/Kconfig                             |    4 +
>  drivers/of/Makefile                            |    1 +
>  drivers/of/base.c                              |   30 ++++++++
>  drivers/of/of_mtd.c                            |   85 ++++++++++++++++++++++++
>  include/linux/of.h                             |    8 ++
>  include/linux/of_mtd.h                         |   19 +++++
>  7 files changed, 154 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand.txt
>  create mode 100644 drivers/of/of_mtd.c
>  create mode 100644 include/linux/of_mtd.h
> 
> Best Regards,
> J.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

From: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Mon, 24 Jun 2013 11:47:05 +0200
Message-ID: <51C81599.3020407@nsn.com>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
 <1369753729-12997-3-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369753729-12997-3-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
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
To: ext Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

On 05/28/2013 05:08 PM, ext Jean-Christophe PLAGNIOL-VILLARD wrote:
> Today in the current of implementation we populate all the ressources
> at of_platform_populate time. But this leed to a chicken-egg dilemat
> some the irq present in DT are from platform_device too. And you can
> not resolve them as of_platform_populate. So delay the populate of irq
> at platform_drv_probe.
> 
> And if the irq_domain is not yet present just defer the probe (GPIO as example)
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

Tested-by: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>

Tested the whole series. This is definitely a necessary feature.
I've tested it on MIPS64 system with merge-able device-subtrees.
If you would come with the new patch series, please put me on CC, I'll test it again.

> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/base/platform.c     |    5 +++++
>  drivers/of/platform.c       |   29 +++++++++++++++++++++++++++--
>  include/linux/of_platform.h |    7 +++++++
>  3 files changed, 39 insertions(+), 2 deletions(-)

...

-- 
Best regards,
Alexander Sverdlin.

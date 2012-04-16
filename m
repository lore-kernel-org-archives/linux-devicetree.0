From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 21:51:58 +0530
Message-ID: <CAOh2x=mptNGkRB-+930Uim=Op9erOxreeTL=3+qfoFeVpWNEYQ@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
 <201204161442.38725.arnd@arndb.de>
 <CACxGe6tec7y-9VNb9vNiPZhN6bt5MuMV0J18P_7Gk_pDwk-V=Q@mail.gmail.com>
 <CAOh2x=n0NfovyfCpcdoMo2a7yLtb=imm1U+R-1L-2ihZ52FUhw@mail.gmail.com>
 <CACxGe6tZhdvoJ60N8g5-P4UHWxB=699_bA2omEQa77u1hEEPrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tZhdvoJ60N8g5-P4UHWxB=699_bA2omEQa77u1hEEPrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/16/12, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> It isn't recommended anymore. Use the bus_type specific helpers instead.

Ok. So here is fixup for 3/5 of this patchset.

@Linus: I will merge this with PACH 3/5 and send pull request to Arnd.

fixup! pinctrl: Add SPEAr pinctrl drivers

---
 drivers/pinctrl/spear/pinctrl-spear.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c
b/drivers/pinctrl/spear/pinctrl-spear.c
index ad70be7..3ec53df 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -289,18 +289,23 @@ int __devinit spear_pinctrl_probe(struct
platform_device *pdev,
 		struct spear_pinctrl_machdata *machdata)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct resource *res;
 	struct spear_pmx *pmx;

 	if (!machdata)
 		return -ENODEV;

+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx) {
 		dev_err(&pdev->dev, "Can't alloc spear_pmx\n");
 		return -ENOMEM;
 	}

-	pmx->vbase = devm_of_iomap(&pdev->dev, 0);
+	pmx->vbase = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!pmx->vbase) {
 		dev_err(&pdev->dev, "Couldn't ioremap at index 0\n");
 		return -ENODEV;

From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] extcon: palmas: rename device tree binding matching
 with file name
Date: Mon, 08 Jul 2013 10:34:29 +0900
Message-ID: <51DA1725.3070403@samsung.com>
References: <1373032792-29001-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1373032792-29001-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: myungjoo.ham@samsung.com, gregkh@linuxfoundation.org, kishon@ti.com, gg@slimlogic.co.uk, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 07/05/2013 10:59 PM, Laxman Dewangan wrote:
> The driver name is extcon/extcon-palmas.c and hence renaming the
> device tree binding document to extcon-palmas.txt.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  .../extcon/{extcon-twl.txt => extcon-palmas.txt}   |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/extcon/{extcon-twl.txt => extcon-palmas.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-twl.txt b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/extcon/extcon-twl.txt
> rename to Documentation/devicetree/bindings/extcon/extcon-palmas.txt
> 

Applied patch1 and patch2.

You can check it on following git repo:
- git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git (extcon-linus)

Thanks,
Chanwoo Choi

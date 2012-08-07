From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
Date: Tue, 07 Aug 2012 16:34:40 +0200
Message-ID: <50212780.5000809@denx.de>
References: <1343632944-25971-1-git-send-email-hs@denx.de>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1343632944-25971-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
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
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 30.07.2012 09:22, Heiko Schocher wrote:
> add OF support for the davinci nand controller.
>
> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: David Woodhouse<dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>
> Cc: Scott Wood<scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> ---
> - changes for v2:
>    - add comments from Scott Wood:
>      - add "ti,davinci-" prefix
>      - Dashes are preferred to underscores
>      - rename "nandflash" to "nand"
>      - introduce new "ti,davinci" specific properties for setting
>        up ecc_mode, ecc_bits, options and bbt options, instead
>        using linux defines
>      - readme fixes
> - no changes for v3
> - changes for v4
>    remove "pinmux-handle" property as discussed here:
>    http://www.spinics.net/lists/arm-kernel/msg175701.html
>    with Nori Sekhar
> - no changes for v5
>
> - changes for v6:
>    add comments from Sekhar Nori:
>    - remove unnecessary includes
>    - use devm_kzalloc instead of kzalloc
>    - remove AEMIF timing specific bindings, as
>      this has to be done later.
>
>   .../devicetree/bindings/arm/davinci/nand.txt       |   51 ++++++++++++++
>   drivers/mtd/nand/davinci_nand.c                    |   72 +++++++++++++++++++-
>   2 files changed, 122 insertions(+), 1 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt

ping ... any comments?

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

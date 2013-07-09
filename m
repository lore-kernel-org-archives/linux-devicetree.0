From: Graeme Gregory <gg@slimlogic.co.uk>
Subject: Re: [PATCH 0/4] extcon: palmas: clean-up/fixes and suspend/resume
 susupport.
Date: Tue, 9 Jul 2013 14:17:07 +0100
Message-ID: <20130709131707.GA2078@mint>
References: <1373375064-12012-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1373375064-12012-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, devicetree-discuss@lists.ozlabs.org, rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com
List-Id: devicetree@vger.kernel.org

Whole series looks good to me.

Acked-by: Graeme Gregory <gg@slimlogic.co.uk>

On Tue, Jul 09, 2013 at 06:34:20PM +0530, Laxman Dewangan wrote:
> This patch series does following:
> - Remove unused member from extcon palmas structure.
> - Fix to support of detecting cable properly with multiple insert/removal.
> - Add support for suspend/resume functionlaity and wakup from suspend.
> - Option to select/de-select the ID or VBUS detection.
> 
> Laxman Dewangan (4):
>   extcon: palmas: remove unused member from palams_usb structure
>   extcon: palmas: enable ID_GND and ID_FLOAT detection always
>   extcon: palams: add support for suspend/resume
>   extcon: palmas: Option to disable ID/VBUS detection based on platform
> 
>  .../devicetree/bindings/extcon/extcon-palmas.txt   |    2 +
>  drivers/extcon/extcon-palmas.c                     |  111 ++++++++++++++------
>  include/linux/mfd/palmas.h                         |    9 +-
>  3 files changed, 86 insertions(+), 36 deletions(-)
> 

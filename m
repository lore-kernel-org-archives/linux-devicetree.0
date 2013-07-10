From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH V2 0/4] extcon: palmas: clean-up/fixes and suspend/resume
 susupport
Date: Wed, 10 Jul 2013 15:57:41 +0900
Message-ID: <51DD05E5.6030102@samsung.com>
References: <1373436959-32444-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1373436959-32444-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: myungjoo.ham@samsung.com, devicetree-discuss@lists.ozlabs.org, rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, gg@slimlogic.co.uk
List-Id: devicetree@vger.kernel.org

On 07/10/2013 03:15 PM, Laxman Dewangan wrote:
> This patch series does following:
> - Remove unused member from extcon palmas structure.
> - Fix to support of detecting cable properly with multiple insert/removal.
> - Add support for suspend/resume functionlaity and wakup from suspend.
> - Option to select/de-select the ID or VBUS detection.
> 
> Changes from V1:
> - Correct the display message.
> - Add ack from Graeme
> 
> Laxman Dewangan (4):
>   extcon: palmas: remove unused member from palams_usb structure
>   extcon: palmas: enable ID_GND and ID_FLOAT detection always
>   extcon: palams: add support for suspend/resume
>   extcon: palmas: Option to disable ID/VBUS detection based on platform
> 

Patch 1/2/3 is only applied on extcon-linus branch.

I replied about patch4.

Thanks,
Chanwoo Choi


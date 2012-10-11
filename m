From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/15] pinctrl: samsung: Detect and handle unsupported
 configuration types
Date: Thu, 11 Oct 2012 15:57:32 +0200
Message-ID: <CACRpkdbRNfic7LYkcRWQSJjWop+OH7ap_z0UpPco6+m_AASYPA@mail.gmail.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
	<1349943081-27939-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1349943081-27939-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 11, 2012 at 10:11 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch modifies the pinctrl-samsung driver to detect when width of a
> bit field is set to zero (which means that such configuraton type is not
> supported) and return an error instead of trying to modify an inexistent
> register.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

I'm quite happy with these 17 patches, but I'd like to have Thomas
Abraham's definitive ACK before I merge anything.

Yours,
Linus Walleij

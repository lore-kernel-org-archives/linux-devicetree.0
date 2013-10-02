From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: palmas: remove pin config BIAS_PULL_PIN_DEFAULT
 support
Date: Wed, 02 Oct 2013 10:11:31 -0600
Message-ID: <524C45B3.8010109@wwwdotorg.org>
References: <1380713832-24488-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380713832-24488-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

On 10/02/2013 05:37 AM, Laxman Dewangan wrote:
> Palmas devices do not support the default bias configuration
> and hence removing this option from valid pin config parameters.

Acked-by: Stephen Warren <swarren@nvidia.com>

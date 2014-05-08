From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 3/4] of/platform: fix device naming for non-translatable
 addresses
Date: Thu, 08 May 2014 14:47:34 +0300
Message-ID: <1399549654.8165.1.camel@iivanov-dev>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com>
	 <1399499298-8830-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399499298-8830-4-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Josh Cartwright <joshc@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn@kryo.se>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-05-07 at 16:48 -0500, Rob Herring wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Using non-translatable addresses in platform device names is wrong
> because they may not be globally unique. Just use the default naming with
> a global index if the address cannot be translated instead.
> 
> of_can_translate_address has the same checks as of_translate_address, so
> we can remove it here as well.
> 
> Reported-by: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> Cc: Josh Cartwright <joshc@codeaurora.org>
> Cc: Courtney Cavin <courtney.cavin@sonymobile.com>
> Cc: Bjorn Andersson <bjorn@kryo.se>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks. It works for me. 

Tested-by: Ivan T. Ivanov <iivanov@mm-sol.com>

Regards.

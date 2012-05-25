From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 5/6] of: add of_parse_phandle_with_args_ext function
Date: Fri, 25 May 2012 10:50:43 -0600
Message-ID: <4FBFB863.7060601@wwwdotorg.org>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com> <1337952980-14621-5-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337952980-14621-5-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 05/25/2012 07:36 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> The api is used when user wants to get some more extended args except ones
> indicated by the cells_name.
> For example, gpio cells is 2.
> list = <&gpio 1 2 3 4>;

I assume either that property should be named "gpios", or ...

> If users want to get extended args including 3, 4, he can call:
> of_parse_phandle_with_args_ext(np, "gpios", "#gpio-cells", index, 2, &outargs);

The second parameter above should be "list".

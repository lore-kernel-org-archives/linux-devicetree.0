From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
Date: Thu, 16 Nov 2017 23:32:25 +0300
Message-ID: <d3ac29e8-8138-17fc-4863-2ae4f702130f@cogentembedded.com>
References: <20171116201842.006310882@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/16/2017 11:18 PM, Sergei Shtylyov wrote:

> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:

    Later, of course. Could be fixed while committing, I guess?

> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
> 
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei

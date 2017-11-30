From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
Date: Thu, 30 Nov 2017 14:38:50 +0100
Message-ID: <CACRpkda3+dBT60i0M1Fjaa1sxJuxFpKidCC2M9YxozMNkAVTcg@mail.gmail.com>
References: <20171116201842.006310882@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 9:18 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
>
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied with Rob's ACK.

Thanks for spotting this in time.

Yours,
Linus Walleij

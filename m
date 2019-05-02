From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: unittest: Remove error printing on OOM
Date: Thu, 2 May 2019 16:41:34 -0500
Message-ID: <CAL_JsqKrjmE9_huT-ViKhCo1mFbHka6reVKzo9Z1qJL0u3x2-g@mail.gmail.com>
References: <20190502124535.6292-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502124535.6292-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2019 at 7:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is no need to print a backtrace or other error message if
> kzalloc(), kmemdup(), or devm_kzalloc() fails, as the memory allocation
> core already takes care of that.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/unittest.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Applied both patches.

Rob

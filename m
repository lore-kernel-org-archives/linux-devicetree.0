From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH -next] of: platform: fix OF node refcount leak
Date: Thu, 18 Jan 2018 08:57:15 -0600
Message-ID: <CAL_Jsq+8--gN+b3mqYFYVCa2Fqgcuyic9tHQtXxumnoO3azD1g@mail.gmail.com>
References: <1516272219-25359-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516272219-25359-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loys Ollivier <lollivier@baylibre.com>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 18, 2018 at 4:43 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> We need to call of_node_put() for device nodes obtained with
> of_find_node_by_path().
>
> Fixes: 3aa0582fdb82 ("of: platform: populate /firmware/ node from of_platform_default_populate_init()")
> Reported-by: Loys Ollivier <lollivier@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/of/platform.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Hi Rob,
>
> You had Acked the original patch and it's queued via ARM SoC. So can you
> please provide ack on this if you are OK with the change.

Acked-by: Rob Herring <robh@kernel.org>

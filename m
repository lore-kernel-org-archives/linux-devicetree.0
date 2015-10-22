From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/4] add missing of_node_put
Date: Thu, 22 Oct 2015 10:08:36 -0500
Message-ID: <CAL_Jsq+MsKSF4r8S50YYaQYH0N0SzQZHJ0sSW6eHK_XXdvAmnQ@mail.gmail.com>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 4:02 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The various for_each device_node iterators performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.

> ---
>
>  drivers/of/irq.c      |    7 +++++--
>  drivers/of/overlay.c  |    5 ++++-
>  drivers/of/platform.c |    8 ++++++--
>  drivers/of/unittest.c |    8 ++++++--
>  4 files changed, 21 insertions(+), 7 deletions(-)

Series applied, thanks.

Rob

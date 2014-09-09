From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH] regulator: mc13xxx: add missing of_node_get()
Date: Tue, 9 Sep 2014 19:11:46 +0800
Message-ID: <CAFRkauBhzHot9=z-Jv-rvdLaSWSfyYSULMKqcVX+tiHcXrxt_g@mail.gmail.com>
References: <1410260825-21667-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410260825-21667-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2014-09-09 19:07 GMT+08:00 Guodong Xu <guodong.xu@linaro.org>:
> mc13xxx_parse_regulators_dt() goes through dt tree to search for regulator
> sub-nodes. For each matched node, later on it will be used and registered
> into a regulator_dev.
>
> of_node_get() should be called to increase its refcount.

I think it's done by regulator core:

commit 63c7c9e16c8e92cc069854f2babdf82d2d38e4c7
regulator: core: Get and put regulator of_node

Regards,
Axel

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/10] drm/hisilicon: Add hisilicon DRM master driver
Date: Thu, 3 Dec 2015 10:21:13 -0600
Message-ID: <CAL_Jsq+cr7sQ1eus8Yi-mCMDq9PCZbFTSoPqt9P4a_m-JGKo0g@mail.gmail.com>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org> <1448707145-69348-4-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1448707145-69348-4-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>, Andy Green <andy.green@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, w.f@huawei.com, Chen Feng <puck.chen@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Xinwei
List-Id: devicetree@vger.kernel.org

On Sat, Nov 28, 2015 at 4:38 AM, Xinliang Liu <xinliang.liu@linaro.org> wrote:
> Add DRM master driver for hi6220 SoC which used in HiKey board.
> Add dumb buffer feature.
> Add prime dmabuf feature.
>
> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Signed-off-by: Andy Green <andy.green@linaro.org>
> ---

> +static int hisi_gem_cma_dumb_create(struct drm_file *file,
> +                                   struct drm_device *dev,
> +                                   struct drm_mode_create_dumb *args)
> +{
> +       int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);

BTW, is args->bpp supposed to be bits or bytes? I'm using your dumb bo
support in drm_gralloc which does bytes as that is what
gralloc_drm_get_bpp returns. The virtio-gpu driver does bits. I'm
guessing bits is correct.

Rob

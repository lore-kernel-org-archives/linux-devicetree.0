From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Thu, 14 Apr 2016 15:06:27 +0100
Message-ID: <CACvgo50ku9FZJU4YqdFsa6_=FqeDsq2UiCZkSVTLuTKsPRf7qw@mail.gmail.com>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
	<1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>
	<20160414131013.GA32237@ulmo.ba.sec>
	<570F9E4D.7040401@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <570F9E4D.7040401@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Thierry Reding <treding@nvidia.com>, devicetree <devicetree@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, drinkcat@chromium.org, Dan Carpenter <dan.carpenter@oracle.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,

On 14 April 2016 at 14:42, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> The patch was implemented first without OR'ing error codes. The reason why I
> changed this is because I received the comments that checking the error on
> every regmap_* didn't help the readability of the driver and is likely to
> not fail if the first call doesn't fail.
>
> For example, originally the code was like this:
>   http://pastebin.com/rPgyji8k
> but I changed to this
>   http://pastebin.com/rPgyji8k
>
Both links are the same ;-) But I believe we all get what you meant.

Just a side note: many other drivers in DRM subsystem, inconsistently
check the return value of the regmap API. Note sure how likely is any
of it [regmap_foo] to fail and/or how determined people are to handle
every possible error case.

-Emil

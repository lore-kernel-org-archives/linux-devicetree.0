From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: Re: [PATCH 4/4] drm/meson: convert to the new canvas module
Date: Fri, 10 Aug 2018 08:35:58 +0200
Message-ID: <CAHStOZ6oemCwYWb7dW6SS_ZaWEiVWSfrF=dB_G6CkVb6KS96nA@mail.gmail.com>
References: <20180801185128.23440-1-maxi.jourdan@wanadoo.fr>
 <20180801185128.23440-5-maxi.jourdan@wanadoo.fr> <5b6cc316.1c69fb81.682d3.1216@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b6cc316.1c69fb81.682d3.1216@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Maxime Jourdan <maxi.jourdan@wanadoo.fr>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2018-08-10 0:41 GMT+02:00 Rob Herring <robh@kernel.org>:
> Hi, this is an automated email from Rob's (experimental) review bot. I
> found a couple of common problems with your patch. Please see below.
>
> On Wed,  1 Aug 2018 20:51:28 +0200, Maxime Jourdan wrote:
>> This removes the meson_canvas files within the meson/drm layer
>> and makes use of the new canvas module that is referenced in the dts.
>>
>> Canvases can be used by different IPs and modules, and it is as such
>> preferable to rely on a module that can safely dispatch canvases on
>> demand.
>>
>> Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
>
> The preferred subject prefix is "dt-bindings: <binding dir>: ...".
>
>> ---
>>  .../bindings/display/amlogic,meson-vpu.txt    |  9 +--
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  7 +-
>>  drivers/gpu/drm/meson/Kconfig                 |  1 +
>>  drivers/gpu/drm/meson/Makefile                |  2 +-
>>  drivers/gpu/drm/meson/meson_canvas.c          | 70 -------------------
>>  drivers/gpu/drm/meson/meson_canvas.h          | 42 -----------
>>  drivers/gpu/drm/meson/meson_crtc.c            |  5 +-
>>  drivers/gpu/drm/meson/meson_drv.c             | 35 ++++++----
>>  drivers/gpu/drm/meson/meson_drv.h             |  5 +-
>>  drivers/gpu/drm/meson/meson_plane.c           |  3 +-
>>  drivers/gpu/drm/meson/meson_viu.c             |  1 -
>>  11 files changed, 39 insertions(+), 141 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.c
>>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.h
>>
>
> DT bindings (including binding headers) should be a separate patch. See
> Documentation/devicetree/bindings/submitting-patches.txt.
>

Hi, What's the standard procedure here ? The reason I kept
devicetree+drm changes together is because I didn't want to have
floating commits that would break the drm module.

Should I split the changes anyway ?

Maxime

From: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 1/4] drm: rockchip: introduce rk3066 hdmi
Date: Tue, 12 Mar 2019 19:49:08 +0100
Message-ID: <CA+z=w3XtC-_rJsE5oYKzQdiXteHyCYM2ya1Q+unRO2UBDz9BHw@mail.gmail.com>
References: <20190306224113.24853-1-jbx6244@gmail.com> <20190306224113.24853-2-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306224113.24853-2-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Would like to add some "Tested-by:" tags.
Is Rockchip or someone with RK3066 hardware able to test this patch
with a HDMI TV or DVI monitor and give a report?

Power domain doesn't seem to turn off the vop and hdmi in v5.0-rc8.
The bug is due to a patch revert earlier this year.
To shutdown MK808 one can continue to use the patch at the link below until this
issue is fixed by them.

drm/rockchip: shutdown drm subsystem on shutdown
https://patchwork.kernel.org/patch/10556151/

[for-4.20] Revert "drm/rockchip: Allow driver to be shutdown on reboot/kexec"
https://patchwork.kernel.org/patch/10714725/

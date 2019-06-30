From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/4] drm+dt+efi: support devices with multiple possible panels
Date: Sun, 30 Jun 2019 14:05:21 -0700
Message-ID: <CAF6AEGvA-wVyC4jJC-nZU-pdVH=KYtye9twDgup-Nq0C_+wtvQ@mail.gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630204723.GH7043@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630204723.GH7043@pendragon.ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, aarch64-laptops@lists.linaro.org, Rob Clark <robdclark@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Julien Thierry <julien.thierry@arm.com>, "open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Steve Capper <steve.capper@arm.com>, Will Deacon <will@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 30, 2019 at 1:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Sun, Jun 30, 2019 at 01:36:04PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Now that we can deal gracefully with bootloader (firmware) initialized
> > display on aarch64 laptops[1], the next step is to deal with the fact
> > that the same model of laptop can have one of multiple different panels.
> > (For the yoga c630 that I have, I know of at least two possible panels,
> > there might be a third.)
>
> I have to ask the obvious question: why doesn't the boot loader just
> pass a correct DT to Linux ? There's no point in passing a list of
> panels that are not there, this seems quite a big hack to me. A proper
> boot loader should construct the DT based on hardware detection.

Hi Laurent,

Actually the bootloader on these devices is passing *no* dt (they boot
ACPI, we are loading dtb from grub currently)

I think normally a device built w/ dt in mind would populate
/chosen/panel-id directly (rather than the way it is currently
populated based on reading an efi variable prior to ExitBootServices).
But that is considerably easier ask than having it re-write of_graph
bindings.  Either way, we aren't in control of the bootloader on these
devices, so it is a matter of coming up with something that works on
actual hw that we don't like rather than idealized hw that we don't
have ;-)

BR,
-R

From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 5/6] dts, arm64: Move dts files to vendor subdirs
Date: Fri, 5 Sep 2014 07:46:19 -0500
Message-ID: <CAL_JsqLJ+zuqx9RELw3p2Pa13QuXsDR3Fv1Qcaeqk+R6HXy9uQ@mail.gmail.com>
References: <1409899692-1455-1-git-send-email-rric@kernel.org> <1409899692-1455-6-git-send-email-rric@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1409899692-1455-6-git-send-email-rric@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Robert Richter <rric@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 5, 2014 at 1:48 AM, Robert Richter <rric@kernel.org> wrote:
> From: Robert Richter <rrichter@cavium.com>
>
> Moving dts files to vendor subdirs.
>
> Signed-off-by: Robert Richter <rrichter@cavium.com>
> ---
>  arch/arm64/boot/dts/Makefile                     |   4 +-
>  arch/arm64/boot/dts/apm-mustang.dts              |  34 --
>  arch/arm64/boot/dts/apm-storm.dtsi               | 425 -----------------------
>  arch/arm64/boot/dts/apm/Makefile                 |   5 +
>  arch/arm64/boot/dts/apm/apm-mustang.dts          |  34 ++
>  arch/arm64/boot/dts/apm/apm-storm.dtsi           | 425 +++++++++++++++++++++++
>  arch/arm64/boot/dts/arm/Makefile                 |   6 +
>  arch/arm64/boot/dts/arm/foundation-v8.dts        | 232 +++++++++++++
>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 159 +++++++++
>  arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi | 240 +++++++++++++
>  arch/arm64/boot/dts/foundation-v8.dts            | 232 -------------
>  arch/arm64/boot/dts/rtsm_ve-aemv8a.dts           | 159 ---------
>  arch/arm64/boot/dts/rtsm_ve-motherboard.dtsi     | 240 -------------
>  13 files changed, 1103 insertions(+), 1092 deletions(-)

This should be sent with renames enabled (-M option). You can enable
it by default with this in your git config:

[diff]
        renames = true

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

Rob

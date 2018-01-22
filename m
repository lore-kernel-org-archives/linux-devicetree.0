From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V4 1/5] bindings: regulator: added support for suspend states
Date: Mon, 22 Jan 2018 13:50:35 -0600
Message-ID: <CAL_JsqJy1o7cjEqs8vYe7Y45W6_A8iyC3_4=eeZ-teCxR06Rqg@mail.gmail.com>
References: <1515752305-15907-2-git-send-email-zhang.chunyan@linaro.org> <1516607961-379-1-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516607961-379-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 22, 2018 at 1:59 AM, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
> Some systems need to set regulators to specific states when they enter
> low power modes, especially around CPUs. There are many of these modes
> depending on the particular runtime state.
>
> Currently the regulator consumers are not granted permission to change
> suspend state of regulator devices, the constraints are configured at
> startup.  In order to allow changes in a vlotage range, we need to add
> new properties for voltage range and a flag to give permission to
> change the suspend voltage and suspend on/off in suspend mode.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

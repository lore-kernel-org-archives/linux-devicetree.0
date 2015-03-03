From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH 0/2] Enable DRM/KMS support for STiH407 and STiH410 boards
Date: Tue, 3 Mar 2015 11:10:30 +0100
Message-ID: <54F58896.5010407@st.com>
References: <1421250432-25903-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421250432-25903-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, benjamin.gaignard@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org


On 01/14/2015 04:47 PM, Gabriel FERNANDEZ wrote:
> This patch-set Enable DRM/KMS support for STiH407-b2120 and STiH410-b2120 boards.
>
> This patch-set replace the previous one (PATCH 0/2] Enable DRM/KMS support for STiH407 Family boards)
>
> Gabriel Fernandez (2):
>    ARM: DT: STiH407: Add DRM dt nodes
>    ARM: DT: STiH410: Add DRM dt nodes
>
>   arch/arm/boot/dts/stih407-b2120.dts  |   3 +-
>   arch/arm/boot/dts/stih407.dtsi       | 151 +++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stih410.dtsi       | 138 ++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stihxxx-b2120.dtsi |   2 +-
>   4 files changed, 291 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm/boot/dts/stih407.dtsi
>
Forgot to reply to this series:

Applied, and already in v4.0-rc1.

Thanks,
Maxime

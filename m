From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/6] Add STiH407 SoC and reference board support
Date: Wed, 12 Mar 2014 15:20:30 +0100
Message-ID: <CACRpkdboBkzcJC35-BNvVYmS_t9Cd204AVz4rZasKtNJp0yE4g@mail.gmail.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 9:50 AM, Maxime COQUELIN <maxime.coquelin@st.com> wrote:

> This series adds basic support to the STMicroelectronics STiH407 SoC and its
> B2120 reference board. The STiH407 is a dual-core ARM Cortex-A9 CPU aimed at
> STB market.
>
> Changes since v3:

I've applied the pinctrl changes to the pinctrl tree, please push all the
DTS[i] changes through ARM SoC.

There is no need to keep DTS and subsystem changes in sync as
the DTS'es are supposed to be maintained in separation in the
future anyway.

Yours,
Linus Walleij

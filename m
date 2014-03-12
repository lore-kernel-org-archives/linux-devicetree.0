From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v4 0/6] Add STiH407 SoC and reference board support
Date: Wed, 12 Mar 2014 16:26:26 +0100
Message-ID: <53207CA2.4090309@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com> <CACRpkdboBkzcJC35-BNvVYmS_t9Cd204AVz4rZasKtNJp0yE4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdboBkzcJC35-BNvVYmS_t9Cd204AVz4rZasKtNJp0yE4g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 03/12/2014 03:20 PM, Linus Walleij wrote:
> On Wed, Mar 12, 2014 at 9:50 AM, Maxime COQUELIN <maxime.coquelin@st.com> wrote:
>
>> This series adds basic support to the STMicroelectronics STiH407 SoC and its
>> B2120 reference board. The STiH407 is a dual-core ARM Cortex-A9 CPU aimed at
>> STB market.
>>
>> Changes since v3:
>
> I've applied the pinctrl changes to the pinctrl tree, please push all the
> DTS[i] changes through ARM SoC.
As mentioned in the cover-letter, the DTS changes are based on arm_soc's 
for-next branch.

Do you mean I should send a pull request for these three patches?


>
> There is no need to keep DTS and subsystem changes in sync as
> the DTS'es are supposed to be maintained in separation in the
> future anyway.
>

Understood.

Thanks,
Maxime
> Yours,
> Linus Walleij
>

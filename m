From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value
 for number of delays
Date: Wed, 12 Mar 2014 15:19:06 +0100
Message-ID: <CACRpkdYBZKcuyNyD08K00COLXPYd7HRrapNaWLAW9SK7o0OVaQ@mail.gmail.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
	<1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 9:50 AM, Maxime COQUELIN <maxime.coquelin@st.com> wrote:

> This patch replaces the raw values with ARRAY_SIZE for assigning the
> ninput_delays and noutput_delays fields of STiH416's st_pctl_data struct.
>
> CC: Lee Jones <lee.jones@linaro.org>
> Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>

Patch applied!

Yours,
Linus Walleij

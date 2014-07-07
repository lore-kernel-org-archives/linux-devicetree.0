From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-st.c: Cleaning up if unsigned is less
 than zero
Date: Mon, 7 Jul 2014 17:42:37 +0200
Message-ID: <CACRpkdbZspN43QvMzaRSEeQzx4Z0dQSX-k-_7cbO=eGAXL8CXA@mail.gmail.com>
References: <1403782369-10201-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403782369-10201-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 1:32 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Remove checking if a unsigned is less than zero
>
> This was found using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Patch applied with the ACKs. Thanks!

Yours,
Linus Walleij

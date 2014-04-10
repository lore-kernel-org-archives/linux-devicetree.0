From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: msm: Correct interrupt code for TLMM v2
Date: Thu, 10 Apr 2014 18:07:58 +0200
Message-ID: <CACRpkdb3DD4r97jJbMV9d9=eZxFU8zSXu1eAGsM=ax+ebFDZ8g@mail.gmail.com>
References: <1396302597-31801-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396302597-31801-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 11:49 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> Acking interrupts are done differently between on v2 and v3, so add an extra
> attribute to the pingroup struct to let the platform definitions control this.
> Also make sure to start dual edge detection by detecting the rising edge.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Patch applied for fixes. Sorry for the delay.

Yours,
Linus Walleij

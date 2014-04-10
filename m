From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: msm: Make number of functions variable
Date: Thu, 10 Apr 2014 18:09:53 +0200
Message-ID: <CACRpkdaS7s44Szpu5eUVc-_DEDiGqer6FWc2VK-OUxTO4p-QKg@mail.gmail.com>
References: <1396302597-31801-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1396302597-31801-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 11:49 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> The various pins may have different number of functions defined, so make this
> number definable per pin instead of just increasing it to the largest one for
> all of the platforms.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Patch applied for next (v3.16)

Yours,
Linus Walleij

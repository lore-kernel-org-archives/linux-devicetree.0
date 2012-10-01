From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 00/16] pinctrl: samsung: Usability and extensibiltiy improvements
Date: Mon, 1 Oct 2012 08:58:32 +0200
Message-ID: <CACRpkdaDxy5py_+XW=YE+hur69QuYaZXfq-oAo-mGH7o6docPw@mail.gmail.com>
References: <1348842527-22460-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1348842527-22460-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2012 at 4:28 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This RFC series is a work on improving usability and extensibiltiy of the
> pinctrl-samsung driver. It consists of three main parts:
>  - moving SoC-specific data to device tree
>  - converting the driver to use one GPIO chip and one IRQ domain per pin bank
>  - introducing generic wake-up interrupt capability description

Overall this looks good to me.

Yours,
Linus Walleij

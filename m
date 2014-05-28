From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from DT files
Date: Wed, 28 May 2014 10:17:10 +0200
Message-ID: <CACRpkdYB5=sJZbcLFVMR5C391_HozGFQzNoUj6BRVzH03gBfkA@mail.gmail.com>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com>
	<1401172056-25743-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1401172056-25743-1-git-send-email-iivanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 27, 2014 at 8:27 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
>
> Add "power-source" property to generic options used for DT parsing files.
> This  enables drivers, which use generic pin configurations, to get the
> value passed to this property.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>

Patch applied. Cannot think of anything better anyway.

Yours,
Linus Walleij

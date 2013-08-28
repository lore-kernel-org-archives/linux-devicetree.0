From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: abx500: fix bitwise AND test
Date: Wed, 28 Aug 2013 14:32:54 +0200
Message-ID: <CACRpkdZtBjM8rnubhvCyyB7ZNdcsY+LD+xqsmXZMP2qZobz2_Q@mail.gmail.com>
References: <20130826160350.GE12428@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130826160350.GE12428@elgon.mountain>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2013 at 6:03 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The intent here was to test if the bit was set or not but there is a
> logical vs bitwise AND typo so it is true if any bits are set.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I can't compile this.

Works for me so patch applied.

Patrice: looks all right?

Yours,
Linus Walleij

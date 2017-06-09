From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: remove useless check
Date: Fri, 9 Jun 2017 10:03:43 +0200
Message-ID: <CACRpkdbp8MKdH5UzTZN5UExZupj5Bo7JVqfPAqgg3QYi4hjFqA@mail.gmail.com>
References: <1496221843-10697-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496221843-10697-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 11:10 AM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> There is no link between the number of elements of tab which contains all
> pin desc (located in each pinctrl-stm32xxxx.c files) and the pin number
> (defined in the tab).
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Patch applied.

Yours,
Linus Walleij

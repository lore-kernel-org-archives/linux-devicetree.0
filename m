From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/6] iio: trigger: add OF support
Date: Tue, 14 Mar 2017 16:22:54 +0100
Message-ID: <CACRpkdY9Xh8+Fe61ZQf6pa_ptNVaXj7DeTgtat4ZRNs3qzyGVA@mail.gmail.com>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488300679-3259-3-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 5:51 PM, Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Provide OF support. Device drivers can get IIO triggers from dt.
> Introduce IIO trigger specifiers, so there are:
> - IIO trigger providers, e.g. dt nodes designated with
>   #io-trigger-cells=<num of cells>
> - IIO trigger consumers, e.g. phandles listed in io-triggers = <...>.
>   Those can be identified by names by using 'io-trigger-names'.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This is very elegant.

Yours,
Linus Walleij

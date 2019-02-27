From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/9] pinctrl: Add STMFX GPIO expander Pinctrl/GPIO
 driver
Date: Wed, 27 Feb 2019 14:55:00 +0100
Message-ID: <CACRpkdaa4K3uoo7mXkLqjqbmP4qHfrbmqQuqc2fDCE3D=s_2Dw@mail.gmail.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <1551260094-32570-5-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551260094-32570-5-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 10:35 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> This patch adds pinctrl/GPIO driver for STMicroelectronics
> Multi-Function eXpander (STMFX) GPIO expander.
> STMFX is an I2C slave controller, offering up to 24 GPIOs.
> The driver relies on generic pin config interface to configure the GPIOs.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume Lee will merge the whole patch set through the MFD
tree.

Yours,
Linus Walleij

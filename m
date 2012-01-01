From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux
 mappings
Date: Sun, 1 Jan 2012 15:07:43 +0100
Message-ID: <CACRpkdbLMW-SXnr6hbpwMqG=-a0wmYtU+YnyR8uLsndUp=UBgQ@mail.gmail.com>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-3-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1324402840-32451-3-git-send-email-b29396@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linus.walleij@stericsson.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, kernel@pengutronix.de, cjb@laptop.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2011 at 6:40 PM, Dong Aisheng <b29396@freescale.com> wrote:

> From: Dong Aisheng <dong.aisheng@linaro.org>
>
> This patch provies a common API for driver to use to register pinmux
> mappings from dts file. It is needed for dt support.

Overall I feel lost in this discussion due to limited exposure to
device tree concepts. If I get Stephen Warrens and one of the
DT people's (Rob, Grant) ACK on this I'll be happy to merge it.

Until then, I guess it will need to be refined for the next kernel
cycle.

Yours,
Linus Walleij

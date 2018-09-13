From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] arm: dts: aspeed: quanta-q71l: Enable adc & ibt nodes
Date: Fri, 14 Sep 2018 08:59:59 +0930
Message-ID: <CACPK8XfH74Z1FYvWxU-vkxJ-APKG_w14dWMjLnj87eH-zrt02w@mail.gmail.com>
References: <20180904155329.258447-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180904155329.258447-1-venture@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Patrick Venture <venture@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 5 Sep 2018 at 01:23, Patrick Venture <venture@google.com> wrote:
>
> ADC node is disabled by default in 4.13 tree onward and
> needs to be enabled explicitly in separate device trees.
>
> ibt(ipmi-bt-host) node is disabled by default in 4.13 tree onward and
> needs to be enabled explicitly in separate device trees.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dt-for-v4.20 with a tweak to the commit message. (FYI: the
4.13 messages relate to the openbmc tree; the upstream tree introduced
these drivers earlier, and it has always been disabled in the dtsi).

Cheers,

Joel

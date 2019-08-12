From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: eeprom: at25: Add Anvo ANV32E61W
Date: Mon, 12 Aug 2019 08:43:35 +0200
Message-ID: <CAJKOXPf_uJUhNrciK1mFddN+gZ8vxtTEsz_uF7k60+EWYW94OA@mail.gmail.com>
References: <20190808172616.11728-1-krzk@kernel.org>
 <20190808172616.11728-2-krzk@kernel.org>
 <de032954-2b6e-5aa9-0d91-c37417c8e162@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <de032954-2b6e-5aa9-0d91-c37417c8e162@kontron.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "notify@kernel.org" <notify@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 8 Aug 2019 at 20:09, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> On 08.08.19 19:26, Krzysztof Kozlowski wrote:
> > Document the compatible for ANV32E61W EEPROM chip.
>
> This chip is actually not an EEPROM, but a SPI nvSRAM. It can be
> interfaced by the at25 driver similar to an EEPROM. This is not the
> ideal solution, but it works until there's a proper driver for such
> chips. Maybe you can add some of these details to the commit message
> here. Also there is more information on this topic here:
> https://patchwork.ozlabs.org/patch/1043950/.

Indeed, I'll correct the description of commit.

Best regards,
Krzysztof

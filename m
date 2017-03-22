From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/15] ARM: dts: imx: fix PCI bus dtc warnings
Date: Wed, 22 Mar 2017 08:53:34 -0500
Message-ID: <CAL_JsqKmbLP07zKN1SJAoe0xHjzjn80HQDRvqASXvhnUOBgAyA@mail.gmail.com>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-5-robh@kernel.org>
 <20170322081942.GM3443@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170322081942.GM3443@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 3:19 AM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Tue, Mar 21, 2017 at 09:03:03PM -0500, Rob Herring wrote:
>> dtc recently added PCI bus checks. Fix these warnings.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <kernel@pengutronix.de>
>> Cc: Fabio Estevam <fabio.estevam@nxp.com>
>
> Applied with a couple of changes below.

Thanks. BTW, forget to mention there's still one i.MX warning I did
not fix. It's with the "sky2@8" PCI device node. The unit address is
completely wrong. The comment says bus #8 which doesn't seem right
either. The unit address should be "<device num>[,<function]". There
should be a reg property which also has the bus number.

Rob

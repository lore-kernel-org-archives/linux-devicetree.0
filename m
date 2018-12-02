From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: add missing memory unit-address
Date: Mon, 3 Dec 2018 09:05:25 +1030
Message-ID: <CACPK8XeGny9xqQ7VUy033TEd9ybSV5GpN9wzSHT7itxqkH6dxA@mail.gmail.com>
References: <20181130015251.20754-1-robh@kernel.org>
 <20181130232040.z4i4sm5dsycxbmlu@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181130232040.z4i4sm5dsycxbmlu@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, arm <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, 1 Dec 2018 at 10:27, Olof Johansson <olof@lixom.net> wrote:
>
> On Thu, Nov 29, 2018 at 07:52:51PM -0600, Rob Herring wrote:
> > The base aspeed-g5.dtsi already defines a '/memory@80000000' node, so
> > '/memory' in the board files create a duplicate node. We're probably
> > getting lucky that the bootloader fixes up the memory node that the
> > kernel ends up using. Add the unit-address so it's merged with the base
> > node.
> >
> > Found with DT json-schema checks.
> >
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-aspeed@lists.ozlabs.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Might be better to just remove the node altogether from the SoC dtsi
> > file. It's only saving the device_type definition.
>
> Since I'm sweeping DT pull requests right now, and this is pretty
> straightforward, I've applied it to next/dt directly.

Thanks Rob and Olof.

Cheers,

Joel

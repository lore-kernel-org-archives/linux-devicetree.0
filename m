From: Rob Herring <robh+dt@kernel.org>
Subject: Re: Device Tree nodes ending with -supply
Date: Mon, 20 May 2019 14:46:11 -0500
Message-ID: <CAL_JsqJhBji40AnA=ND116N0+DkvzhX=Rt-wa=DX3Fd3uQRdAw@mail.gmail.com>
References: <20190520155127.cdc6dofoqckwsrrb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520155127.cdc6dofoqckwsrrb@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:51 AM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> I've noticed that you recently added support to validate the *-supply
> properties in the dt-schema tools.
>
> However, we have a family of PMIC that are exposing a bunch of power
> supplies (battery, AC, USB, etc) to know what is currently powering
> the board.
>
> All these various supplies are exposed as children nodes of the PMIC
> itself, and they are named *-power-supply. For an example, you can
> look at:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/axp209.dtsi#n56
>
> Now, those are obviously not properties, and yet the current dt-schema
> schemas are trying to validate them.
>
> I'm not really sure how to fix that. Changing the node names seems
> like an obvious solution, but they seem to be what they should be. Can
> we reduce the scope of the validation to only match properties (ie
> arrays?) and not the nodes (objects?)

While I'd prefer to avoid that node name, I fixed it with the fancy
new if/then schema:

  ".*-supply$":
    if:
      not: { type: object }
    then:
      $ref: "types.yaml#/definitions/phandle"

I'll push it out shortly.

Rob

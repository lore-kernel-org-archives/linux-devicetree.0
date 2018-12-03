From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: realview: Fix some more duplicate regulator
 nodes
Date: Mon, 3 Dec 2018 12:44:18 -0800
Message-ID: <CAOesGMjtw1Pgd=XcrjoJ1btJrsU2qr+-oFtCqe59COyyOyQ72w@mail.gmail.com>
References: <20181203191248.13067-1-robh@kernel.org>
 <CACRpkdZMf+HRu7T4ggzfjV-XktyQpQoKkrEDCmNjz0gxsk8JxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZMf+HRu7T4ggzfjV-XktyQpQoKkrEDCmNjz0gxsk8JxQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: LinusW <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 12:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Dec 3, 2018 at 8:12 PM Rob Herring <robh@kernel.org> wrote:
>
> > There's a bug in dtc in checking for duplicate node names when there's
> > another section (e.g. "/ { };"). In this case, skeleton.dtsi provides
> > another section. Upon removal of skeleton.dtsi, the dtb fails to build
> > due to a duplicate node 'fixedregulator@0'. As both nodes were pretty
> > much the same 3.3V fixed regulator, it hasn't really mattered. Fix this
> > by renaming the nodes to something unique. In the process, drop the
> > unit-address which shouldn't be present wtihout reg property.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Arm SoC folks: are you applying it directly like with the last
> one?

Yep, just did (but email didn't go out yet, I tend to batch them up).
Revisited and added your Reviewed-by though.


Thanks,

-Olof

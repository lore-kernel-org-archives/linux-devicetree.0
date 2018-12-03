From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: realview: Fix some more duplicate regulator
 nodes
Date: Mon, 3 Dec 2018 12:40:32 -0800
Message-ID: <20181203204032.lk5udkxngupowxfj@localhost>
References: <20181203191248.13067-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181203191248.13067-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 01:12:48PM -0600, Rob Herring wrote:
> There's a bug in dtc in checking for duplicate node names when there's
> another section (e.g. "/ { };"). In this case, skeleton.dtsi provides
> another section. Upon removal of skeleton.dtsi, the dtb fails to build
> due to a duplicate node 'fixedregulator@0'. As both nodes were pretty
> much the same 3.3V fixed regulator, it hasn't really mattered. Fix this
> by renaming the nodes to something unique. In the process, drop the
> unit-address which shouldn't be present wtihout reg property.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Sigh, not sure what happened, but I missed these 2 cases.

Applied to fixes. Thanks!


-Olof

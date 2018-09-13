From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix I2C bus warnings
Date: Fri, 14 Sep 2018 08:19:34 +0930
Message-ID: <CACPK8XcqwW93OU88UvovuzXG1h=u9y1708axdABhX+WruKnrOw@mail.gmail.com>
References: <20180913181245.25484-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-3-robh@kernel.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Sep 2018 at 03:42, Rob Herring <robh@kernel.org> wrote:
>
> dtc has new checks for I2C buses. The ASpeed dts files have a node named
> 'i2c' which causes a false positive warning. As the node is a 'simple-bus',
> correct the node name to be 'bus' to fix the warnings.

> ---
> Please apply to the sub-arch tree. The dtc changes haven't landed, but
> will for 4.20.

Applied to aspeed's dt-for-v4.20.

Thanks Rob.

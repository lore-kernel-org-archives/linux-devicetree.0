From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Wed, 21 Sep 2011 01:21:58 -0400 (EDT)
Message-ID: <20110921.012158.2252182592946972727.davem@davemloft.net>
References: <20110920.224910.1996429830782124690.davem@davemloft.net>
	<CACxGe6t7Mdr+w+aGFPM2-FEAQaYHuG8Za9dybLgMo-5-whLyNQ@mail.gmail.com>
	<4E796EE4.6070704@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4E796EE4.6070704@firmworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wmb@firmworks.com
Cc: dave.martin@linaro.org, linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Mitch Bradley <wmb@firmworks.com>
Date: Tue, 20 Sep 2011 18:58:12 -1000

> interrupt-parent has been part of the interrupt mapping spec from the
> inception of same.
> 
> http://www.openfirmware.info/docs/rec.intmap.d09.pdf

Thanks for the link.

In my vast collection of Sun OF dumps, I cannot find a single instance
where they've made use of this property, which is why I've never seen
it before.

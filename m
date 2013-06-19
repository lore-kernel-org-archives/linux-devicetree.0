From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: kernel: document ARM CPUs clock-frequency property
Date: Wed, 19 Jun 2013 11:27:50 +0100
Message-ID: <CAGVrzcY8oxZ7zUbThvXgsVyEGBCsxcvu4R0it_9s9wsKkJ3W0w@mail.gmail.com>
References: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
 <20130619100450.GA27181@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130619100450.GA27181@e106331-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "nico@linaro.org" <nico@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

2013/6/19 Mark Rutland <mark.rutland@arm.com>:
> On Wed, Jun 19, 2013 at 10:47:17AM +0100, Florian Fainelli wrote:
>> ARM CPU device tree nodes may contain an optional clock-frequency
>> property, when set, this property must contain the CPU frequency in Hz,
>> which is then used by the topology parsing code in
>> arch/arm/kernel/topology.c to infer the CPU capacity.
>
> I see that arch/arm/kernel/topology.c does a pr_err when clock-frequency isn't
> present. If we're documenting it as optional, should we not downgrade that or
> remove it entirely?

Good question. I think it might be good to just dowgrade the error to
a simple warning, we should clearly be fixing the binding if we have a
device_type = "cpu" property but no clock-frequency property.
--
Florian

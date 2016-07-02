From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/2] iio: sun4i-lradc: Add binding documentation
Date: Sat, 2 Jul 2016 15:35:28 +0200
Message-ID: <20160702133528.GC20045@piout.net>
References: <1467406855-9677-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAGb2v66PzgVqVGxs4FSQkkX=2hX42UmftahOgJmepv4wA-mwnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66PzgVqVGxs4FSQkkX=2hX42UmftahOgJmepv4wA-mwnw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-iio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Hans De Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2016 at 17:12:55 +0800, Chen-Yu Tsai wrote :
> Hi,
> 
> On Sat, Jul 2, 2016 at 5:00 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > Document the bindings for the Allwinner LRADC.
> 
> We already have Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> and I'm pretty sure Hans (CC-ed) argued that this is not a generic ADC
> block.
> 
> Any plans to reconcile the different bindings?
> 

Yes, I already submitted an adc-keys driver that can work with any ADC:
https://lkml.org/lkml/2016/7/1/670

I agree that because it is not yet handling interrupts and is polling
the ADC, it is not as good as sun4i-lradc-keys yet. My plan is to solve
that but it require significant work in iio.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

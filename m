From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/8] pinctrl: meson: add audio output pins
Date: Fri, 24 Mar 2017 22:23:30 +0100
Message-ID: <1490390610.29739.18.camel@baylibre.com>
References: <20170323165101.29262-1-jbrunet@baylibre.com>
 <m2wpbeh2pf.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m2wpbeh2pf.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-03-24 at 12:52 -0700, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > This patchset adds the pinctrl definition and the related device-tree
> > bindings of the i2s output and spdif output pins on the meson gxbb and
> > gxl SoCs.
> > 
> > This is part of the ongoing work to bring audio output suppot on the
> > meson family. It was tested on the gxbb p200 and gxl p230.
> 
> Series looks good to me,
> 
> However, I'm not sure about Linus's preference, but most maintainers
> (myself included) prefer a small description in the changelog, even if
> it restates (with slightly more description) what's already in the
> $SUBJECT.

Understood. thanks for pointing it out.
This series was going to clash with Neil's pinctrl fixes anyway.

I'll respin it taking this into account.

> 
> Kevin

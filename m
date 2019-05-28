From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 10/10] ARM: dts: r40: Change the RTC compatible
Date: Tue, 28 May 2019 11:47:56 +0800
Message-ID: <CAGb2v66bYFdv6=VUeQNvugMqOzg2L0dkgFbje7OE9pQC+FN0Fg@mail.gmail.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <834199999676fdb119f3aa1966eb1b1d1391f347.1558958381.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <834199999676fdb119f3aa1966eb1b1d1391f347.1558958381.git-series.maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 8:01 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Unlike what's being reported in the device tree so far, the RTC in the R40
> is quite different from the H3. Indeed it doesn't have the internal
> oscillator output, and it has only a single interrupt. Let's add a
> compatible for it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

There's a lot of unnecessary line reordering. Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>

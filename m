From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 09/10] ARM: dts: sun8i: v3s: Fix the RTC node
Date: Tue, 28 May 2019 11:47:14 +0800
Message-ID: <CAGb2v65UQtnN-dopOc8AcECFkCVHtaxtjgFiQ0+1OA_VUjKTuA@mail.gmail.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <632517d48479da8da8f665ed511c24757b6d488e.1558958381.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <632517d48479da8da8f665ed511c24757b6d488e.1558958381.git-series.maxime.ripard@bootlin.com>
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
> For some reason, while the v3s has a dedicated compatible in the RTC
> binding, the one actually used was the A31's. However, it turns out that
> the controller is pretty different (which justified the compatible).
>
> Let's use the proper compatible, and use the proper binding description as
> well.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

You may want to split out the clock-accuracy bits, since they are unrelated.

Otherwise, for both resulting patches,

Acked-by: Chen-Yu Tsai <wens@csie.org>

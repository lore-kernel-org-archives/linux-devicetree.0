From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/2] ARM: dts: add the clock measurer on Meson8/Meson8b
Date: Sun, 17 Feb 2019 15:04:57 +0100
Message-ID: <CAFBinCAyWECka-kNxeM58prN8ArBW4ASwJL31umEJr7p4nAGYQ@mail.gmail.com>
References: <20190209002641.9105-1-martin.blumenstingl@googlemail.com>
 <7h4l94k655.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7h4l94k655.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Sat, Feb 16, 2019 at 12:02 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > The 32-bit Amlogic Meson SoCs also have a "clock measurer", just like
> > the newer 64-bit ones.
> >
> > Add the node of the clock measurer to meson8.dtsi and meson8b.dtsi
> > so we can see the measured clock frequencies in:
> > /sys/kernel/debug/meson-clk-msr/
>
> Queued up, probably for v5.2, unless I get one more late PR in
> (unlikely.)
that's fine for me - thank you!


Regards
Martin

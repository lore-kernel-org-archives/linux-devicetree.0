From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Tue, 12 Feb 2019 16:34:46 +0800
Message-ID: <CAGb2v66MHGrpFuA8eBKhVLXPcriwGb-o4_3jfyLJ4HwEBVD3GA@mail.gmail.com>
References: <20190201113743.10058-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201113743.10058-1-harald@ccbib.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 1, 2019 at 7:37 PM Harald Geyer <harald@ccbib.org> wrote:
>
> The TERES-I has internal speakers (left, right), internal microphone
> and a headset combo jack (headphones + mic).
>
> The headphone lines are multiplexed with the debug console.
> The headphone and mic detect lines of the A64 are connected properly,
> but AFAIK currently unsupported by the driver.
>
> Signed-off-by: Harald Geyer <harald@ccbib.org>
> ---
> Hi all,
>
> a couple of issues make this patch RFC:
>
> hpvcc-supply vs. cpvdd-supply:
> On the A64 manual the pin is called CPVDD and the binding documents
> requires a cpvdd-supply property. However in the actual driver and
> devicetrees so far hpvcc-supply is used. This is a very new binding,
> so we have the luxury to decide either way, I think. Any input from
> the devicetree maintainers would be appreciated.

Sorry about the screw-up. I'll send out patches fixing this once I
test them. The preferred name is CPVDD, as that is what the datasheet
uses.

ChenYu

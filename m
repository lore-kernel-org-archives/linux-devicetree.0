From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 5/5] ARM: dts: meson8b: Add support for the Endless Mini
 (EC-100)
Date: Fri, 14 Sep 2018 14:24:02 +0800
Message-ID: <CAD8Lp47sSFrv9QopqPn6Ohv-2aupeGbX_Bb2dBXubUzFqjK=-Q@mail.gmail.com>
References: <20180913202203.19636-1-martin.blumenstingl@googlemail.com>
 <20180913202203.19636-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913202203.19636-6-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Fri, Sep 14, 2018 at 4:22 AM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> The Endless Mini (EC-100) is a grapefruit-sized computer based on the
> Amlogic Meson8b (S805) SoC which comes in two variants.

Thanks for your work here, really happy to see this go by!

Would it be possible to adjust the compatible string to
"endless,ec100" without the hyphen to match what we've already been
shipping?

Just curious, is there now working USB and HDMI support in mainline on
this platform?

Thanks!
Daniel

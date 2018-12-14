From: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: Add sensors devices for Facebook
Date: Fri, 14 Dec 2018 18:11:21 +0000
Message-ID: <B6C3C92D-1F9E-4425-ABF5-718D1A6755EB@fb.com>
References: <20181213195319.1333402-1-vijaykhemka@fb.com>
 <CACPK8XfAXDHqWcD=OKm4UhCh-+-7GBxL02Fi9_jgdmo2ZQZSjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACPK8XfAXDHqWcD=OKm4UhCh-+-7GBxL02Fi9_jgdmo2ZQZSjg@mail.gmail.com>
Content-Language: en-US
Content-ID: <4CA366D04D0E184A82A8F707A9625F7F@namprd15.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Rob
 Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "james.feist@linux.intel.com" <james.feist@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 12/13/18, 2:56 PM, "Joel Stanley" <joel@jms.id.au> wrote:

    On Fri, 14 Dec 2018 at 06:23, Vijay Khemka <vijaykhemka@fb.com> wrote:
    >
    > Added ADC and other sensor devices in Facebook Tiogapass device tree.
    >
    > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
    > ---
    >  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 33 +++++++++++++++++--
    >  1 file changed, 31 insertions(+), 2 deletions(-)
    >
    > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
    > index f8e7b71af7e6..58bbe08d3ba7 100644
    > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
    > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
    > @@ -21,6 +21,25 @@
    >         memory@80000000 {
    >                 reg = <0x80000000 0x20000000>;
    >         };
    > +
    > +       iio-hwmon {
    > +               compatible = "iio-hwmon";
    > +               oemname0 = "MB_P3V3";
    > +               oemname1 = "MB_P5V";
    > +               oemname2 = "MB_P12V";
    > +               oemname3 = "MB_P1V05";
    > +               oemname4 = "MB_PVNN_PCH_STBY";
    > +               oemname5 = "MB_P3V3_STBY";
    > +               oemname6 = "MB_P5V_STBY";
    
    "oemname" isn't part of the upstream bindings. Is this something you
    have patches for?
This is a workaround field used by dbus-sensors application to avoid overlay for dynamic detection of devices based on json file definition.

Can you please also review other 3 patches in this series.

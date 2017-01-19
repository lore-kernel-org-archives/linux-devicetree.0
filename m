From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/5] meson-gx: reset RGMII PHYs and configure TX delay
Date: Thu, 19 Jan 2017 10:47:47 +0100
Message-ID: <1484819267.26620.75.camel@baylibre.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
 <m2a8ao1833.fsf@baylibre.com>
 <CAFBinCACbeZPRXQO4OA5mJdGRvMkQoUmQEAKCi8KU2ZvrspF6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCACbeZPRXQO4OA5mJdGRvMkQoUmQEAKCi8KU2ZvrspF6A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-18 at 20:40 +0100, Martin Blumenstingl wrote:
> Kevin,
> 
> On Wed, Jan 18, 2017 at 8:28 PM, Kevin Hilman <khilman@baylibre.com>
> wrote:
> > 
> > Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> > 
> > > 
> > > This partially fixes the 1000Mbit/s ethernet TX throughput issues
> > > (on
> > > networks which are not affected by the EEE problem, as reported
> > > here:
> > 
> > Based on the discussions with Jerome, I'm dropping this series from
> > the
> > v4.11/dt64 branch for now.
> what is you opinion on having the MDIO node in meson-gx (and keeping
> GXBB and GXL/GXM consistent) vs not having PHY autodetection for GXBB
> (= not having the MDIO in meson-gx)?
> I cannot send a v2 until we have a decision for this
> 
> > 
> > This series also had a small conflict with Jerome's fix[1] for the
> > odroid-c2, so please rebase any updates here on my v4.10/fixes
> > branch.
> will keep that in mind, noted.
Most this patch can go away with your patch.
Just make sure to keep "eee-broken-1000t;" in the odroidc2 dtsi and
it'll be OK.

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

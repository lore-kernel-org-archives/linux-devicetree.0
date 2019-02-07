From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 1/3] phy: meson8b-usb2: Enable otg phy controller on
 Meson8b SoCs
Date: Thu, 7 Feb 2019 12:11:15 +0530
Message-ID: <CANAwSgRVypZ2CyendeOGJ9MZ6X951EwPW3x8K=0mru_Pj1qMLg@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-2-linux.amoon@gmail.com>
 <CAFBinCCOQ_GqHZuYf6n8ba_ZMbOwKmUzc4EJAuXRpn4tTTCUKA@mail.gmail.com>
 <CANAwSgSQH2zta+tOcqnM3JPZ45XkqWEJAWOL3Do0Mnrbam8VSw@mail.gmail.com>
 <CAFBinCD_O7FEX5iLyo2BzqE1KcrmATaZMMq5pFr-Q7wnRBPziw@mail.gmail.com>
 <CANAwSgSh--pom9kmVBWejHwVHJNv2o4Ta93wabR3Ak=f3V4JbQ@mail.gmail.com>
 <CAFBinCAhjo4ueh6UDE+TKiF8Vc2Pz2JsjzcVsrsPQMU=ZEiLwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCAhjo4ueh6UDE+TKiF8Vc2Pz2JsjzcVsrsPQMU=ZEiLwQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Wed, 6 Feb 2019 at 17:18, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Feb 5, 2019 at 8:52 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > personally I would start with getting device / peripheral mode working for usb0.
> > > if you're lucky the PHY driver will work without any changes and you
> > > only need to set the correct dr_mode along with the g-* properties.
> > >
> >
> > Yes that should be the goal on getting working usb0 phy and otg port.
> > So for now we will drop this patch and disable the usb_phy0 mode in
> > dts for Odroid c2
> > in order to get ride of the power failed WARNING.
> I checked Kevin's Odroid-C2 (GXBB) on Kernel CI and I can't see any
> power failed warning: [0]
>
> > When we get the usb0 node to work again with good phy configuration and
> > tuning we can re-enable the nodes. I will try to look into this in the future.
> >
> > Can you share your thought on this.
> sounds good to me! especially because it would give us OTG support on
> Meson8, Meson8b, Meson8m2 and GXBB (because these SoCs are sharing the
> same USB implementation)!
>
> I see four challenges:
> 1. getting host mode working on the micro USB port. you have already
> proven that you can do this :)
> 2. getting peripheral mode working on the micro USB port. my hope is
> that it's only about setting the right dr_mode and the g-* properties
> on the usb0 node (but I haven't tried this)
> 3. make OTG detection work and integrate it with dwc2. I would consult
> the dwc2 maintainers to see what can be done
> 4. bring everything together, making sure that one feature doesn't break another
>

Thanks for the feedback!
I will give this a try, In case I am stuck I will ask to you help.

>
> Regards
> Martin
>
>
> [0] https://storage.kernelci.org/next/master/next-20190130/arm64/defconfig/lab-baylibre-seattle/boot-meson-gxbb-odroidc2.html

Not a issue If I could reproduce my  kernel warning consistently again
I will share the boot log and the step I followed.
I will be dropping my patch for the initialization of usb0_phy untill
correct solution is-found.

Best Regards
-Anand

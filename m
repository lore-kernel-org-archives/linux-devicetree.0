From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
Date: Sun, 17 Feb 2019 15:26:46 +0100
Message-ID: <CAFBinCALfZ4HbBdyXjMqFX-HyJtTyOU_FgW18+jK4cW4Svfenw@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
 <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
 <CANAwSgQ4=Vn6RM4Kpd20UWkQNW81=mfg-qB0G73dsRem3qwjcA@mail.gmail.com>
 <CAFBinCB=3kmuFb_xXzhW+m8dTasVrCHQp2wti+=5UjrAHk5TTg@mail.gmail.com>
 <CANAwSgQnMkXECkCVjFKwNKB+2JoiPtVPQbateppmtgfPYCutZg@mail.gmail.com>
 <CAFBinCCFoBkbf-HvEoMk7mTYTBV27nJ9TF1X-DrLuHR9qDVDSA@mail.gmail.com>
 <CANAwSgRtBWzKiFLUV6twxv+TnvjLdHXv=U8+ppQ7=9uBBLEH+Q@mail.gmail.com>
 <CAFBinCD_Pddu+pBEKwMS6467J5nxKF4T5-LxVo06nFvyUSLpew@mail.gmail.com>
 <CANAwSgSQRwF+_VR1jJFg=Q9wSdanEH0GmnFaeegt=hRMXiHX3Q@mail.gmail.com>
 <CAFBinCBwDg21t+HT6w7CcUgH_aDuwh-UgoPs7GuZo9rABvPDig@mail.gmail.com>
 <CANAwSgRKgWCyNoDUxrK4asjZ_6z77Rew2nGCg1Yq9m3pi0Amrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANAwSgRKgWCyNoDUxrK4asjZ_6z77Rew2nGCg1Yq9m3pi0Amrw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Emiliano Ingrassia <ingrassia@epigenesys.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Mon, Feb 11, 2019 at 4:09 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Can we have other people who can test both the approach for
> *vbus-supply* vs *phy-supply* setting.
> Then we can conclude on the correct approach.
this is a good idea. do we focus on the 4x USB host ports for this
test or also on the OTG port?

my test-setup so far was:
- Odroid-C1+ board revision 0.4 20150615
- the board is powered using the micro USB port
- connect an USB thumb drive to one of the USB host ports

test-cases:
- an "unpatched" (in terms of USB power regulators) kernel
- using Anand's phy-supply = <&usb_vbus>; inside the usb1_phy node
- using vbus-supply = <&usb_vbus>; inside the usb1 node

in all thee scenarios the LED of my thumb drive did not light up and
there was nothing in the kernel log. also lsusb -vv didn't show
anything.

Anand, do you have any other test-case in mind that we need to check?

I CC'ed Emiliano because he initially added USB support to
meson8b-odroidc1.dts (that was before I got my own Odroid-C1+).
He can probably help us test on his board(s) as well.

> Honestly I am using power supply from dc jack rather than power via usb otg.
I don't have a plug which matches the little DC jack so I'm powering
my board using the micro USB connector.


Regards
Martin

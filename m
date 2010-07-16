From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Review Request: New proposal for device tree clock binding.
Date: Thu, 15 Jul 2010 22:45:11 -0600
Message-ID: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben (well, hello to everyone, but I'm particularly interested in
Ben's feedback),

Jeremy and I have been kicking around the clock binding, and we've
come up with a new proposal that doesn't feel quite as forced to me.
Please take a look and let me know what you think.  The link to the
binding is below[1], but I've also copied the full text so that you
can reply and comment.  The rational for the new binding can be found
in talk page[2].

[1] http://www.devicetree.org/ClockBindings
[2] http://www.devicetree.org/Talk:ClockBindings

---

This page descibes the proposed OF clock bindings. These are a
work-in-progress, and are based on some
[http://patchwork.ozlabs.org/patch/31551/ experimental work by benh].

==Clock providers==

Sources of clock signal can be represented by any node in the device
tree. A mandatory "<tt>clock-outputs</tt>" property describes the
clock outputs from this device.

{|border=1
!property
!format
!notes
|-
|<tt>clock-outputs</tt>
|list of strings
|specifies output clock signal names.
|}

For example:

    oscillator {
        clock-outputs = "ckil", "ckih";
    };

- this node defines a device with two clock outputs, the first named
"ckil" and the second named "ckih".  Consumer nodes always reference
clocks by name.  The names should reflect the clock output signal
names for the device.

==Clock consumers==

A device connected to a clock signal needs a *-clock property for each
clock that it is connected to.

{|border=1
!property
!format
!notes
|-
|<tt>*-clock</tt>
|1 cell phandle to the clock provider, followed by a string containing
the clock output name.
|The name of this property should be the name of the clock input
signal with a "-clock" suffix.
|}

<tt>*-clock</tt> is named for the signal name for the ''clock input''
of the device. it should describe the function of the signal for that
device, rather than the name of the system-wide clock line. For
example, a UART with two clocks - one for baud-rate clocking, and the
other for register clocking - may have clock input properties named
"baud-clock" and "register-clock".  The property value is a tuple
containing the phandle to the clock provider and the name of the clock
output signal.

For example:

    uart {
        baud-clock = <&osc>, "ckil";
        register-clock = <&ref>, "bus";
    };


This represents a device with two clock inputs, named "baud" and
"register". The baud clock is connected to the "ckil" output of the
"osc" device, and the register clock is connected to the "bus" output
of the "ref" device.

==Example==

    /* external oscillator */
    osc: oscillator {
        compatible = "fixed-clock";
        frequency  = <32678>;
        clock-outputs = "osc";
    };

    /* phase-locked-loop device, generates a higher frequency clock
     * from the external oscillator reference */
    pll: pll {
        compatible = "some-pll-interface"
        ref-clock = <&osc>, "osc";
        reg = <0x4c000 0x1000>;
        clock-outputs = "pll", "pll-switched";
    };

    /* UART, using the low frequency oscillator for the baud clock,
     * and the high frequency switched PLL output for register
     * clocking */
    uart {
        compatible = "fsl,imx-uart";
        reg = <0xa000 0x1000>;
        interrupts = <33>;
        baud-clock = <&osc>, "osc";
        register-clock = <&pll>, "pll-switched";
    };

This DT fragment defines three devices: an external oscillator to
provide a low-frequency reference clock, a PLL device to generate a
higher frequency clock signal, and a UART.

* The oscillator is fixed-frequency, and provides one clock output, named "osc".
* The PLL is both a clock provider and a clock consumer. It uses the
clock signal generated by the external oscillator, and provides two
output signals ("pll" and "pll-switched").
* The UART has its baud clock connected the external oscillator and
its register clock connected to the PLL clock (the second signal,
"pll-switched").

[[Category:Type:Clock]]

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

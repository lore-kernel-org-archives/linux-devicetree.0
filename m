From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] checkpatch: handle PCI/USB VID,PID in DT compatible
Date: Tue, 26 Feb 2019 16:31:51 -0600
Message-ID: <20190226223151.GA21838@bogus>
References: <20190223022440.146915-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190223022440.146915-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 06:24:40PM -0800, Brian Norris wrote:
> Documentation/devicetree/bindings/usb/usb-device.txt describes the
> 'usbVID,...' compatible format, where VID is lower-case hexadecimal,
> with leading zeroes suppressed. Allow it here without complaining about
> lack of documentation (we don't need a new entry for every ID).
> 
> PCI has a similar format
> Documentation/devicetree/bindings/pci/pci.txt
> http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> 
> For both, I try to detect something that's close to a VID,PID, but I
> intentionally don't parse beyond 4 characters of PID, since USB supports
> extending with an interface index, and PCI supports additional subystem
> IDs.

Now that we have DT schema, that would be a better place to check the 
formatting. So I'm fine with this, but going back to the simpler version 
would be fine too.

We will also be able to really check that compatibles are documented 
rather than just grepping the bindings for a compatible string.

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Overall, this got a little more unwieldy, but it works.
> 
> v2:
>  * Include PCI in addition to USB
>  * Add special warning for leading zeroes and for upper-case
>  * Move the VID,PID check up higher, so we don't complain about
>    documentation at all if using the correct format
> ---
>  scripts/checkpatch.pl | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

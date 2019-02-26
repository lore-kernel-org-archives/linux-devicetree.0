From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2] checkpatch: handle PCI/USB VID,PID in DT compatible
Date: Tue, 26 Feb 2019 15:53:50 -0800
Message-ID: <CA+ASDXP+fEM38ieCFdZjbjAAMqXw7F-K21rTcTLLhEAj7zNXjQ@mail.gmail.com>
References: <20190223022440.146915-1-briannorris@chromium.org> <20190226223151.GA21838@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226223151.GA21838@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 2:31 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Feb 22, 2019 at 06:24:40PM -0800, Brian Norris wrote:
> > Documentation/devicetree/bindings/usb/usb-device.txt describes the
> > 'usbVID,...' compatible format, where VID is lower-case hexadecimal,
> > with leading zeroes suppressed. Allow it here without complaining about
> > lack of documentation (we don't need a new entry for every ID).
> >
> > PCI has a similar format
> > Documentation/devicetree/bindings/pci/pci.txt
> > http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> >
> > For both, I try to detect something that's close to a VID,PID, but I
> > intentionally don't parse beyond 4 characters of PID, since USB supports
> > extending with an interface index, and PCI supports additional subystem
> > IDs.
>
> Now that we have DT schema, that would be a better place to check the
> formatting. So I'm fine with this, but going back to the simpler version
> would be fine too.
>
> We will also be able to really check that compatibles are documented
> rather than just grepping the bindings for a compatible string.

I'm mostly interested in removing checkpatch's false warnings, however
that's best accomplished. I'll leave it up to Joe whether I should
(re)simplify the patch. I could remove the new
"WARN("UNDOCUMENTED_DT_STRING"," stuff, but once I'm doing the VID/PID
parsing, that's really trivial, so *shrug*.

Brian

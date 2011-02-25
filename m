From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH] olpc_battery: bind to device tree
Date: Fri, 25 Feb 2011 14:19:33 +0000
Message-ID: <AANLkTi=2a=9=k+ZG46yqKOaHd9tCkJVm4QRxGmgbRzsv@mail.gmail.com>
References: <20110219150644.681D59D401D@zog.reactivated.net>
	<AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On 23 February 2011 20:34, Grant Likely <grant.likely@secretlab.ca> wro=
te:
> As mentioned in the other thread, matching by name is strongly
> discouraged. =A0It isn't very accurate and compatible is the preferre=
d
> method for binding devices. =A0'battery' in particular is highly
> non-specific.
>
> I do understand that you don't have a compatible property in the
> current firmware, and to a certain extent we have to live with what
> we're given by the kernel. =A0However, I think it would be better in =
the
> OLPC case to find the battery node and add a compatible property
> before registering a platform_device for it. =A0(or use a bus notifie=
r
> to tell you when it is registered, and add 'compatible' at that
> point.) =A0That way we the uncertainty is taken care of in the board
> support code without polluting the driver matching namespace.

Thanks for the review. This and the rest of your feedback makes sense.

Would you mind commenting on exactly how this should look?

Here are the changes i'm planning to make, both to the firmware and
with kernel code as you suggest to fixup device trees for systems with
old firmware:

/battery@0/compatible property added with value "olpc-battery" (XO-1 an=
d XO-1.5)
/pci/isa@f/rtc@i70/compatible property prepended with "olpc-xo1-rtc,"
(XO-1 only)
/pci/display@1,1/dcon device added, name=3Ddcon compatible=3Dolpc-dcon
(XO-1 and XO-1.5)

In addition to the battery patch you reviewed, we plan to make the
olpc-rtc and DCON drivers bind to device tree nodes, which is the
reason behind the other changes.

Daniel

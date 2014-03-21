From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 6/6] mfd: devicetree: bindings: add pm8xxx RTC
 description
Date: Fri, 21 Mar 2014 08:12:12 +0000
Message-ID: <20140321081212.GB15213@lee--X1>
References: <20140310151807.7274d58d3c50b884585244b6@linux-foundation.org>
 <1394644645-12818-1-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394644645-12818-1-git-send-email-joshc@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rtc-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

> The PM8xxx family of PMICs contain an RTC.  This RTC is described as =
a
> subnode of the PM8xxx.  Document these bindings, and replace the pwrk=
ey
> node in the example with the RTC, which is now described in this
> document.
>=20
> While we're here, add a short description to the device tree bindings
> describing what the the PM8xxx devices are and how they are expected =
to
> be used.
>=20
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> ---
> Andrew-
>=20
> Here's a new 6/6.  Like mentioned earlier, this is based on the curre=
nt MFD
> document that's in Lee's tree pending for 3.15.  It may be best to ge=
t yours
> and Rob's Ack and have Lee take it through his tree.

After discussing with Andrew, I think this is better to go through my
tree as you suggested, in order to mitigate any merge conflicts during
the merge window.

Patch applied to the MFD tree with Andrew's Ack, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
